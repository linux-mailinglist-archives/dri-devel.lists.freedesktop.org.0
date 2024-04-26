Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8588B3C06
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 17:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13CC10F0FB;
	Fri, 26 Apr 2024 15:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lbYTtkr7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A6D10F0FB;
 Fri, 26 Apr 2024 15:47:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0KqJKFl/shPr2vsvkef6Al9Ckz7RBX9kaVM+bI1lThYQnatdimkvND5HbdF4GHxKT0kf7sRJDNw20RU6jMAhDnLgnq/MoDgrOqJdeGahFNnwdDq/FXViCaxf2gu3Gqpn+gpZJ6dSOjmNz/NKzbHBJM/Y0SU12nA46U4CFpA4ESgN0w2JXdzyGjGBDvdswBR/utcUBihItBQuKG5RjRkeO3oj8zmlnlkiJT9XMSt2bLbc9JjVm8Cp/DoAertwOc/80GPQoUjx0DAnc6cgh0yYT0FgICkARvttys7V0yQjtO24pWyrHqHUdk6m4FbaHl42S6/8SUAhzQogsvxnGI5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pudmm8UV5WFEO8Ak78iR4Q341Zqs1WKWUvH2xgeqh9U=;
 b=CLyLUHJ2QEne7a6IW9Bg3yItrB3dfFCES9DQsbaLf6wuXNpWCkSmMJOz7GBdpXbNCq24zIpwwtHzDMCqrqqtQ8i2IhWNGRqmhy6VqRB7hAAGYwK69/wZdIDkC8SB5dQvB8m65f0E0l30LqrQEo0gdVLOw8j7ac/b4T1hrvJ3D6tL/rxf0XkNMgHsFEr1fD/VthlKr8pSFwLkjiof/h+L+J4zUO0u8duVbFbkY302fF7w5Mxq3/uK3qZumw2j4YVU6mIvg4te3JRQh0TVdkzYHhtpEVhupw7x+R+2cJqnXg7F04k4ATnh7PLMvvjRmlDYNKyrdKKu667w3YkD3unOKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pudmm8UV5WFEO8Ak78iR4Q341Zqs1WKWUvH2xgeqh9U=;
 b=lbYTtkr7dchkBLhtQcEz3OZ8HD1Lq212hOkh2+uvPK3ivCifOD8159eILFVO8xwOAcf0AXtLOJIu2ng29jkHwrOKrX+WVh6JsNLCcZAANITMHkcPOVY/uArVlJc7wa5x4cJBouNAHktwpRVlmksKMduO97vtZ1xc5J9FYsGXR65wabzTpLMcQRjyInqQFhtLPXRML2+2JNJCYfnw7eUcMXfjYAeC8EA2axdotAvziEHOYnzAEC5KMIO3y8O1IOyPqXQeLUDAyfYIRhzL0BnqVwav4fb0nEAUVfbh3vhzuQu5s+lU7jIuNU/Hpyp2GVWJIS85BOZ+Fzr/TVpVvYTRIQ==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by CY5PR12MB6299.namprd12.prod.outlook.com (2603:10b6:930:20::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 15:47:25 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::ac4b:38c3:29cd:519]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::ac4b:38c3:29cd:519%3]) with mapi id 15.20.7472.044; Fri, 26 Apr 2024
 15:47:25 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>
CC: "bskeggs@redhat.com" <bskeggs@redhat.com>, "kherbst@redhat.com"
 <kherbst@redhat.com>, "airlied@redhat.com" <airlied@redhat.com>,
 "justinstitt@google.com" <justinstitt@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "keescook@chromium.org" <keescook@chromium.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "dakr@redhat.com" <dakr@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm/nouveau/firmware: Fix SG_DEBUG error with
 nvkm_firmware_ctor()
Thread-Topic: [PATCH 1/2] drm/nouveau/firmware: Fix SG_DEBUG error with
 nvkm_firmware_ctor()
Thread-Index: AQHal/BQJmqqbJ/bCUu9Jrz4GZ2rNLF6si8A
Date: Fri, 26 Apr 2024 15:47:25 +0000
Message-ID: <4294e43a0165a36a063d74c7ef62fbdeb156f8c4.camel@nvidia.com>
References: <20240426154138.64643-1-lyude@redhat.com>
In-Reply-To: <20240426154138.64643-1-lyude@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|CY5PR12MB6299:EE_
x-ms-office365-filtering-correlation-id: 1a311e66-c073-4497-3e19-08dc66082b71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?U2txNWFPeFVxUXFUa3c5T0dvM3NxVnpValo4S2V4RkVZMnloWTdzZjI1bHc1?=
 =?utf-8?B?anNUNnFXc1NPT09CMk1ibk9pVG14SXIrNC83SVJZUmt6a3JXVWdBUENac2dE?=
 =?utf-8?B?U0dzVTllRU1CSU1LUE5NcGM5SHh5QndIaFpEcGhFRFhCUXM2TE5ySXZhd3Vl?=
 =?utf-8?B?ZTFib1FlSlZ5WWQwb24vc2xDeHNOeDI4T3FSZUpNeEsvTENYWG5NSlF1NUly?=
 =?utf-8?B?b3BWRlM4Z1VwMlMzZEFvVDZpTE5EN2k1RzZxbmM1SE4xeHFoMkpSUjY4dzJG?=
 =?utf-8?B?R1B0YTFzUkgvZXdYeFVRcy9pTHprSS9sODcrRFJibERoN3hHZ3ZycXA5YWZm?=
 =?utf-8?B?M1ZLa3k5UEpDVnBYczVySkhEM2YzOEI3M2F0c3MzbTV4Rjk4UkgrcVhwQUNZ?=
 =?utf-8?B?ckIweFNVcEZoVm0vd1ErbkhSYlk3Z2EzSmFlSDlTbmVsRHIvRjlmRUtDQzI2?=
 =?utf-8?B?SkNYcWhyMHJVeUtzWm0rdnJTT2FGSUd3Ym1zOStKRWk1RzJXOE80aWduNWxL?=
 =?utf-8?B?TGNBQVF0a1phYitFWlFqeTNzK1hIa0xLSWQyZ3lPRVAxQVdJLzEwdWRMTm9o?=
 =?utf-8?B?TTRqYXUyRjROYnpQTE9uK01GUzJwWW4yNmpKb2ZQY2dTdll3MUY0R1lFa3hS?=
 =?utf-8?B?R2dQaWhoQ2Z6ekdYYzNFbEM4QlFzNFUrd0I5VHB5b29xUzVnNkszWWhBaUxk?=
 =?utf-8?B?Njh5UjRoNVNNcUx2VTg4NWhCZDI3MlFrQjAxZjRJVkVpaDdoWG5yUCt3VWNj?=
 =?utf-8?B?VHRvOXFBRW1aclEvaWlqTUdZMWNVYVdnejFYTVBPWGY1bm1LdklJYnNVNEVp?=
 =?utf-8?B?OTdlT3dsYk1Hbzc1Vm9PU1B3UnphQ0w2K2Voc00wVzhLY3dVbHNZR2IyL2M1?=
 =?utf-8?B?dVhXcDNsN2JMZkp2VjhZZitocHdiYWh6NDhRS0dpRTVtblBJVFZaTkdjL0dR?=
 =?utf-8?B?UUxISFF0cE5pVjNQK3dmS3ZleDlmN2p3dWpxRFE4UGRTRjhucW54YmlCZTJo?=
 =?utf-8?B?eHBqcng5OXlIcGhXV3RvTDdkRExLM1pjelcxS3NzREZtamNybDltTkd3RS96?=
 =?utf-8?B?dHlKRFdHWWxvOU1QYnhOUHVhSGZmSkF0Z2Jzb2E1VW1KRmZ3R2U2UGQ4OVBY?=
 =?utf-8?B?QWdUMzI4MVlwY2lwL1lJYjdDSk51akpJYS9yOTU4WnMrcGxSUXpyS3dxbW1T?=
 =?utf-8?B?ZkM2UUtWV0QrWGU4clJLbjIzY1RvbXFuY0RQMnRZOUthMm45N3lUR09NN29m?=
 =?utf-8?B?OEJtcVhUSTdvN0hvZ3dnVklVMVNoZ0R4UC9WWDkxRmhNa3Z2TXlZdll5RDJJ?=
 =?utf-8?B?WXBCSjZtSDloM2NqTHA3V0xyYlNMNnZ1WE8wNFl3OWN0VHZzN0hVMndkc3pV?=
 =?utf-8?B?aEhZbDE1Um90RGxqODNSc0lkR05tL3JqVXA4bXBhSko5enl2Q3B1blB5WmlZ?=
 =?utf-8?B?MDRoODZGQjVIMnhHYXdUNyt0UTg1MHZucGlHaEUzZ2hlbUxwOHdwK1VkSGJo?=
 =?utf-8?B?bndsb1dFdEtQeUVrZ0tUNzdhVjc0TXdtWVYrQkFqUjd1OHJFWWl0UWhhMk5X?=
 =?utf-8?B?TFdkTEtlYnJHVGZMVE85ZG1tSTIwMFdRQVk2WFdUazNNaTF5NHoyNjVrV2NS?=
 =?utf-8?B?TWpVWk12UlJwaGo0Z0x0Q1ZpL01jOE10eTYrcEMwVTU3QXE4a3FRQ3ZLSWht?=
 =?utf-8?B?WkJFOTdVNjV6MmN2c3diT1R3bm01ZzBmY29STkRFMWp6OEQzdDFXSHI0OGRJ?=
 =?utf-8?B?UjFsQnBFQmJka2FQWnVDZVpHT1AxNVpkalZGdWZTYU9SNEJibkFBa0lBeXh3?=
 =?utf-8?B?WWJrSEJOTlFtV1BSc1ZIUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGF3cjZCejlEemU5Y3l6T2lHUkJKUmFRT2p3QlB2S3NtRmhPdnBlc2c3dklK?=
 =?utf-8?B?R0FVTzI0bW8xakFxOWo2cUtXbmZaZGVUVUpKRndDS0lOaUtXZlROV25NKzZL?=
 =?utf-8?B?WEJYd0lUVm5xSFBBWWVHdFZXbHdiTnRHLzlTelhQMEJFNlo2Z29sMmVzVG9T?=
 =?utf-8?B?MUdBc2x0UFVNNEd3cnN5bmlld01tZmFKaVBscVFrNnJiaDg2Mjh4cjJSMG9h?=
 =?utf-8?B?aEorRkptT3RDQTBicUthM0t0U3dkcjd4QTZQUXVoRmlpNXVsTldEeFNTSys0?=
 =?utf-8?B?dlp4aFZQMEhoeWozRTN2Q2Z3bzBUQVhqRzhzK1V5bjBVc0tsa0p4YjZra1Rl?=
 =?utf-8?B?YzJsUFl1eURkVjI3ajR1NTdrTStTdUpiVVluZVB5NHc1NEg2eld1cmJ2anQw?=
 =?utf-8?B?V3liaHVSdGRGNlZuMUxnb200T2xLOHp0VlJSeXVJbE5ZeE9RbDNqTDNVUVN4?=
 =?utf-8?B?MHdXYUhNYW0zcVM1UHFiVXJhTHRLL1hieDRsbWUxckFjNzlPZWU3Y3BZWXFh?=
 =?utf-8?B?WE94NVJid0xpQ3dkbkJKdEhLZVNob3FhVE9BNTRhNWdMOFlsQlR3ZldUSFRE?=
 =?utf-8?B?YTdHdHZWdFA0RWlEbzZWOWtqOEpkOWU4MEluc2lXN1R1Y2Foa3gzZlV3QVlZ?=
 =?utf-8?B?cllTcER4MDREK1Jtb1JhdDhzd3kxd1hRaTlOWE16SjNjeE1haTBDMWRIWEcy?=
 =?utf-8?B?UGRlNDN5bGxlQkRFdk9sakl1S2xXV0NkajBlYzE5dlh1UW5kOFhpai9kN09W?=
 =?utf-8?B?Tmp3djVyNmZKSjRYeG1vVzlZSEpkNzNnMlBjL0I2NTFYZTliYStGNnU5d1dI?=
 =?utf-8?B?N1JYQm93a2FKWnZmOURtVkJDZGlwYTJmVFdrdkNrOVhGOGZyMm5takl1ald3?=
 =?utf-8?B?TEZUNjk3c1lRVWUxcnNoZGlXQWMvZXZibzRDZUNBUFNQUmd5WXNiMGx4VzR6?=
 =?utf-8?B?cjFOOVNTN25JeWZWTHhrdVJsSjh3L3BhRTg4SVZKRmtjb3ZCQmthVkluTVZw?=
 =?utf-8?B?THNiclFUdzZSbWlhSCt3V3IxOU5mRTZyWlEwYzBCQ3VoQXdXTU5GMjB3aVRY?=
 =?utf-8?B?L1NscFpBTGFjTUw1OTcvNWFjd2FFd3JZQ3RxT0tzT2loUExqa0NPNjVPbXJm?=
 =?utf-8?B?SFN4ZzFEdFRLOHRSZHZyM0xvczZMV0dDbmYrRjlac09ZNUo4a0sxNVhjRm1y?=
 =?utf-8?B?Q1BVaHNyQVZjbkZFY1dEdWwrMU5yOEFJVDg4bTNtTUUrelZMYkVNeDhvQ1Ro?=
 =?utf-8?B?UEFQemxVdFM3eE1tY05BNnI1U3JORTFNNWlmamlsVjlyN0h1dS8wVWZPMHds?=
 =?utf-8?B?cEFOdEVvckwyczI4Zlg4K2lHaWhFbVhwaGJRK2gySnhBR1ZzU3dGVldNc3Ny?=
 =?utf-8?B?anJjL0lvRTR6WXAzUE1xdWYwaElIcXFuenNqaE4zMnk5UWp2YUNZVDhsenRz?=
 =?utf-8?B?WmpzbndZc0VqdGgrYyswdCtPdTZSaGd2aS9PMk1MUm1WNHVqYUl0SDVGYktq?=
 =?utf-8?B?UlMvRWoybmFkODBNeEhrRS9vWXM2cDA2OFBBSENlMlhGdHgvTlRGbHVuQkhK?=
 =?utf-8?B?T0NGTEx5bUJaU245emVic1pENHk2dGViMUQ0YVRpb1d4UmxzaEhDYzhHYkFW?=
 =?utf-8?B?cVV1NXgvSTE3aklQYVBMM3E2ZEJ2M1BrN3BmR252MEZtYVI5Z1A1SllYT3l2?=
 =?utf-8?B?UWMreHIySUZQSXNxZG0yUDZTamlJWE9NZGpscHF1aU10Mkkya1dnTW9FM2Ri?=
 =?utf-8?B?Mm0ycGsvVkYxRi94bjZhSlMvaEZFVXhNL1ozbVZuQ3ZBcitwYVVXZmJiMnE1?=
 =?utf-8?B?U1pTdStCOW9udGRFaEVYR09ERFYySHZNaFI1OHU4MVVOU1B1VHIybVFrelhv?=
 =?utf-8?B?NWY4QjNLWHZiSEtkQW9FbFJRdjk4YUlwKytZbkNYdXExSzhUU2NhbEJPOUhS?=
 =?utf-8?B?L1J5Q04xRjZHWDFWMTQwK2w4Mmd5eXBFVVNGV1dVUWVCd25Bd000K1ozOEND?=
 =?utf-8?B?NWV5blZEU3UwVm9OZHlOMTVJOHhLS2c2WUlqdFZMS3IrNmlUOE9NT3pRR1B5?=
 =?utf-8?B?SFk3dFJhNnpRWnNtWmpKaDJNKzFvWWFlMXhNTHdSYUhzWU1mTG9ud1lnT2hi?=
 =?utf-8?Q?1DY47z4crLNiwnpT9pttLhcLQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <044AD18923460A4BBBFE4E3094F6B3FB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a311e66-c073-4497-3e19-08dc66082b71
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2024 15:47:25.3866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sfxBzIjJ7K8DiSzP0AWOg9D/UHJg3Zrl8WhxUb6AyUsBLiF1H4NSXLffry2SBmASJ9R4eOsyQgtb+llhXt9CsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6299
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDI0LTA0LTI2IGF0IDExOjQxIC0wNDAwLCBMeXVkZSBQYXVsIHdyb3RlOg0KPiBX
ZSBoaXQgdGhpcyBiZWNhdXNlIHdoZW4gaW5pdGlhbGl6aW5nIGZpcm13YXJlIG9mIHR5cGUNCj4g
TlZLTV9GSVJNV0FSRV9JTUdfRE1BIHdlIGFsbG9jYXRlIGNvaGVyZW50IG1lbW9yeSBhbmQgdGhl
biBhdHRlbXB0IHRvDQo+IGluY2x1ZGUgdGhhdCBjb2hlcmVudCBtZW1vcnkgaW4gYSBzY2F0dGVy
bGlzdC4gDQoNCkknbSBzdXJlIHRoaXMgcGF0Y2ggaXMgYSBnb29kIG9uZSwgYW5kIEkgd2lsbCB0
cnkgdG8gdGVzdCBpdCBzb29uLCBidXQgSSBhbQ0KdmVyeSBjdXJpb3VzIHRvIGtub3cgd2h5IGlu
Y2x1ZGluZyBjb2hlcmVudCBtZW1vcnkgaW4gYSBzY2F0dGVybGlzdCBpcyBiYWQuDQo=

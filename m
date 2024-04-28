Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EDD8B4D66
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 20:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614F510F7C3;
	Sun, 28 Apr 2024 18:20:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ezL2afTO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645ED10F2DC;
 Sun, 28 Apr 2024 18:20:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/+DrDbQmMya85iJve/BAUfSmn4q+dG1XTNLcxKWYnwcNJ4iYInDTnSx6NdU09kpUXKCoaWxqdb3sddg4ikiiE0K2uRBKjgc6NbaWiujmFyWlALg7X1IaVnTH/6eqTj4JW3HhEwzvBg7tjW+NaIkFSAcjnYu05bNdF+X6q95WUCYiHe2EehZR2AXH26IbOoP3BJfxOYSus4Zx8fi7utWNzAe2xExK4rvv9UPkHLFtnf4ktJsubM+8VDMJXGWLvZCbezTikshkcB1KEdKh8ueoQcqZfmdfqijS/Cu+QgICvcQ3/QRoMqMhYyfNBfnqbwEsJopzJ9EasQUyfm5D9p9fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Q0yULBOD3DxTyMDIC9ooPPf6/WRwVd12rs2zqyCJek=;
 b=PbCsQ2XpOonvjaypDJrxrHjrym6IGCeieY0k45U613o36o2ou9dBejYJTHBiAdE09Nre7OrB7ecPQjM8dEgjTyVjN9A/6+OAAx0kkz/oTpTt7jQS5WLbhoey9FD1QVJkNFuHYO8R2M10KZhtmg7oZUPwyjG0MM3/ijGbY9aHgG8aXsDxrLvXXJuOY6DGJi5vYhHIxEGjLbctT+VvFa2HYt5DVmZkCdvWU4KPkiMcR417yz9N8PYl56p/lWW9+5EBC/F0+PODUi4BGQlqBmDYcluRYcSHNLLI3edURAGAPNLzi4JvT3lPvCxx3SJHyYtzfDLrdF/Y/esKzrIsVFNRXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Q0yULBOD3DxTyMDIC9ooPPf6/WRwVd12rs2zqyCJek=;
 b=ezL2afTOGvEJO7GTM5oCClcQQiQIDBhRa0vEUGCAu70+kV2e3ZgMx3Q9NjAbVutfdkHEyzNJZBC6+A1e+oQXnDant27IugD1sqD+vszt+8lQlrJY7QlCeaXCLT4FLMe0dG8EVfdonbsU69mLxnJuVIAW/cr0JfMgMOlEPdTZMSCcRxAo5gP/yvXy3YjEgq3cjL+vyVEMHO44x4uDJEOmSVb4XSrQtvqZZ0UgbJnMtjbhdwAboV+6gSIXtJD/wAI9brCugzPYDBwqq3NSZqcKJ9y2PDOIaDJ2LMXd+o0748IeQXx9lE59YBA8o01reNf4/i7lKun8xmQZXPned115mQ==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by PH8PR12MB7160.namprd12.prod.outlook.com (2603:10b6:510:228::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sun, 28 Apr
 2024 18:19:55 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::ac4b:38c3:29cd:519]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::ac4b:38c3:29cd:519%3]) with mapi id 15.20.7519.031; Sun, 28 Apr 2024
 18:19:55 +0000
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
Thread-Index: AQHal/BQJmqqbJ/bCUu9Jrz4GZ2rNLF6si8AgAMmK4CAACkaAA==
Date: Sun, 28 Apr 2024 18:19:55 +0000
Message-ID: <a2c4681b900796f9ac47b61b802d9134f9a915b3.camel@nvidia.com>
References: <20240426154138.64643-1-lyude@redhat.com>
 <4294e43a0165a36a063d74c7ef62fbdeb156f8c4.camel@nvidia.com>
 <35b0ffe54f5e4077d5ebee6b82ae9ccd568dd77d.camel@redhat.com>
In-Reply-To: <35b0ffe54f5e4077d5ebee6b82ae9ccd568dd77d.camel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|PH8PR12MB7160:EE_
x-ms-office365-filtering-correlation-id: f92b2433-af05-457c-25c5-08dc67afce0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|376005|7416005|1800799015|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?WTJkcXBnRnNZa1ZlQ3hORkxyNzd4clh0RjY2NXN1Z2lYNk93Y0Z1V1JsZy9t?=
 =?utf-8?B?bTJNdGFZRTNsL0R5aU02dW1KQ29vcFcrMVpJQms3c0xJSCtzV29GV1lpWlNP?=
 =?utf-8?B?dENLc3Qva3ZESHRoY004djFYQm9qenZlZFFMUklLQWFZNlBnQmd0aWMzRjh0?=
 =?utf-8?B?T1kxK2VIOG5UTEFVN3JtN0tGZVBpNjdYRzgyb3lmaWpaQ1UvbGQyV1orSWJB?=
 =?utf-8?B?ZGo3QXpNR3FXaElrVUc5MXQ5amsrMmdCNGhUckl6Z0hMYkpycHB6ODVraFB0?=
 =?utf-8?B?dWZ1Q1FZRzQ1Y0JqOVM1YS94NmlOVm1IdzhlY0hFeUl5YzFPaFZJRytLZnlt?=
 =?utf-8?B?TE5lTmRkeWI4UWVhR09GaEsrbUJ6VWNHQ1FjTjNiSG5YaEl1ajE2d1drN0xM?=
 =?utf-8?B?bWk3Qmhrc3JLSTY0aGVQN2tmallLajJVQzZ2WHVoanRlTWFOQzV3UU9jd1A5?=
 =?utf-8?B?Ukw1dmJ4YUFCNU0wQ0djeVBMdVZpZDhLMFNxWmgxbVRsUS9MN2VRQVQ2c2ND?=
 =?utf-8?B?ejlnd0xhNG01NktDb2JyMnhHY29PSzk1SzFVbnZDd25DZXhVNU96bHdqZGw5?=
 =?utf-8?B?alNRYnl4NWJDUkFwT0locXBnZVgvV3R4UHllUmU5K1RIVUhUTjVFWU9DSkpT?=
 =?utf-8?B?OVZPNnBRNDh1YW9UQzlDYVJXRkk2VEphKzREWjh3NTRHVWNZR2RXZDkxdktI?=
 =?utf-8?B?TURhMXhRNlVqRGFvVjEvSmthOTNVRm5oRGNrUmQ1Y1dWT2cwTFZpcTBmUmJy?=
 =?utf-8?B?eUs5bkZFbUlsVVB1NkNCTWhOQVdWR3V4dlVYN1hDZzVDemtyNWR2aWpZZHJj?=
 =?utf-8?B?dTJITHlJTnBBcjJWVXE5UGxoZzFJTjNvS3kyeWVYK3Nva3Y1S2tPaXNoS2Y2?=
 =?utf-8?B?b2FQS0xjZUVFU2JZOC9GWHZZbHdjaStFWmxENTM1NHlqMlIvWkF1cnRTaGpV?=
 =?utf-8?B?dHlBdU9tbzg4TkZvcjNzZUViTVpyVndyUTlEc1lCeXpIc2pjc2pJWkhuRkFh?=
 =?utf-8?B?N1JTRG1uMlFEWTNtL0dSTUZxVEtoUGl6V1NCdzQ5TVk2dVhVd2FaVGJWZk9y?=
 =?utf-8?B?cXZ2V05qdDMyMVkrM2hIQi9zV3hxQVBPVFh0UGdqcjZVeTFORWxjb0ZGL3hj?=
 =?utf-8?B?alE5Q1JleDdreHVhUEQ4VVdaemRaYmIrQVhhd2NxSk8wTHFUL0dFc2lXQWhJ?=
 =?utf-8?B?ZzM5YVAyeUdoVmR5OFllUFYyUENraVFxbDhZSjNRTTEzWVVta21BM3hsdEpa?=
 =?utf-8?B?Z3dTZ1BueUVPQmF5Z1NrcEVQNEZzVnhCOUF1TWdZYk45ZzFuMmhDK3h2WXVu?=
 =?utf-8?B?NWRuVmNmTnFadFozaDFUUjZodkpMbHNWaExhTCtNamFUTkFuaUVyRlVNdEho?=
 =?utf-8?B?TS9tL3VlZWd3VjFNL0hyODhvTnBDelhhQ0RhRVZGekU1QjFKNTVhWXBJWWlS?=
 =?utf-8?B?VHdNQWk0TFVDM3RDQXl5a1lIMEZTL0wxay9UZ29YUC9oSkkyMmNUS3Z0UVNB?=
 =?utf-8?B?VncvVmgwRDlJK0szdVh3aklJZ3phY3k3RDM4S09ORDB0bGJhdEZRS0NpbG1p?=
 =?utf-8?B?eHg0OEgzUTdXa1Q4V05GeWlyNTM2cUVZbGJmMFN3TjZ1SzZkaFliUVlpcUQ0?=
 =?utf-8?B?ZWZYa1l1K2JHb3NYcm5UeFY1UEdBWUtPVEJZQkpYcXVaejI5b0dhOEZvZHcx?=
 =?utf-8?B?bk8xdi9odmFBK1p1UE00dVlyMnhyYW5UVmpGaWRqc3ZYYnViRUJNa0FKbUQx?=
 =?utf-8?B?aDVGTlMxYTNNcGc1eUNtaEd5c29KcGRkSi9wUGwwNWNuYlg5b2oyUkFUMXh4?=
 =?utf-8?B?aExsMysyekloQzdKZEdWZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0h5U0EwYVh5anFEa0NDbTV3aEFoNFc4aFA3a1NSR1J5VmpzNVkyTWtGZkN1?=
 =?utf-8?B?dnhEVFBjSXdKbzVmU2EwdTR6V3hlR0Z1dG0va1ExM1VVUWVpYURwMGV5a0ND?=
 =?utf-8?B?elZHaDVLQnpreEg3a2c3MXhHY0Q4Y3NabTlQVFdyTFFDZG45dGZuRDhoWStj?=
 =?utf-8?B?VGZ2a3RhWldRcHFmTnQ5ZzQ2d3ZPQnQwTURoR2NNWkJKejNXSkVDRmQ0RThp?=
 =?utf-8?B?UWo2QUVuRU9Va3o1eXQ5Mno3aW8vRFUvazNIK3gwTkJNYi9qbVM3djluSUdz?=
 =?utf-8?B?Y3dHT3RURTRBNStUcWthcWVuTUlUcnc1ekV4S05YTElwKy9pZFViSjBSVGl5?=
 =?utf-8?B?N3lEOWFvYWNRZUtXZjQ2MVpZdVBpQ2ZWbEEyWE16WG1WM3FCWkZFR2hXY2RY?=
 =?utf-8?B?WCtCNU9neTNUTTIrbm1YTmpWaXh3dGd1SGpRYkxXREZjS1RLRzkvcFJ6N25G?=
 =?utf-8?B?VW9ycW1IWW1LLzk3bllOSlZKSVExWGl1SXhUZ244VE5wSEJkcXhXQ0pxeUhR?=
 =?utf-8?B?NWxWK0xWTVpPRkc2YnpQeFZLQ2ZvTWN5VzM2WUliZWdhVlFyR3EzRDJIUS82?=
 =?utf-8?B?dDM1WEtVMUdlT29sT2JLVlRGWGtnUVI3QW4zSWl0eDdCaGNsU0UveGlPTHdN?=
 =?utf-8?B?Q21tTjIxdndSc05pL0wyVEZJeFFMa3BkOXlkUE9oSXdDM2t5NWYzRGFUM1hW?=
 =?utf-8?B?K1BaaW5EbDliRjY0eXdHTUVuTWd3VVBlbE41aXpLRXYyRjhTUW5LMC9iaHVj?=
 =?utf-8?B?c0c3aUswY0FXRk9WUDlhVWhVdHcrbGFDekREd3F4R0NGQ0FWK0Vua0NqdlYx?=
 =?utf-8?B?aHhFRm5NUmEyTFY4OTQ2eWtyRzB4NkpmbXAzcS8rMWdXWXF5Qkh6RCt1aUdG?=
 =?utf-8?B?eFBNWG5hdWNJZlpmN2cvNXRZUld5YW9HSVRydHNoOXVLc1hJQU43Tkx4MnpG?=
 =?utf-8?B?dDZ5OTZEY1JXZ3FBaUw3WnRMY01QSEUzMDdmbWduallzTXBwbjhUYnRxWU9V?=
 =?utf-8?B?bU1KMjF2amFMNmQ4MU82ZHNGenBLbUs4NGtKbENJQXZUNXZuTmJNREprUVQv?=
 =?utf-8?B?OHVsbEtGZGZzUFpoTEdVV3RWSXJGNzhPQkVVTlRRMDBPQklySUIwR2I2c3pC?=
 =?utf-8?B?WTVncVFRMnM3aEtUSnBXS0h4bUVaZ3FhZTNQcDlzck1JM3U4OFF6eTRIMEJ5?=
 =?utf-8?B?NTg3NEdMK2dyMWJZUjZNcDA2dVJZdi95aHdqUnFYbHkyZ21hUkpDNjJOYmZq?=
 =?utf-8?B?b2pWUVNqUDYrWWZlWEM2eHliZEphMko1Zm0wd0x0ckM3ZUVHbDhqNUxScTgx?=
 =?utf-8?B?dm8rNWJlRUFDanlnME9QUk9ObVZndmcxZkZoRE5qWkIwZzgrQktqZHdMSEtp?=
 =?utf-8?B?dnc3cm41RGR5YlcxZDNCcmNSdUpQT1NLQkZQclhuMGxBYXdaK1BGTk5PNnpt?=
 =?utf-8?B?eWtrMjE4UUxLS21La2gxY201UTd6cXB5QVBJRmxJM2h3Z01hNmdrV2Z5cGhl?=
 =?utf-8?B?MFhJWHo0aDZJQnM2dTdkdXVQRXNZbjBaR2VrUFRuUXBMcEwzQUdCMHQ5NUx4?=
 =?utf-8?B?M0UrSEpvVmR1alkwOU5jeW9aVytwTGJVTTRncFBrcWtVS0FBcXh6R2d0akFq?=
 =?utf-8?B?RFpYcDZETjIzdVd0R3BrVDlQUE8yRFpRYnRHWktYM1hYWGFud1FTZkhKMnhZ?=
 =?utf-8?B?WlV1eVVicmlncTg1OFF2R2RZQStycVdFQ1U2UU90cXlRdEZaSXRqOWlISVZy?=
 =?utf-8?B?S3dVd29MTktGcmFhbnNUd3lHWDRkSEMrY3FkZXI1TDd3Q2JLUmhQZFhKb2hz?=
 =?utf-8?B?SndTTGgzbklDWG9NNjBKRC8ySUExQUtBUFJoVHphTFl1SVN1TDR4dW1VMllh?=
 =?utf-8?B?MDJTSUZNbWRQQ2hjdXR5ZU9OeDFha05ETU5ubWlPMFJiQVFsUXpNbTdWVExB?=
 =?utf-8?B?YVdDUzRGcktITXJzNzFlSDBuNnNwdE12ZlUyUlovVUN3ZHFYSE1IU1M4R2Ev?=
 =?utf-8?B?QXp2ZXlqTnlDVCtZQ092L1lxUGR5Q1cvcW90Z2lsUWtaSHJSVmhUdXFqZndS?=
 =?utf-8?B?U2xYTWRYanNXODAxNmZsdG1BZUc1ZXlUbm10VzRkdnVlSGR3SUVLVERrQXlF?=
 =?utf-8?Q?Y2i9WVah8ZofFG3d+vAKEDegG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FA269DCE58FF34892E01091C4779D8F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f92b2433-af05-457c-25c5-08dc67afce0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2024 18:19:55.3553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +2uVYNkEW/RzzDtZHR0XEqLspILA/ZZdnKdickdiCJaJ+c69XlItHrS8EWu5SbrlRVjnKUOW+NCc9VajYvB2tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7160
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

T24gU3VuLCAyMDI0LTA0LTI4IGF0IDExOjUyIC0wNDAwLCBMeXVkZSBQYXVsIHdyb3RlOg0KPiBC
dXQgd2UgY2FuJ3QgZ2V0IGEgcGFnZSBwb2ludGVyIGZyb20gYW4gYWxsb2NhdGlvbiBtYWRlIGJ5
DQo+IGRtYV9hbGxvY19jb2hlcmVudCgpIC0gYnV0IHdlIGNhbiBmcm9tIHZtYWxsb2MoKS4gSSds
bCBmaXggdGhlIHBhdGNoDQo+IGV4cGxhbmF0aW9uIGluIHRoZSBuZXh0IHZlcnNpb24sIEkgaGF2
ZSB0byBzZW5kIG91dCBhbm90aGVyIHZlcnNpb24NCj4gYW55aG93IHNpbmNlIEkgcmVhbGl6ZWQg
dGhhdCBwYXRjaCAjMiBzdGlsbCBuZWVkcyBvbmUgbW9yZSBjaGVjayB0bw0KPiB3b3JrIHByb3Bl
cmx5DQoNCkdsYWQgbXkgY29uZnVzaW9uIHdhcyBoZWxwZnVsISAgWW91IHdvdWxkbid0IGhhcHBl
bnQgdG8ga25vdyB3aHkgdGhpcw0Kc3RhdGVtZW50IGlzIHRydWU/DQoNCglETUEgYWxsb2NhdGlv
bnMgY2FuIG5ldmVyIGJlIHR1cm5lZCBiYWNrIGludG8gYSBwYWdlIHBvaW50ZXINCg0KSSdtIGd1
ZXNzaW5nIERNQSBhbGxvY2F0aW9ucyBhcmUgdGFrZW4gZnJvbSBzb21lIG1lbW9yeSBwb29sIHRo
YXQgaXNuJ3QNCnRyYWNrZWQgdXNpbmcgcGFnZSBwb2ludGVycywgYnV0IEkgZG9uJ3QgdW5kZXJz
dGFuZCB3aHkuICBJdCBzZWVtcyB3ZWlyZCB0aGF0DQp5b3UgY2FuIGhhdmUgYSB2aXJ0dWFsIGFk
ZHJlc3MgdG8gdGhlIGJ1ZmZlciwgdGhlcmVmb3JlIGl0IGlzIHN1cmVseSBtYXBwZWQgb24NCmEg
cGFnZS1ieS1wYWdlIGJhc2lzLCBzbyB3aHkgYXJlIHRoZXJlIG5vIHBhZ2UgcG9pbnRlcnM/DQoN
Cg==

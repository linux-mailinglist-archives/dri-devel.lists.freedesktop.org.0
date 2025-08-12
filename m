Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C65B23C06
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 00:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED3E10E069;
	Tue, 12 Aug 2025 22:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NkfJf2Sz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A8E10E069;
 Tue, 12 Aug 2025 22:52:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ow3ajn7T8V4EMh8rISeY80KbzoETmAX3Rhuub3IQZ+UqoBHdwnR1djLAr5Qxr14+eDIqbmuuTRWxJBbuSyr0ctMnOi7SO8bRjljrKusWkkxSE0xPgGl/bG35FKmh12m3sVdYGnjw/r5cCkaBiqXk3biglh+1yHJuaHPxEwPckZ7a5QiWmiMvHDnWslm+gO0Y1cVjSCWXRth+/ygdUEWX0j9CzNv8yq1MFzT/AmSZwV9OWlWcffup74D5yrZ3BaiqrzWNiaCjCH87iXRakF2uAHvC1Qtio/ghE/OajXdqHK3z0/TRPthWswrbWogH9e2bpdKYekSlKMNh9OsIOCbJ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8N7N4fbivta/IZ9ySHGmm1J5WZwkvu970RO3hXFWoY=;
 b=h6N0QxULUx3GxQQs3vRZayukMTij5hi6gkCIFC8W41Om8ExL6fmfqrf5hrqBRc1BqFff7t7FMvBLJIIk15hcSH8W3+xj8g/QpBdhlqIzdsnUTgA5J7mR234vr0r1t2ScCyiCJ39or3I+Nw1eJ95PoayeR+VegfD/3PsLg3Jaw36ASXIlxNhKUcaMxPJ0Y5Fg6xXDKBP+/ykbW5l5x6fjLxUAISUfdg0nnKXK2VuA19/jRLP6dRg2CC3uh1oeiA/W463KayJ6NRxkK1HyX+gOVliWR40fQvQWA3IKnrJ+nZy/eTtQXjOzKxaIN+w3FchEb/TwhGhCcP3RQipPN/El4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8N7N4fbivta/IZ9ySHGmm1J5WZwkvu970RO3hXFWoY=;
 b=NkfJf2SzFh/ba2poRVM+Va2TbqbJkcaTl76xT3NIi0J4bkMU26zxyPNIREC5/bEK+TUSMrJw/uVIwAEtcW7iT52kcYkfjXDNZB7UohSsr65HF+T1T06qxYYUIM+87zKRTw4JRv9KaESOMYjWrrLpQu0en2DHQivOhAHT8kgucbUxybhZOinvJh22i3uFH9dsPbtLF3eTGD4CcyOrNL4AfIES8DpqEFOQ0yEyggyKaA/5AW8n1m7DQvGuqWkSgOWinNJjFMhf+BaY86DquWcs3q79pbtZg/29pHDj6TJx8UtI9xyeC4IS9rZXqC4r1agZZL0VuVywqzgFZ0Bomg9KgQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 22:52:07 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 22:52:07 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "rongqianfeng@vivo.com" <rongqianfeng@vivo.com>, "airlied@redhat.com"
 <airlied@redhat.com>, "simona@ffwll.ch" <simona@ffwll.ch>, "lyude@redhat.com"
 <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Zhi Wang <zhiw@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH] drm/nouveau/gsp: fix mismatched alloc/free for kvmalloc()
Thread-Topic: [PATCH] drm/nouveau/gsp: fix mismatched alloc/free for kvmalloc()
Thread-Index: AQHcCqELx/TD/+F6+0iCA7EUtlzm0rRfojCA
Date: Tue, 12 Aug 2025 22:52:07 +0000
Message-ID: <4ca70a236502a2359b8ba332919b1fe4f9f09010.camel@nvidia.com>
References: <20250811091910.404659-1-rongqianfeng@vivo.com>
In-Reply-To: <20250811091910.404659-1-rongqianfeng@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|LV3PR12MB9356:EE_
x-ms-office365-filtering-correlation-id: 4daaab87-504c-4f66-d910-08ddd9f2dd12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MmszTTN5RGJpdVVGSzlJN09IeFcwcU8zbW9DaTRmNWxpYW16VVFtUVZsY1py?=
 =?utf-8?B?Qk1FYjl3OFY2cUJhc3hHandsQTJQTHJ6UmJtd3g5S3JJeklkdW9ZcmJvZ0Jx?=
 =?utf-8?B?SHNxL2JjaTMxdmwwYXd0eWxOS0w3THFNanZkbVd1dmFlNDNGK04zWElxVFdl?=
 =?utf-8?B?UERuVGQraTJkaW4wL3Y1N1UwMXZlbHBYcjVaM2RLdHFDTzd4d0hNaXNxQmEv?=
 =?utf-8?B?cHRZUTgxZWFJVTNNTzEzZEQrZE55QTdkZXpLMG5rV1owdU8zdWNRZWpCS0wx?=
 =?utf-8?B?YmhUSlA2WGhLREZPUlNZQThZM21iRVhjelFNUzFScjEzWVhGNFhVSnBFaGQ3?=
 =?utf-8?B?RFZKc0J1QkRWc2V6bmNteDFUdklOeGorL2s1aWsyRldnSURUeTlpbWpPMmZr?=
 =?utf-8?B?YnowbUkrWVh0empqa21yVzBucEY1SjVVdVpDbU9HMldnSW9RaVUzRGYyU0Nt?=
 =?utf-8?B?cG5KNHRMNlpCMXFFMkJRWmRkQmF6MU55eXQ2QUUwVCtNTzh3OHBVdXlZTmRp?=
 =?utf-8?B?MzZjZmVna2hralpMK2IxNDh4bkUxa3lNWkZ5cEEwcVdsRUczMEI5REp5TDVy?=
 =?utf-8?B?VmtFNG5pMjNyRXc3SUxTOEhhWVdjRmRKc0xqKzhJWG9tdTZwN0ZaMWxqNVh6?=
 =?utf-8?B?b2VZQzMxTGMxdlZENW11dSt4ZWtwNy9DUVVXL0pPSWw1OWRyaGJiSHU5V1FX?=
 =?utf-8?B?KzNnZjZCeHZvZ0lQN1R0UmdzYWJ3VHpDam1sM2VRMm5iN0pldktsZm1JaUhM?=
 =?utf-8?B?TGt2cEEzNyt1eVVSK2MwZW9ZN3R6c1ozczBRYWVPUmRWeEhIdnFjVWhTL3dx?=
 =?utf-8?B?Ylgzb3k3Z3FJaHZrUElMMm9ENkx2Q1FCbE5ubk5Ha1U0NzRGYlhRWHB4aG1H?=
 =?utf-8?B?MExLcTY2cERBaG53NFpZb0c0ZjBhVzdGZ3N1ajM0SmZ6bGRMVEM2djFLWWFU?=
 =?utf-8?B?ZmEwdjVCTVpjRmVxV1MxK0k0MmRJMklBZ2VaeWxQSXB5YmJQbjhOZ2F4eFlj?=
 =?utf-8?B?eGY3ME03RFRBRWlKODg4REZ3T0pnUXJOdWFqSkxwVzQ1cGZJaVg5Y3MrZEVa?=
 =?utf-8?B?T1F4TVFOT2JySllRZjhtbFJyWjc3R3Y1bEgzSnd5WlFBcVhjR1RsRlQ2Tm5k?=
 =?utf-8?B?VzZXdG1wQXliczhGTmJTZzBXYXFlSWwvNWFXK2pkY204MXMxOTEwd3JDcmk4?=
 =?utf-8?B?YnBSdVMxRVhJY0hDYkluUWQ1ejlXZXp4WTUzcGpZNndETVNsRHpMakFRSTJI?=
 =?utf-8?B?VUhZMGM4ZGI1ZE1pRWdpQ3RXSDFYd1BlSTZmT0JRVUhlZHN3THROTlFPcVJi?=
 =?utf-8?B?NWpUaytTVFBhN3ozR3hlRWZBUlc4cmliUUpESGFCeFZ0TVUwalU0K0d3Q1FC?=
 =?utf-8?B?T1ROUTNIRVJHbnJUelJJNjZXR3dGVyt6ek5sNWU4U1ZsUjhQZEk4OGRNSGJX?=
 =?utf-8?B?N0NhTXdYTHh2NTZob1hjc0NvMlFvM2J0VnBDTXBvc2lGMmRVQVliMFVxdnpE?=
 =?utf-8?B?K240QTh3WGZaMXVORURrWEgvRDBaN3RhTmlRUjJtaTdnVUtGVUdtY2tCRWtL?=
 =?utf-8?B?a1g2QnB4bm9Xb2xXZGRCSnUyeGhWY0diaWdab0tEZTIyK1JSRmx3anRONVNW?=
 =?utf-8?B?UFFVbDZGT3RtbFgxMGpPYkRUOURoTDNpOGJQN2VUa2Z5R3NzRnNudFdQVXB0?=
 =?utf-8?B?anNtNEx6dTNQc1hzdHl2M09FbGZtK3pQMmQwODBqVXZXbm4vdDhtKzJYb3lK?=
 =?utf-8?B?QlFCOUg3NTZIZlhKcUlJNWVRc2JGZy9ua29ZOUhyUTYwb0UwUkgyeFRjeWk2?=
 =?utf-8?B?NHJnOWRsNW9jQlRJaFdwQ2lFQWZsejJxS0d4d0pzL3FTT25OTklMQmdUclZZ?=
 =?utf-8?B?aW9aZFBsK0F4aWJKSXNYbXFDTW44QUNKRnordFgweTV4d0dFYVQ4U1Y4RUxV?=
 =?utf-8?B?a3BsWDVSK2tJTWpLb1BzNnQ5S3NSaVBsOVl1VytkTUg1K3lKRHBCMm1qMjVu?=
 =?utf-8?Q?ICRmcvhuM2sIaOf6ByfUJcLGKywY+E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGcybVNoRkgzV3VoRnJwam1oZHMzT3FzTmZoTWVpaUpueUswR1F1WmU3dHFV?=
 =?utf-8?B?Q0d5TEJ3NEE3T1M0akUzNGNVdUo4elgrMzFZWUJobmpLZjRuUGRLc2JGb211?=
 =?utf-8?B?azhlUExKc2laRjFZaEgzOEI1cTlKS1gzTys4czdmRFFTZDFVdEhzRFhmSlEy?=
 =?utf-8?B?ZFk3eU9LbUk0eWlVSHlxWVVucW1VMzAvUWxuSGpKKzV3Unk1cDdaKzF6Q1J6?=
 =?utf-8?B?TVFYcXlDK1ZWZTFjazM3RDdHbVVEelBqWHNMNFZDcWpRckdxQVBiMnpMNmZr?=
 =?utf-8?B?TGRqNlBkWS9VQnhtZEVFd0F1ZGRPUHVwYUs1UkRGamc0TUx0d1pvSEJZWHdT?=
 =?utf-8?B?UnVaYmdGYVJqTUdkemVlQy9GVXFEejh2am5BaHR5RnBiQW1wOTRoNjR5THo5?=
 =?utf-8?B?Z2lwTkZkYjdJWEt2UzUvSUhYQ0NZNmt3REt5cHBPSXJQSGxiazBLZC9sQVY4?=
 =?utf-8?B?L1Zwckl3M2VTNFlTZUhMM0ZVZUNjbm9sK3dMTHI4MFFJRTg1RENZV0Z3S2lv?=
 =?utf-8?B?cmxOVXRiRDZOZUZJUnBXWEVTQ1llbVRFOGRFYlF5aHZ1K21LRDNoU0FFODE0?=
 =?utf-8?B?cnh4cTFLVFRLYTVaYldyNEVIZDRRc0VEZncwL1dFWmxiTmM5clBpbTBNVzhS?=
 =?utf-8?B?dG5hRUJDSVprcCt2M2hCZDBJdkNUNCtnSGxlbG9LUXFqNTA5ak9zTHRNQlgv?=
 =?utf-8?B?N1dBOHhtS3FqcklYalcvL3MxZ3dKWnQyNFVVZit6c3JCRDNsM1BXTW0yVWc3?=
 =?utf-8?B?M2g5alF3Z2UwcllUZ0Rud2xqS3R0dVk0SWJhSGVYRUFwWjlMMnJLM25uZDRp?=
 =?utf-8?B?N21pczlCWEFJUU94ZDI3RWpKT3ZxNUVaRnE2ZC8xRXNTMEM5S0NmMUs1eDZ5?=
 =?utf-8?B?TmlXYUFUZ3BFK0tPMXBKTjIvemFXM3V0N3VBcmtla20zSFNtTlQvaHFrbEhL?=
 =?utf-8?B?T1JJZnc4RmxLdEtvZUxSR2JyQXE1WXBZalZTQklFZVk2SUllUytFaGkrODUx?=
 =?utf-8?B?OEhUMGdyS2tpcVBla1M2aGxnWkd4blJkVXBkYlBlZmJEMTIwY2FqM3R2VXJH?=
 =?utf-8?B?WnVtdy94NEVMUFRlRGgrQTRzUWhrKzBndzREcDZtTGJUcXlrdS9DVzBaZElS?=
 =?utf-8?B?VGx0OVNiRzR5TGwzNFRUSnpVSXJqWnprT2h1dVlRbXVBM3lHTWt2ZjY3MmYw?=
 =?utf-8?B?dmw5cnVLZkc2M2tPZGdCZGNrS3JXYXVPLzBIeGdxN0JKUEx4VkR0WWlpbkZP?=
 =?utf-8?B?SFR6bVVwd3NYNnh1ZjhFbmZZVmZ0aVJMakJJSnY5cFNuRmhrSno2eXBmTzhV?=
 =?utf-8?B?WmdrZTNIY1A5cUIyNmc0Q2hVakUwUTUxTHZIOG5KTG1sRldHZnNMQTdLUFdG?=
 =?utf-8?B?YVlVSHFCbmJsVER5QnNwa1lLTVNSRUJCRENxc3h3Y21jM28rbWpCUmsvbmZs?=
 =?utf-8?B?OXkyLzg5Vkl0VE1ic0lpTHE0YzU4OE9reXBXMHgyTDMzYlFwNkNRZlJMaTh1?=
 =?utf-8?B?ZlVNK0Q4c05zYXFwWVlWem0yWHhNN2ZLMHFKM1VETnhzaHk1Y09WNlluRDdu?=
 =?utf-8?B?cWdCWno3c3BQVlljTWJRUzRpdFJYWGkwSFZaa1paODNZMkVBUUJBWEFWNDlZ?=
 =?utf-8?B?UUNJK05IT00xMzZSN2lYM3V1bklYSXlJdUFrQ0VNcVkxMEJQbEdleGwvYSt4?=
 =?utf-8?B?bG95Z3lkdXoyYzd2eU1MZzhpb0pjM0UyNEovdnJBVzUwNmltK3lvd2dUY2Z2?=
 =?utf-8?B?Q29hdmMwb3dWUlg0R3FjNURwMXZQcDJFYXZFeWNaUDQzTm1rTXNPbWJ2MnZW?=
 =?utf-8?B?TkpicjlMSTNKMVAybkdrbFRCdWlGNEowNkR6THptdHduM3YzdElMNU9vM1ZE?=
 =?utf-8?B?L2pLQXczWFptWXVXYXVzVWpoeXpFOTVmMUtLN0ljV2FjdTliWlRQZ28zRmpz?=
 =?utf-8?B?RGYwRkZ2WkJmMk03NVJCVVlkSWppdlFNTzRmWG13aDJ4QUFqUEdIcStMUlVU?=
 =?utf-8?B?WEp6MENvMC9qSVZlQWZGYTN0cHF6VGt1WlNFZXNyUU5CaVMwUWkvZEhiOTlL?=
 =?utf-8?B?WUc4TUdMTzdDT0c4RnUyRkl5Qmt0KytCNWJ3RTZ3eHcxaGViZlZXbkdkYWM2?=
 =?utf-8?Q?Zj/5/BMYlxzHA7r8Sf/qf69MY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <27DF362227DFFB47AD766B402C336D45@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4daaab87-504c-4f66-d910-08ddd9f2dd12
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 22:52:07.0710 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UvaCtYYaG+e7Gnaf42umAAipBdQ8Ao6bHthWGSPEXnn+aHOeiHmyibYQEmeDuDse0b/OWI6Jui8oq/6c0pK8Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9356
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

T24gTW9uLCAyMDI1LTA4LTExIGF0IDE3OjE5ICswODAwLCBRaWFuZmVuZyBSb25nIHdyb3RlOg0K
PiBSZXBsYWNlIGtmcmVlKCkgd2l0aCBrdmZyZWUoKSBmb3IgbWVtb3J5IGFsbG9jYXRlZCBieSBr
dm1hbGxvYygpLg0KPiANCj4gQ29tcGlsZS10ZXN0ZWQgb25seS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFFpYW5mZW5nIFJvbmcgPHJvbmdxaWFuZmVuZ0B2aXZvLmNvbT4NCg0KUmV2aWV3ZWQtYnk6
IFRpbXVyIFRhYmkgPHR0YWJpQG52aWRpYS5jb20+DQoNClRoaXMgZG9lcyBmaXggYSByZWFsIGJ1
Zy4NCg0KSG93ZXZlciwgSSB0aGluayB0aGUgcmVhbCBwcm9ibGVtIGlzIHRoYXQgaXQncyByZWFs
bHkgY29uZnVzaW5nIHRoYXQNCnI1MzVfZ3NwX21zZ3FfcmVjdl9vbmVfZWxlbShnc3AsICZpbmZv
KSByZXR1cm5zIGluZm8uZ3NwX3JwY19idWYgaW5zdGVhZCBvZiBqdXN0IHN1Y2Nlc3MvZmFpbHVy
ZS4gDQpyNTM1X2dzcF9tc2dxX3JlY3YoKSBkb2VzIHRoaXM6DQoNCglidWYgPSBrdm1hbGxvYyht
YXhfdCh1MzIsIHJwYy0+bGVuZ3RoLCBleHBlY3RlZCksIEdGUF9LRVJORUwpOw0KLi4uDQoJaW5m
by5nc3BfcnBjX2J1ZiA9IGJ1ZjsNCi4uLiANCglidWYgPSByNTM1X2dzcF9tc2dxX3JlY3Zfb25l
X2VsZW0oZ3NwLCAmaW5mbyk7DQoNCllvdSB3b3VsZG4ndCBrbm93IGl0LCBidXQgdGhpcyBkb2Vz
IG5vdCBjaGFuZ2UgdGhlIHZhbHVlIG9mICdidWYnIHVubGVzcw0KcjUzNV9nc3BfbXNncV9yZWN2
X29uZV9lbGVtKCkgZmFpbHMuICBJZiBpdCBkb2VzIGZhaWwsIHRoZSBjb2RlIGRvZXMgdGhpczoN
Cg0KCWlmIChJU19FUlIoYnVmKSkgew0KCQlrdmZyZWUoaW5mby5nc3BfcnBjX2J1Zik7DQoNCkl0
IHdvdWxkIGJlIGEgbG90IGNsZWFyZXIgaWYgd2UgY291bGQga3ZmcmVlKGJ1ZikgaGVyZSwgYnV0
IHdlIGNhbid0IGJlY2F1c2UgJ2J1Zicgbm8gbG9uZ2VyIHBvaW50cw0KdG8gdGhlIGJ1ZmZlciwg
ZXZlbiB0aG91Z2ggdGhlIGJ1ZmZlciBzdGlsbCBleGlzdHMuDQoNCg0K

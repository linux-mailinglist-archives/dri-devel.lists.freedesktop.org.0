Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4039F08DE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 10:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0AD10EF92;
	Fri, 13 Dec 2024 09:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b/FIHr9m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B23E10EF8D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 09:58:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlDb4f4NPGoxR1EebYlyo/omQQ79ctYYmbjLTwk54rdajr7Ay6kjJfN0Jk2UmBsf02dtjbArWTTFGcLsAfWhGnz7CgIxitpe5o9Q/lJs4mJ0VsjD1Cf8IccSwzSEc7XYhSrp92uSk9ZiXCajbvVfzjwAyAh0dVhZgnctcKg+SIqkTGRlkAVkC7GoPeyOppTJ8NlchiHBTC2Dos/kl6LfVAsHnlNFmLn31IbX07X9gRXrXmKPKs4PWfeqZNf9M2IWBkUagkuJxoytOzacpliGMe6idhxdoZ7eF7ueY2Dwt56Kw6HIBRCNy16gUqUXS8ncjnPx7q6IYfVyC1Pmp8PlfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/hKrtp2mKw2lsKmfdebUk5ttyADH6RTL/Ux9ghBR8I=;
 b=lYTdv2Ls1dyXEmMB5ruB/9DWGQbFwo96Un64GQil5EM8jPsfXDHWGmawx1pO0uN7JUw/PVW+kQf2KAFoaMIXPzZvcFvnUaoyXzM/10HIaX5N+hMPD7t7vshIhElTfg2PhQuIoY4R74qset1JpJFqcLFI4u4KQwumjFX/N+4Mg7qXebYTAUEhT0qVeNaCBUap6GkMAZL7DuFi5QPutz/n8YIDh02rtiBrvZneojuVcP7TcABBFqKHf7JIP83glmbnWkLw81F7NHLCwfk1s/gSTpPnmz8WgZm1GQtrtVVa0WnhY974mgfczgZeXNq60OZMfbL6sdvQt1+dynLPXQ9/5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/hKrtp2mKw2lsKmfdebUk5ttyADH6RTL/Ux9ghBR8I=;
 b=b/FIHr9mRhLPbEwN+/QLAXj8Bss1ij5KMSf44JEys8cHuv2s199Vy1qLzj0f8zO03iTfURVrwYSKLuhzgrE+cVuQIUzzOOsoJVsLZrNh07Nq5BLTFtIt5xLmacYwaBpuFq1WKNfFB+s4li1nMmQaN/wMb+IehfKAprAZQOgxH8g=
Received: from IA1PR12MB6532.namprd12.prod.outlook.com (2603:10b6:208:3a3::12)
 by DM4PR12MB6589.namprd12.prod.outlook.com (2603:10b6:8:b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 09:58:51 +0000
Received: from IA1PR12MB6532.namprd12.prod.outlook.com
 ([fe80::dc05:a63a:39fa:ff0b]) by IA1PR12MB6532.namprd12.prod.outlook.com
 ([fe80::dc05:a63a:39fa:ff0b%7]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 09:58:51 +0000
From: "Zhang, Julia" <Julia.Zhang@amd.com>
To: Juergen Gross <jgross@suse.com>, "Zhang, Julia" <Julia.Zhang@amd.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, Daniel Vetter <daniel@ffwll.ch>, "Chen, Jiqian"
 <Jiqian.Chen@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Penny, Zheng"
 <penny.zheng@amd.com>, "Zhu, Lingshan" <Lingshan.Zhu@amd.com>, Anthony PERARD
 <anthony.perard@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
 <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
 <paul@xen.org>
Subject: Re: [PATCH 0/3] virtgpu: check if P2P is possiable or not
Thread-Topic: [PATCH 0/3] virtgpu: check if P2P is possiable or not
Thread-Index: AQHbSJXzDQ7EITP6Dk67xFd0UcUl5LLiQecAgAI9SQA=
Date: Fri, 13 Dec 2024 09:58:50 +0000
Message-ID: <IA1PR12MB653204F4739113BE9EA690C7F2382@IA1PR12MB6532.namprd12.prod.outlook.com>
References: <20241207105023.542399-1-julia.zhang@amd.com>
 <1b557096-6527-4aea-a8c2-d72ecf0a31e8@suse.com>
In-Reply-To: <1b557096-6527-4aea-a8c2-d72ecf0a31e8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: IA1PR12MB6532.namprd12.prod.outlook.com
 (15.20.8251.004)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB6532:EE_|DM4PR12MB6589:EE_
x-ms-office365-filtering-correlation-id: adcb2431-bef3-44c6-3d36-08dd1b5cbee6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aHpqYTlBd2ZGNzU4WU9DNjZuNXpuUGJ1cWlka0dwVm8vMURxdk1TRDJ0ZlUz?=
 =?utf-8?B?anpBcGwvWXVhZnMyZEN6L0FsUXRPSjBoWGhITDFQZVEvRUl0VnNuQVNOaTRt?=
 =?utf-8?B?dWs4M1V4eXRJNXA4RmZPQklxcGZieU5MNUp1R29nMjM1MHNndzNtVFdidVRl?=
 =?utf-8?B?ZUQ4VFN3TmFTUDFYazFUb0UvLzNGb0d5U0xxR1J1MVZBclNWU1NTc0FSL2pR?=
 =?utf-8?B?clZNRWNSeGRiVkZvRHkxaytOYWFJR2R2RGxJSm1RK1ZEUDluR3lzOEY2QWtk?=
 =?utf-8?B?Z3RjZmJyVmc4Wk8yWVBUMlNJZTI2OTJnZzhDQmV1SElKRE1mMlhlaHE1eFRw?=
 =?utf-8?B?V3RkUmllUm5ES3Flb2pKOVpGN2tnSW04cU92RjhqZEtDNmRlc2NqUU9aTW5K?=
 =?utf-8?B?UlI1MCtDOFRIVDlQZUZmaDlJdGYyZmV3WG1LdTdrVE16dFFKUlFhb2FEeTBn?=
 =?utf-8?B?aU9sQ0QwRmtETi9qWHR6Mk93REQ4Yi82aVdNY2o2Y05lZFZxWXMybTgvUHVN?=
 =?utf-8?B?cHdudjlhT21QUVU5RjIvZ0k3ZDNwcFhyNVhEN29nbVdmampwNVFBd2JFNXNz?=
 =?utf-8?B?NG5GM2JzWGluRmFCUS9jeC9WdmxERURMejJUWWNpRVRoMUh4S0RLbngxYVoz?=
 =?utf-8?B?UVg0dG5yMDFYVUN0YU1Kb3VpVnk0YkRWMkhMMlVXZkNicEY4b3ZMbnRGYXJ5?=
 =?utf-8?B?SkRFNEw3dTVzWFFrMXNBVDR2SkNOYWlaemVUdW5UWjNIa1lKcG5QRkdRMkwr?=
 =?utf-8?B?ZHkyYTluRnJOYU5RNnR6dVdXdVcydzdjRXhmN2c2dEFGeWJTb2dhUGRVWEJM?=
 =?utf-8?B?VFJyRFh4SXdxTjF0blRmWFVmOTJRQmdpV0cxczBLcDVKbVRoTlMwZTcyb2dO?=
 =?utf-8?B?ODE2NEx3dUttUkVUSUpqRlNLRDZ1VTg0S3dkUDdjVXk3S2g3TzdzMWFZc2Yx?=
 =?utf-8?B?WWxQSDZmcmp3aEY3Z1Y0cDFUUTRydXJqT1FqNmtOcXJ2eXlja1R0ZkNMZ1pl?=
 =?utf-8?B?OUM3M0crclBiaE9OU0RrYkU3WU95RzdsZ09qdTh4TmxWVVFLMjlMMmM2YUdq?=
 =?utf-8?B?M2JlamtURDFOeXdmc2ZGc2YxQWlWY0dDZWdURCtiOWl2SWg0Q2xyUjdGTjRm?=
 =?utf-8?B?TjY1amZsT1pHWUF0SGZBZDZRUFl3eHRTdGRybGFaU2gxWk5nU3FlNS81U1NT?=
 =?utf-8?B?R3VDL1E3di9xOTlNb3ZwTTE3Y05QWXJ1SE1hcnNqR2EvWlI3QndMemxRZ1Jl?=
 =?utf-8?B?RmRhQnQ5TkNwaGY0MERGUi9xeHZZam1TRE9YN3RYOG5NeTIrc2ZiakY3K2NS?=
 =?utf-8?B?Y1BuNmFnVHNRamdGSUZ6eWlGbXB3SkdGdWYzZkkybHBXblpnOWpDQVRFZmJa?=
 =?utf-8?B?RzFSeHBhUEZibkttRm03NzVRMERCc3l1N0ZRdWNPN29VYjFGK2VqQ0pxYXVa?=
 =?utf-8?B?NkF3Ujd4N3ZtdkJOdWxENFYzd3BoR0dTRmNFVWFiQ2Y1czc4VVU4amRkeUNh?=
 =?utf-8?B?b2EwVXQwOHFjaEx2b3VyaHFuTTV5MVl0b3ErZjdvQWEwdXQ3ZGZkckRLQ0N2?=
 =?utf-8?B?cjZ2dWZGdVI1cWZySDJPbDN3aGFYdHJudkwxMmpJL1lJK0JmVEwzNVNTVGgw?=
 =?utf-8?B?VzI0Z1hxa1AzQ2tmbFViZnRGL1BpWkVmaCt6aFN3ekN2VnJUUXNJUXAvRk9a?=
 =?utf-8?B?dm05QmpJSStnZlhTc1Z2dWVHVG56VzVwckpDd2ZRRnVpbmRkTzA2NkFpUnlK?=
 =?utf-8?B?VVZJS2ZOd3VITWs5UStsT3M1TXRxWlhGMVhURVM4a0lEcDNkNnZhbE5KL3Q1?=
 =?utf-8?B?MmZIaENoRGRTbmd2T2F4TGFyRWhWQUNkM2JsMHpwTFNyQUx5T0hlY0xlaEpr?=
 =?utf-8?B?MXVmb1pvMU52bXF3YndZOHZuVTlpVVBPalVDcjcwTWZaWW10eEltUnVGK0VG?=
 =?utf-8?Q?cAGUfq5lgOw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6532.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnhETDc2S0kzOC9RRXgyVjZyTlQ0ZS9TbHhLVnFRQjBJNEZiNElBczN1U0F5?=
 =?utf-8?B?Z1pHQk1saG5HaTF2UzNJQlJKbnY1b3lFYWU1ZGI3TEp2S3NUTWlwdjkxU1RM?=
 =?utf-8?B?WThNVVR6d0pwSG5ERnJ3Wjk4OGZtbUUyUG9jcXhtNnA5WnpQNW5pOVlFVnBn?=
 =?utf-8?B?b1YxUVpjR3l6cys3VWw5V1N4anIzTm1GV0dVNzQvNHdQVTYxUVl4UjExTFI0?=
 =?utf-8?B?VlBTcmQybklSYkFTa2Yra0w0Wk9JdTVWcXl0M1pwWENvRU51RnZtUkhlZThr?=
 =?utf-8?B?S1JyVm1rS3R2UkhOWkNkd1Nud001TW5aRjljL0pkeTEzR1RSd25PQW9UQmxO?=
 =?utf-8?B?eStDdHlheWFydHhMV3oySWdmV0ZXekNEa1A3cUtBekdpbkdLVmJaT1ZJcmV3?=
 =?utf-8?B?em56RTV4ejZabitvNEdTNFFJT0Y0eHVQMC9ROElyS3BZSlFFanZpODJZQ210?=
 =?utf-8?B?MDUrZXBSZTZlYzYxTVF2b0c4QzhDdnVZU1FhajlUTjNxb2JWY2tVaWxzNm05?=
 =?utf-8?B?YlF4VXVTdU9tWmxvWmV5KzZra2hrZkJWTGI0MW9ZZUpPVjNjbThRaTVYVGR0?=
 =?utf-8?B?dXQ4dVJQTFBoV2N1Mm5aRFN2UmpUQTdWZUtBMkc1aVZIcGhEM2YvZnFYdE5Q?=
 =?utf-8?B?T2lFR045cVdTV0daYlY0akZCK3pYTUQwTWh2L0FCN1c1R3plT2dFS3M3Yno1?=
 =?utf-8?B?NGpIb3B6OXFsblNBK2tOdlcydlBaVy9ha2owUUZtelRjamNBdjJhdHRlSnhR?=
 =?utf-8?B?bnIyTGtFV0RsOFgzdnR0SGJKbDlNUXhhalkxUHA2aEtnc1FhSjBRa05JZk5i?=
 =?utf-8?B?Nzd4dE0xQTN1TW5BK3ZLbGFHYzcrdnYzY0ZBbUhGbnZQaFZCRThwYUFtWWda?=
 =?utf-8?B?cy9mSm54T2NxWVJjRm5McDI0MTZGVGJDekZIaEsxUjcycU1ZbUtGREdJWkpJ?=
 =?utf-8?B?MlJrbzdKQmU4ZXAyc092TjhWSUF0Qjc0ZTlVZlNLUHVjQ01nenViT0QzYmY2?=
 =?utf-8?B?WFI2aU9ONHBHUi9UaitzdDVFSnlKbEs4N3gwK0NGcTM5ckgrU3Mrckd4SWVi?=
 =?utf-8?B?NTFpTlkvdEFSV2NmQTRJV0dvRkszWlR0ZWhxM2ZPZjhMSUxuWnpvSTlGNW4v?=
 =?utf-8?B?QUZ5bTA4WXdvTWFWd0J5RXFMRm4rUUhrUmhCUlFHTnJaeVNNWDE5bE0zTkxn?=
 =?utf-8?B?L1FremZZVFdnOXlld3BMOVhpeDFzTHJScXNDTDZLVkdwb3JLQnhlcklBWVIv?=
 =?utf-8?B?bC9EWGk0WFljbFErbW5mVjFJOXVrZS91Qm1UK0RualVkM1pYQjVpbjB0OHhl?=
 =?utf-8?B?UVlUQmt5OXp0bUNxZ0ppWDFCN3dncGZIRW11RUZvbHlGMVRYOEVydmg5SkYx?=
 =?utf-8?B?T0RzdEg0NEh4T0pFSG5ucXo5M05JckNzTmxubC9LZnZoSmRma1RYT1FtajBY?=
 =?utf-8?B?M2Zwa1VCL3o0N3hrN2YxNG1Eby9Bd00yTCs1V0wwd2JxT1BrbUlYNGNLV0pH?=
 =?utf-8?B?cG1RYlcxZzBBL1pvU2tWY3o5NlJVNzcyVWJRTWdpUXFPWW00NmY4UGNJcHhx?=
 =?utf-8?B?TVpydllTT3FvakV3WkdHS25OWTArNTl3ZHZwY0VPYlBxY0tqZ3BZckpha2Nl?=
 =?utf-8?B?NThFaGR4QWgzcFgxeVFoUmZDWklXWFcyZTEyUmt6cEFiMWZOaXdPNVB3dDlG?=
 =?utf-8?B?ZEdSRFpQZjJza3R0T1dTRlpwSU9RRmVjRWFTaHJpY0xiL1gzZy9IaFdOUy92?=
 =?utf-8?B?ZHhsMDFNb3lOVmpYeWxJMG1uNXlXNURrQ2FEbXFscGlEbkxDL1lKeXJac2tC?=
 =?utf-8?B?SjhLdUlTOUN2OFlmc2ExWE5BNW9YcHVOTHpaVEFMRFhJV3RaTHBINFdvbGtO?=
 =?utf-8?B?Y3I5WWhvRCtJbDV3RzhRNEplWWNNK0w4YTR0Z1pNVmJtUFlKVGRSUmhwQWdk?=
 =?utf-8?B?YjdJS0R1elBPTkt6RTl4T3BkdWg0bXpQbTNKMmRmbWVuYlBadTlRZ0lBaFZ6?=
 =?utf-8?B?SkJZa1QvUndZbkpuSVJYYXFJdEk1aCtyWk95WU9kanZWM2pkZWpBalRNNTFI?=
 =?utf-8?B?ejRpblNoZkdHRE9aWXliQ3dJOWVVU0ZkeU13OEhrU2I0UTZJalQ1TGROV2pt?=
 =?utf-8?Q?5hoM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <695641150F59DC4EADB28691B1F5A034@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6532.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adcb2431-bef3-44c6-3d36-08dd1b5cbee6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 09:58:50.9847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g3w95i5b/9UHIhVooztrCL6Yl5i3dhkc7r76mDUhMu/WvQphc0YPTCz/whHGFBOngfnqFgRzeJpZSjF1GlSNjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6589
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

DQpPbiAyMDI0LzEyLzEyIDE1OjQzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPiBPbiAwNy4xMi4y
NCAxMTo1MCwgSnVsaWEgWmhhbmcgd3JvdGU6DQo+PiBUbyBpbXBsZW1lbnQgZEdQVSBwcmltZSBm
ZWF0dXJlLCB2aXJ0Z3B1IG5lZWRzIHRvIGltcG9ydC9leHBvcnQgYnVmZmVyDQo+PiBiZXR3ZWVu
IHZpcnRpbyBpR1BVIGFuZCBwYXNzdGhyb3VnaCBkR1BVLiBCZWZvcmUgdGhhdCwgdmlydGdwdSBz
aG91bGQNCj4+IGNoZWNrIGlmIFAyUCBpcyBwb3NzaWJsZSBvciBub3QuIEJ1dCBjYWxsaW5nIGZ1
bmN0aW9uIA0KPj4gcGNpX3AycGRtYV9kaXN0YW5jZQ0KPj4gaW4gZ3Vlc3QgVk0gd2lsbCBvbmx5
IGdldCB2aXJ0dWFsIHAycGRtYV9kaXN0YW5jZSBpbnN0ZWFkIG9mIHJlYWwgDQo+PiBwaHlzaWNh
bA0KPj4gcDJwZG1hX2Rpc3RhbmNlLg0KPj4gwqAgU28gdGhpcyBzZXJpZXMgaW50cm9kdWNlIGFu
IGltcGxlbWVudGF0aW9uIG9mIHZpcnRncHUgZGV2aWNlX2F0dGFjaA0KPj4gY2FsbGJhY2sgdG8g
Z2V0IHAycGRtYV9kaXN0YW5jZS4gQW5kIGFsc28gYWRkcyBhIG5ldyB2aXJ0Z3B1IGNvbW1hbmQg
dG8NCj4+IHBhc3MgUENJIG5vdGF0aW9ucyBmcm9tIGd1ZXN0IHRvIGhvc3QgYW5kIGEgbmV3IHhl
biBwcml2Y21kIHRvIGdldCANCj4+IHBoeXNpY2FsDQo+PiBwMnBkbWFfZGlzdGFuY2UgYWNjb3Jk
aW5nIHRvIHRoZSBQQ0kgbm90YXRpb25zIGluIGhvc3QuDQo+DQo+IEl0IGlzIGhhcmQgdG8gcmV2
aWV3IHRoaXMgc2VyaWVzIHdpdGhvdXQgaGF2aW5nIGEgY2xlYXIgcGljdHVyZSBob3cNCj4gdGhp
cyBhbGwgaXMgY29taW5nIHRvZ2V0aGVyLg0KPg0KPiBJIGd1ZXNzIHRoZSB2aXJ0Z3B1IGZyb250
ZW5kIHdpbGwgc2VuZCBhIHAycGRtYV9kaXN0YW5jZSByZXF1ZXN0IHRvDQo+IHRoZSBiYWNrZW5k
LCB3aGljaCBpcyBydW5uaW5nIGluIHVzZXIgbW9kZSBvZiBkb20wLiBUaGlzIGJhY2tlbmQgd2ls
bA0KPiB0aGVuIGNhbGwgaW50byB0aGUgcHJpdmNtZCBkcml2ZXIgdG8gb2J0YWluIHRoZSBuZWVk
ZWQgaW5mb3JtYXRpb24gYW5kDQo+IHNlbmRzIGl0IGJhY2sgdG8gdGhlIGZyb250ZW5kLg0KPg0K
PiBDYW4geW91IHBsZWFzZSBjb25maXJtIG15IHN1c3BpY2lvbiBpcyBjb3JyZWN0Pw0KDQpZZXMs
IHlvdSBhcmUgcmlnaHQuDQoNCkp1bGlhDQoNCj4NCj4NCj4gSnVlcmdlbg0K

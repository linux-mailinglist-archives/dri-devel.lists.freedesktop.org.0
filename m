Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8111EB3AC17
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 22:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A9E10EACE;
	Thu, 28 Aug 2025 20:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="utrrBlfv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2065.outbound.protection.outlook.com [40.107.101.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED5810EACB;
 Thu, 28 Aug 2025 20:59:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UviJ4yFoT8cp8wBCRzMsMA2MmfYANKxKo9qvkmb+G4y7gtJxnIPKDUqdcerD4OB1l8rby/NdpEzvNJ+4zwmRuaTA2Y8kW4XHTSs1zKoG/4WCvBNDw0WPiP9lKTJEUY1divqXxPaZ1TSJ1EYkLr1Q+vTMCNQwsaPhTwEdM6AzYuVQaaciXPd3tezum/fjdTxEEO7Kcd3I8Dz5U4GDXqxsL6iKIEvBbXDdCRJUQYhFR/1zdpeNrm0QEwH9hev5I5A7m4aKm+hkKzdWjhh4xRolgDLLiZYNXkaXCNGycO781Nz25XmsJq9ipYKAhT45jKNaT7nwzWUsRyNrFbnY+h+utg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuOES7TyJVB40YqVH2j+mBJ57k54bKBEGPkkYDwU+oc=;
 b=dAgUQxtzpGbuzsoNid2qYKgjJ75BnSRRjRJxzSNCK1Q2N7kEYV+qT4kMngSv51nErqOVhhYcL4s+lW9E/NVUiV0ni7nfAg2VeOnoLYk7KEey0Vwm5Xk4u+2yRTXv1YJF+bonIjQRVTuvrNUv8hU5wIwKlHEFdErx1i5KSDnnwdbNBC0AiQp4g96UsXbm9PT3nwxPqUYO0H8VMVZS6eB4p25Xs1gdxbh97cVgrNcZ2OQb4mDPSPp4AH4YfBe1NZVS3F3aU/uT1D5UJpGu19a2zvXXUF8kQlyXLt4vZO2H40VS267HN1XvvcQkHsIrxiovHzEShLEBcpcLQtHLKkiQuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuOES7TyJVB40YqVH2j+mBJ57k54bKBEGPkkYDwU+oc=;
 b=utrrBlfv4JcfiQZ+Lz57xsi560kk0JhuuUjO8wGOqTHU0h3jDzTOblj3c48/5gRZAs0qsDDap1BuWLeFTIuQxTlGA0Ak9eM4sJOrVycgYIIxD9Rq4g/s6TZgnoRcd0w3uLC8U82Q/Xipy1v8XbMmGoewFL4w7B7Kn/2r150rrMFrHgOSnqTIFKuaeSIxjcaqaj0/ZvggQcdjOcidRX66bLCv9UED0QETjnjg7ywPvi678nHCD1V+EIJmjiQHkH3/g82wfockGfti5VxG1tM5MORFx//y6Qeb5KcgsLfgnIBJo1l0ivIukS5si0d6WWbzE9sYvf9XiaD5w+290suESg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by CY5PR12MB6381.namprd12.prod.outlook.com (2603:10b6:930:3f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 20:58:55 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%6]) with mapi id 15.20.9052.021; Thu, 28 Aug 2025
 20:58:55 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "alex.gaynor@gmail.com"
 <alex.gaynor@gmail.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "dakr@kernel.org" <dakr@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Hubbard
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 3/8] gpu: nova-core: firmware: process Booter and patch
 its signature
Thread-Topic: [PATCH v2 3/8] gpu: nova-core: firmware: process Booter and
 patch its signature
Thread-Index: AQHcFj8EsK7GTIDKG0e6dqx/BqyF07R4kKIA
Date: Thu, 28 Aug 2025 20:58:55 +0000
Message-ID: <0d7377cdca7f9aa1574c924073a2fcbcf0544218.camel@nvidia.com>
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-3-93566252fe3a@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-3-93566252fe3a@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|CY5PR12MB6381:EE_
x-ms-office365-filtering-correlation-id: b2bf51b0-1916-4f27-d1d1-08dde675b36a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Y09iSnBNT1MyQTRiL0lpMjhRRjkvNVJDQWluRGNYbTdzMTVLRXpsNHNQM1Zt?=
 =?utf-8?B?TjJ3dFZMWjNDblA5YUo5dGltNFVwMWRac1BHZk9ZUHYvK0VpVm1NVlRpRTgy?=
 =?utf-8?B?Q1EwRmJMclpaZnQzYk5tOGk0ek1RUGNRWTE2ak9Fclpwd3IvS3VxOW42MEdG?=
 =?utf-8?B?RUVmbkdSODZQUHhGeU1lZXU4UGozOWNOL2loSy8xQVdxeGU2NFNEdjVJTVhK?=
 =?utf-8?B?bVZCR3NiUHBaTEhQZnpHUEhXVGprN2JVbjVSUFZBSHV5Tzg4OWo5SEZEVUQz?=
 =?utf-8?B?VnI2ZHRlYTd1c2tsRFZxRFo4aENkRWk1ejU0cldONFhORUhNMVVjc1V1RWF2?=
 =?utf-8?B?SEhmdFVvZHZrV0k3MWMxcVF4eFdLZ2Q0aG1ueU91ZWp3dnVrMHhQa1IxNFJw?=
 =?utf-8?B?UVJWdys1R3VCTHBWNjVVL2xQYU84VC9Xb2N0TmRYN3FUbEVMOHdnMUttMGlv?=
 =?utf-8?B?V0s4VUVjRmh0alh4clFjYjIxdU10Y0NSYW1SY24rSk5OUEZwMHBzZCtZUTJ2?=
 =?utf-8?B?TGs1dU9objhPUXJ1R0FOOU5TTWI0d2ZNaFBLeUh6Y1FhSHQ5N0ZvT2poMEVJ?=
 =?utf-8?B?d3hYNEx2RVFrWGI1dU1JNm1mVkRZemIremREWHZYTWhYN0ZySlBHWkNtVW5D?=
 =?utf-8?B?VEdZcVc2V0FxRWRzQWFFdVYrQ3ZOdkg1UkNBUEIrSUFGd3c5elJBUmJyNXNT?=
 =?utf-8?B?MkQ4SlR0bWNHVG1Od3NvK3huemFOSmFZUUUzMWQ0RWlXcFhINGppVi94Wmdi?=
 =?utf-8?B?WWxEcW8zckE0K0xIMGoxOGRBR1d2NHFBeVBic0pBVmdrSGthZ0cyZ3lXRFJz?=
 =?utf-8?B?b3ZwcUlHVUxiMXRycCtKTFpvSFBJa3dNUll4aU1NZ0FoMlhUTlVzU2JHblh6?=
 =?utf-8?B?RnVwM2xzT0EvU2lCZGZ1a3dNM3FzNFZIYzkrQ2hoRHp1bnBrbnNyTUZNcTNG?=
 =?utf-8?B?QklDWnczeFloKzdoaXRXSGxJWEl6TXl3M2RIZkRKOG9aa2UvdGNXL1VJM1ht?=
 =?utf-8?B?SXprRjJUdGpPeTE5ajR2N3hoYjJGQ3Z1blB2SStvZHNXcUtEaXpkdllPRGRx?=
 =?utf-8?B?c29QNTB2RVNCL0JRejE1c3RGc05uZmEvR2N0QkQ0ZndjK2xSSUl5cEV4bHVi?=
 =?utf-8?B?S3ZEenBOQ2l3TE9LYWdlV2FNcWsxZTZRNU1SWVAxTEdpSUkySUtPQ2ZpSjNH?=
 =?utf-8?B?SW8ybnNXUVN3d0I3MkZlcUs5MUdmVmpFSG5GWFJzbUVpRUpYU3ByYnZ1OWsx?=
 =?utf-8?B?RXlONE92UjJMSWxEZ0RHL2dTclY1MDNXT1BZeFJzZ0J4TGhWUEttWFFXa2M3?=
 =?utf-8?B?eTNOSktjUGV2Vkxsd1UxVUNqUldLSklVbUE4MGRkdytkbUJlTnpuOEl2ZDgy?=
 =?utf-8?B?bi9KTTlabHlSOFJVNzl1Ync3V0hFYnUzYmxySHBsTEllQy9vUFRKTjFyd2tt?=
 =?utf-8?B?ei9CN2FvMWRZTTBadjB3T3JlUE1zNUVyUFdZK081U1pwSUFUWmR6djI3S0pr?=
 =?utf-8?B?ZndNMXRXSkJxL0ErdzM4alZoSDRDdGZVU3gxMWt4OVNieC8zZEx5RjNlbnND?=
 =?utf-8?B?OWFPdlAybUJrR2lpdUthWnFUTWQ0SjFwb1ErQUFhVWpVdkRaczdpVEtTUDJi?=
 =?utf-8?B?MmFWWSsrT2FhYjNXcW1WU294ZlIxWDFzbGJBZWVrb1JJZ2RhWEMvUjExeTUr?=
 =?utf-8?B?L3E2cG5JK0txRkxHWTlCL3owNlhWMVloVUtFSlZESjNrOHE0WDVNYWZJWkdN?=
 =?utf-8?B?Wk9tNlBmOGIzbWJSTCsvYVJDZ0tUSTNzUGVDM3pQNkZCME1NUTBIMUZNdG9Q?=
 =?utf-8?B?V3c0by9qV0RwcTdubDdzNmtEOEo2SEN6YjUzcXBNenFFZ0NVZGpPNkZFUW82?=
 =?utf-8?B?R2lRR29WSUdnWFQ2L2IrcWhzU3FWZUpOOTVqRlo4UVh3SGlKVkR4ZFJtVWEv?=
 =?utf-8?B?TDRmaS9yWi8vcEtySGR4eDJnWHp5enZEQkE1ZzQxTDNncHVNSXZXODg0dks4?=
 =?utf-8?Q?8Wa++3gJtLnP79EoWmBX+CP8d1jTEU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3lValFaRVRTUVRxS0VhN0pRdit0cXBaRnNtQnZJQUE3ZDNpbGtiNTFDTjY1?=
 =?utf-8?B?UklhMUZLZDJuQXVGZzFhdWtXTGtpZnhQRXVnc2swQ2E0TkxwRmxrK29wT1pW?=
 =?utf-8?B?L3lhYndlQ3dsRGNnaXZPVW94ZVZBRkl2dXJaNkZqUGhqRkhrRS85UVpLZ25E?=
 =?utf-8?B?RVliTzVyYm1HZ1pDaDJQREo0amFhVENCeE1uZEUzMkk1QnhoR1ZPQjJaMEdF?=
 =?utf-8?B?aWVpUnFIWlhyNDZIa1ZNS0RLTVMxSDMxN2IzelAzbFQ3ZUw3QzVqUldvOGFu?=
 =?utf-8?B?NXVtYW9tclVDUVh2aCs4bXdncEZVMFVXRDMzQmNqYnlXNjRtZnEvYXEwblJj?=
 =?utf-8?B?VlZhb1o0UU1pYUxDWDZvMVhYSU5DbllRY3lMdjlQTGJ4bGt0L09vaFhvbitn?=
 =?utf-8?B?VjhvMTdkY0F0UlZ4WnUrZis5NSs3WWdlUmZFcHkxNGpiU0t6ZDE0VFZqQVZ0?=
 =?utf-8?B?L1d5aXNhRmdNOWlFblNZY2JjcUU0amtsaUlXL2tpUVFkNERjS0dHUUQ4OG4z?=
 =?utf-8?B?citlWUtBNEVsdjZKOHBNeHJaNW9GYkpROFEwVVBHQ05XZzhNZjlZTWlSb3Vs?=
 =?utf-8?B?V0IyQTZsQ1ZCTjBkN2dZZm52SzFqRHhUazVPa01hRFdwcFZRcitBUStwVGVn?=
 =?utf-8?B?RHhQMmFGYktxdmYzT3FYdXVMQ2RTWDNQQm1Tc2ltWTh5SUpXcWg0SFc5QmN4?=
 =?utf-8?B?SVJESmVRY2FwUWp0L1pJSk1IVkZyeXBGRFMyVXhqRWxNb050YkUzVDRpZ3FI?=
 =?utf-8?B?L2VRYnBrNWZlbUtGbm9lZmp5MTJPQ05mL1hGem9idlhLbGtqRmplTDRzbUVS?=
 =?utf-8?B?NlVTWWJJWWY4Mm43dmFQbERWb2wySEtONE1YVHJENFV2eXQ1bEZhMEhzL2xx?=
 =?utf-8?B?Y0xuNi9IQnF5WEJncHl4ZndwYnBxMVZSZHlETW42VGZ2VVNIK1VHcDFHbVR0?=
 =?utf-8?B?Ykw1ZHlLcXVBNUFWR21rSGw2NUNFZjJma1N1ZHEvWjNXMmNoQU5KYU1HMUla?=
 =?utf-8?B?MldWT2h4ZW5VQUlpeEZCV1BMeEpSMVZobjVPYnZyTjlNa3NTZTNPVWpPQ3pR?=
 =?utf-8?B?TGpIQ2Y3R2h5YnVNYmIvNEVPOHowZzhkenRlU0c1aGhHSkFxSzFjRDN1N1ZU?=
 =?utf-8?B?L21xWEVwNU9TTm1LYXppNEJQcnlPdXBmMHNEYU9kazRJTjZBRVlNUWF2dmhV?=
 =?utf-8?B?TW05ZExPNUp6UnNCTkVIVU9yUHkxdlJEQ1V2MjNoSVZ1cFZnRGxMVk9XdzMx?=
 =?utf-8?B?azJpbGt2ZnphQlVnb0dieko1am1KcG1najkxbHY5STlDNHcyNnlnUk9Baldz?=
 =?utf-8?B?aTV2ck93NjByNDJhV1dmUlcwRjMrTERPNUJkVUdBNVd2dEIxNEl6UkoxMWdM?=
 =?utf-8?B?QnlvN0dnclBURmNzSVVGNnBzN2VxQlowQVZCV1Q3OTgxZ2tTc2pqM28rTHVh?=
 =?utf-8?B?VnZucGFCQkwyK2tvQkY4U2d3VzNHQjBQZFE3UU54MEdMa0VSRDNUVjFHY1pX?=
 =?utf-8?B?QlRzTkY5amo0WkZYUWFTL25rN0tNamxiZTUyS0pZNUMxc1pGTjV4OUd6NS9P?=
 =?utf-8?B?WUtJL3Q2dVkzNUZzOUFJcnRJQnFmdzVzOUVGKyt4d29ZSm9hczN4anpndnRp?=
 =?utf-8?B?VUxEV1VwbFp2WVh2NVRNWTBHZnBrb3lVVWo1bHR5U2JURXNVWm0yZFNXblQr?=
 =?utf-8?B?a0EyL05ZYTliUldDQlVJQ21JMXl5N3NidkhySHZUaHBicFZWa2xPYis3cmJw?=
 =?utf-8?B?bXhxb1I5a1FqVmZvSTFXY3hWZjE5MWdiYjBLUTFIdE91WnpiSVVVekpaUVZx?=
 =?utf-8?B?T0NYVUlWQTMvV0tKcGQvN1p1bFRJaE8rSmdORFFYSEFVZjZhM01VN3h3OEZO?=
 =?utf-8?B?bUcxUkdVcGk2N2p5M1lEdjcwZmw4cmRrZW91S1J1cFlmeDl0bnVJdzd0c0hw?=
 =?utf-8?B?ZUtlWVNJekI5aWJid1ZET1NhUHBmNC9BY1JLa2d0bEh3WkhyU0o0U2xxeDQv?=
 =?utf-8?B?TUZONVFxNFdrUS9DYmVYVWFpV0pCbzE0VkJkRDdrRWtXYWR4STAvRldJM1B5?=
 =?utf-8?B?cnNaQTArTWtNYkRoZGRmYnFmSWZzL3ZvbEVzNHlHL0ppVEowbFNHdnJhUnUv?=
 =?utf-8?Q?d7NcQcPsAO0gnpDdkrpg/s6N6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C17B48CC6BBE5543985C92E4C3AB4F70@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2bf51b0-1916-4f27-d1d1-08dde675b36a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 20:58:55.2147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j9LnFQf7GJ3xWuiy4jjv9+Utgianj4M6zVHTOoUU7FThaQQ52YpwWzbvJ933YjQecO4OIOEg1K1XvyzmldhJtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6381
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

T24gVHVlLCAyMDI1LTA4LTI2IGF0IDEzOjA3ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gK3N0cnVjdCBIc0hlYWRlclYyIHsNCj4gK8KgwqDCoCAvLy8gT2Zmc2V0IHRvIHRoZSBz
dGFydCBvZiB0aGUgc2lnbmF0dXJlcy4NCj4gK8KgwqDCoCBzaWdfcHJvZF9vZmZzZXQ6IHUzMiwN
Cj4gK8KgwqDCoCAvLy8gU2l6ZSBpbiBieXRlcyBvZiB0aGUgc2lnbmF0dXJlcy4NCj4gK8KgwqDC
oCBzaWdfcHJvZF9zaXplOiB1MzIsDQo+ICvCoMKgwqAgLy8vIE9mZnNldCB0byBhIGB1MzJgIGNv
bnRhaW5pbmcgdGhlIGxvY2F0aW9uIGF0IHdoaWNoIHRvIHBhdGNoIHRoZSBzaWduYXR1cmUgaW4g
dGhlDQo+IG1pY3JvY29kZQ0KPiArwqDCoMKgIC8vLyBpbWFnZS4NCj4gK8KgwqDCoCBwYXRjaF9s
b2M6IHUzMiwNCj4gK8KgwqDCoCAvLy8gT2Zmc2V0IHRvIGEgYHUzMmAgY29udGFpbmluZyB0aGUg
aW5kZXggb2YgdGhlIHNpZ25hdHVyZSB0byBwYXRjaC4NCj4gK8KgwqDCoCBwYXRjaF9zaWc6IHUz
MiwNCj4gK8KgwqDCoCAvLy8gU3RhcnQgb2Zmc2V0IHRvIHRoZSBzaWduYXR1cmUgbWV0YWRhdGEu
DQo+ICvCoMKgwqAgbWV0YV9kYXRhX29mZnNldDogdTMyLA0KPiArwqDCoMKgIC8vLyBTaXplIGlu
IGJ5dGVzIG9mIHRoZSBzaWduYXR1cmUgbWV0YWRhdGEuDQo+ICvCoMKgwqAgbWV0YV9kYXRhX3Np
emU6IHUzMiwNCj4gK8KgwqDCoCAvLy8gT2Zmc2V0IHRvIGEgYHUzMmAgY29udGFpbmluZyB0aGUg
bnVtYmVyIG9mIHNpZ25hdHVyZXMgaW4gdGhlIHNpZ25hdHVyZXMgc2VjdGlvbi4NCj4gK8KgwqDC
oCBudW1fc2lnOiB1MzIsDQo+ICvCoMKgwqAgLy8vIE9mZnNldCBvZiB0aGUgYXBwbGljYXRpb24t
c3BlY2lmaWMgaGVhZGVyLg0KPiArwqDCoMKgIGhlYWRlcl9vZmZzZXQ6IHUzMiwNCj4gK8KgwqDC
oCAvLy8gU2l6ZSBpbiBieXRlcyBvZiB0aGUgYXBwbGljYXRpb24tc3BlY2lmaWMgaGVhZGVyLg0K
PiArwqDCoMKgIGhlYWRlcl9zaXplOiB1MzIsDQo+ICt9DQoNCllvdSBhcmUgaW5jb25zaXN0ZW50
IHdpdGggdGhlIG5hbWVzIG9mIG9mZnNldCBmaWVsZHMgaW4gdGhpcyBzdHJ1Y3QuDQoNCnBhdGNo
X2xvYyBzaG91bGQgYmUgcGF0Y2hfbG9jX29mZnNldA0KcGF0Y2hfc2lnIHNob3VsZCBiZSBwYXRj
aF9zaWdfb2Zmc2V0DQpudW1fc2lnIHNob3VsZCBiZSBudW1fc2lnX29mZnNldA0KDQo=

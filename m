Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D539A27A32
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 19:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63AF10E6E5;
	Tue,  4 Feb 2025 18:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jKwsY9En";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB31F10E6E9;
 Tue,  4 Feb 2025 18:40:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ym0jLacmR3eXi9i4pWN87LeTKSD/u6Htxa2pk0ugFPj8gt54m+LEyfHtBnqGlWU499eWHRkFT7esWjCxApMCHRnl/3fiR7e3UljTlqmvqjeZ3GRAy0OoVUKOoTbNFx6dIWYtqhYJOMeDlogyI6YW52ACyCFk5UnflvgdCKEOmYM0Dg4VIInCqUZAhQV3rkTdcEJltTBAJWs+vQ4sKOmIV2H8J34Jv1k9cvxmPhlYTXfW1xo2O9I+Xprp/puclTK9F0Ipd3hB5YWhpMF5hjXraksd2lqsmaAOKfFiLHIEcBou4xdqlEbLafoYZfWqMp526+yB0itAaV8ZklSNwMbcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRLqjeUenqms/1SrHqM/fQPg2nVq2QAzlaJMCERpJuY=;
 b=SGQJJgMmYNtOp0cbqTTPORthDneKVjrB5NFac4ZaxLPt+2MV13T+Iu3Ruf/IOUlgYWWueTz4TtUWxs/IGEA3xdMOAqbZ+1TxarXQL6GJQo7bnlCT1auytbQ1lm6Vu1Afzjl3eQh33lBoWn+ehjc7momrqIaGvGON2JlqhNWPIGktclfFgRC6QSMfoWV3Vr+mj1Zu0xohwKlx4VMZLpR7tOkWXAK6Oc/Wy12NC1ckhaVpkNH9B6q6X2fl1edYOkiwt0txUqaYhLr6qmmrRLGZWNd4P2Wz4oeE/xQfVDLYeuQ7i7Ii9JSeadMP06m42YCeeGeEvr805VuuLylh3HxC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRLqjeUenqms/1SrHqM/fQPg2nVq2QAzlaJMCERpJuY=;
 b=jKwsY9EnUlBt3gUZIulRI2lXF/vHxCC2dewHxlshPp7iW++KzIOzolDPwthbYYrAcq667Pz7+vZgypaM25L0D9gkeYiKkRF3+AP6dQr+DRgaQMyKRl+8t103JVRgmNCsjnmzIhRwEc8H8Mjui6SjIN3dLil7IQMBZKKH3Ub+IER8zrYNBfaSh3C7i/ifSg+NjKMFAvngwga94FxrURfq3/9wh1giqY2hs4JDrqMluahD1qWA7asBC4PqF/K/gVWqZQ2hg8tJA3vyw1R/WcNDBOaIMK8XkjqfMNwL8PXvOWqX7C8r+3Oww1W+DtRC4faHCBiusErv/mYKAw9PK1XQzg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by IA0PR12MB9047.namprd12.prod.outlook.com (2603:10b6:208:402::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 18:40:41 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%7]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 18:40:41 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "corbet@lwn.net" <corbet@lwn.net>, "ajanulgu@redhat.com"
 <ajanulgu@redhat.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "lyude@redhat.com" <lyude@redhat.com>,
 Zhi Wang <zhiw@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>, John
 Hubbard <jhubbard@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, Ben
 Skeggs <bskeggs@nvidia.com>, "mripard@kernel.org" <mripard@kernel.org>, Neo
 Jia <cjia@nvidia.com>, Andy Currid <acurrid@nvidia.com>,
 "pstanner@redhat.com" <pstanner@redhat.com>
CC: "tmgross@umich.edu" <tmgross@umich.edu>, "benno.lossin@proton.me"
 <benno.lossin@proton.me>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "gary@garyguo.net" <gary@garyguo.net>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "boqun.feng@gmail.com"
 <boqun.feng@gmail.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
 "aliceryhl@google.com" <aliceryhl@google.com>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/2] gpu: nova-core: add initial documentation
Thread-Topic: [PATCH 2/2] gpu: nova-core: add initial documentation
Thread-Index: AQHbdCwu+RMuoeQjx0CdwWV2o6BeULM3gDsA
Date: Tue, 4 Feb 2025 18:40:41 +0000
Message-ID: <168287b8cbb95f190a656f7f428e16b8ac93b41b.camel@nvidia.com>
References: <20250131220432.17717-1-dakr@kernel.org>
 <20250131220432.17717-2-dakr@kernel.org>
In-Reply-To: <20250131220432.17717-2-dakr@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|IA0PR12MB9047:EE_
x-ms-office365-filtering-correlation-id: 1d66605f-3ff7-46fc-68b7-08dd454b6d26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?S0NmM01sc2c1NmVRdTZsTEFjSmNRWVJIZzlFZEFUYTdpK2Z1ODVOTUtxekla?=
 =?utf-8?B?KzN2VEdocUsrTzVRVVg4TDhoY3g0dG83aFhtbEEwbWZ5YUhnSzM5WEc0U1Rl?=
 =?utf-8?B?NEZJbFZRYzRoZnVzd0tIaTc5cmM3QmdjcUJrRmRpS2Zha01obVU5dFZyZDZU?=
 =?utf-8?B?QTJDRXJMRGRrd1VJTmorMGQxTnY4eDJJMnd4RFQ5RWZFU3RVU1BVZEdtMmZx?=
 =?utf-8?B?a1h0SVNINUFZeUY0ckdFN1o1S2x6cG9SWmJxSlJLdWI1K1dIdzN1bmRiVHNT?=
 =?utf-8?B?b3E3d3o5SDk1VEw1ZWV5UnloTmxtenk2QmZJbWtpRVNQZmVhZFlqcmU2a0R2?=
 =?utf-8?B?VXFDaFBVSVMzVDRENERhNUVDSjFiWFd1UzlVelVvUDU0czVuMlAzL0FwZjQ5?=
 =?utf-8?B?MlBnUzB4Rk54Qi8zcm9KZlUrOGxDR3l3VzFsMjlqczVnWk5YRFc2L01UWFVa?=
 =?utf-8?B?bnhJSlZVVUs3T3EzMFduTWMzNVExWDRCaDgrOENkdzg0SUM5aWNzMHVvVk9X?=
 =?utf-8?B?MkdPcHBlNnJ5VnRWK0dJRjV2ZkN1Tm16WXVDdzZySVMzd1pFQWp0ZlR1SFFm?=
 =?utf-8?B?VnAyRkhUUVVlK0ZyYXhocVhLNjZuZEtSa3N0MUFMQXIrQmNKeGFzQlFrcWY0?=
 =?utf-8?B?ODVXcWdRbElBK2JMZDRLcUtZeisvTG5qZElhOS9vWGxzcDRJTnpRZGdlUEhP?=
 =?utf-8?B?UzJncTVMTUNhVFFOMjlrVlNxTlcvTFIvcy9SNENzUFh0eTY3bElyL1NEVFNk?=
 =?utf-8?B?Rm1hb0FXaDIzbXhITzdyNWZGdUsvWDJLVnlFaUozQXIxNnJkVHBwQmVKb3dp?=
 =?utf-8?B?WFNLdjk5MG0vTjNQcDNhTkY1L3BzVVJid0dISnhMR2RuNjN5bjVpSGZPbnI4?=
 =?utf-8?B?eEVYaFBLR29CL2RFZVMzMDk2K3JMYnhHMnE1NXZuZERHYURGNFFFK0dqejYr?=
 =?utf-8?B?dWZvRDBvVlBhLzdqakhJdUs2NGNFUzU3S2hyUTdQNk9NZUNFb2w5cVc2elFY?=
 =?utf-8?B?d29Nck5pN1Q0UXhFUVh1NlM5djlIZDY4bk9USWVoNDA0T3dmclF3R2thMnZC?=
 =?utf-8?B?NkhydDhIbXM2TkpzU0xYWlNMVFN1bmdyWnREazNzMG9wdkpqU0M5anRkRmR4?=
 =?utf-8?B?ZnZLM3d1Nm9XemVaUUtNR2srbVRUTUM5RTdMdlJLUU81Z29XWitlM2JoUUlL?=
 =?utf-8?B?SmsyTlRhdjlGTklnbGt3cGlDSUJ5Sk1YYzBxZ3RzckNackpkSFlVTWhUREFi?=
 =?utf-8?B?d2QrQTRrRDNHK0pPNXl4UlVBYkdNVFgvZXRoTHBORm5VV3dPRmFFWDNWYWZw?=
 =?utf-8?B?eHJ1bTUxemR2RTc3Yk54T2lJQkhJTjNJUGlqVU1CN1p0QUJ0QzRSMHV6ZDNB?=
 =?utf-8?B?c3dQUlpsMXZxOXZSSTd4aFFkYkZUelR3RXJCLy9EOVgyVWFTRVR5WEpaSWdq?=
 =?utf-8?B?OWRVZi9POFZGTWpmemp1SjlxTWtKNmdEQ2lWNDVWcXVzZVFpbEhmNm5hcWpP?=
 =?utf-8?B?SjBYR2NvRXlha1A2cTg2cU1OV3pNWFdqY01YNVVNWWNmN3R0bWNac0NQVTcw?=
 =?utf-8?B?eW84bExZR2FhODRSUUM5d3JJZmRjN2VMY2JkOFBaUnlGNkdIQXhhSWR3bmRp?=
 =?utf-8?B?eEhKcGRIcGRleDR5UWZ1QkNNTkhycjZXa2txWU14ZkZCam1uTnpaT3VjMERy?=
 =?utf-8?B?elNSQnRqUmdXTDNXSzNyaHJYakd4Z0dDTnRDb3hCMUhRL3czMGdURlY2cWVk?=
 =?utf-8?B?UzBlQ2tkeWNCQnVpZ1k3THh3U1c0d01MUFUzc1MxUTh4QktGc3JCcjVlcSt6?=
 =?utf-8?B?eE9rdVBndjN4cDlMUUtZcWwrdHFJU0twRWJVK055cG9TQWFISFowN1dSeDho?=
 =?utf-8?B?M1NuZ0w1TjhaK2FsK3BLSUtTMEJ4YnV4Uk9ja2VDYjRzSEk0eXhNRExNTmgz?=
 =?utf-8?B?aEgrZ21PbUt2TlV5QTl4S3R2WWJ3c2JaU3ErOUNvQWR3LzNUbnlLN2lBQ0gy?=
 =?utf-8?B?Uk96MzZsdEV3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWpwMGpnWG5tS25yWUFWdDBNSGQvSDBDaGZtcHliYVVKOFpOb0o2YkxuVlRq?=
 =?utf-8?B?MzdYWXEwYmY3TUxoSWNNSlBPQ1NXYzNUTU9pQzh6d1pWRktMc2NBcTJEcTMx?=
 =?utf-8?B?Tk1UMEcvQ3B0VEdSdzNqNy9zbVYxTmY2c2FScXpsdTdVaHRjbm8zRmVYMTNh?=
 =?utf-8?B?MWZwU3VyWWJqV1ViTlZxblBEaDJVN1BnUlhwOFRkVXQxZjd4L0lGVUt6K1Nh?=
 =?utf-8?B?TG5hS3gwdFloUnRab3pOWUo4a2x4eHpqT092T2hpcFkzY2U4WmdYMk0zK2oy?=
 =?utf-8?B?Qi9LNDJNb1VYbjR2Y01OSWtMSElDQjVMOVlxTEVPdXM1bDYzYlBvWUZXMVFO?=
 =?utf-8?B?TTdYREIxaWdTS0lJN0pCZVF2d0lNWTV3SkZ6VEFpQTAwQjVkYjZWbVRJNU5Y?=
 =?utf-8?B?QjVyaHRzQmFOeEl3SHd0Wm10b2JtN2gyMS90Q0w2NUg4b3pJMTB0eHlTS0N1?=
 =?utf-8?B?Szg1Z2gzK0llZ3RjVWtXMi9FZDUyQ1NiQ1p6T3djek03YVpQbVRzdGtzNTZ2?=
 =?utf-8?B?YXpyODFlZnBMRG1obzFGN1lyYzlhZGdOdmFydjlTVVhQN0xDK053T1lZOGgz?=
 =?utf-8?B?SnhrVWNyYzdNK3JIdUlZR3EwMFJnMHRyVGR1NVJCYWdiVXdTMnNlbG1xTnFF?=
 =?utf-8?B?NWg3ZHpZR2UxaEVHTTRRUEJFUkQ0TjNaOVkrUk40S1FLYnVNc2J5SDN6VU8r?=
 =?utf-8?B?Ui9GbTVTQ0dhVEFxWnJBOHhGSEJoUE1PUUFSdlBvQWRkWHNNMm40b2NYUWM2?=
 =?utf-8?B?a0JIVzhEengvbnRjNDdRZkhWTlRuQUZGdWUvUVZyWkE4UGRJbDduQmNuUHZP?=
 =?utf-8?B?eDZEa2F0dURLTWJSVDhzMnQ1dGhSbDhtaGVPNDZoWGliSVpoYk5kamdYYmtz?=
 =?utf-8?B?UVl4ditoRnB5QWltbEdxR1R3YUl3L1ZsdEpEa3U5dXo3OHArNGlrM2sxdG5W?=
 =?utf-8?B?NHFKQ0JONFc1SmVqYzdOaVNXNDl3SkRpR3hPRW9EMFNwRktmQ2FEM2NScTZl?=
 =?utf-8?B?QncrdzByMjJWcDJRSlN1Q0lnY2YrdHRaby9tOEhUOWlwdzJyUWdxOWo0OWJL?=
 =?utf-8?B?U1N3UGFMOGZjUndwR1NiRkpxU2RpYm1qSUIxN2dyS2NMYi83UWUyNXI0b0o1?=
 =?utf-8?B?bVpmUU1kd04rZTZ5ZmNEakJHZUZxYnAyeHptQ21RenlWWnRyNVR3WTJ6aUJj?=
 =?utf-8?B?ZEhZNUpEZ0JsMnJNRTRVcmxiOGwydEVPSUdEazJUVG5RVllWd05NekVERDMv?=
 =?utf-8?B?UUhCN3p5T3M2QWRDenEvVFZlLzRyeU4yb25EN3NWVTdJNHJFQkR4a1EwQVkx?=
 =?utf-8?B?VkRzQVU5ZDErcEJtaHpRQmNSTUx6U1FFTE5DVkNSN0dFRXQyWjdFNVFOR0lG?=
 =?utf-8?B?citWNHJxYUtNeWthR2U3anZYMEx0dmpRMC8xcmxBTmFBT1R1bXVKY1ZSMU95?=
 =?utf-8?B?VHdMVkNQbmNRdDZtQXlVYzV1M1ZnWXB5YlJuTUt6NmhGcE40RjdIeW1NNFlJ?=
 =?utf-8?B?MDJGYitBakl1bmQ5RnBSMWc4ZG4xMVFEbDk0UkZuTWF1VkdLT2NERU5aY2M0?=
 =?utf-8?B?QWhHL0VJalY3eHp4OTViUTNEU1RQUk5ZdTE0TzhZS0pNVzRqU0tiUVM4MW5V?=
 =?utf-8?B?di80d0hxL2pxQ3BhRVh1VkFnRENhRzErZzVKVTJpOGZjZXpEdFA2dmtHdFFp?=
 =?utf-8?B?VFJ0Zm45ZUhUL243aVhEVlBYd0NGZzlVTXZ6U1BqUVE5cUxYZm9ldGFXVUFr?=
 =?utf-8?B?Tmg4bDlNdUMveFhqbmRWdW5YVFlEZUt0WWpBUDJwYnloQ3F0WEJqVktJUFFw?=
 =?utf-8?B?NWlHL2RSNzVSVmp3T2tYbmJPVndJTVZKRHVydTFEanBMSjdocE9JTkROaHB4?=
 =?utf-8?B?azYySGVtWlhjWW5GWHBvTmp5VUUwRFV3Q1gwOWduam9SRk5oa1BqUGpsUTlk?=
 =?utf-8?B?VXR1ZXVKZXQ4K3dNRFVZOTIyYTljSkROUmlBMkREZHR0WU1OWWUvY0xoN0xV?=
 =?utf-8?B?bURxMU1DR2NQNk04RHBOV3ZYaEpQMWk5U3l0Q29Lb1huL0dJaVlZZTlZVTZT?=
 =?utf-8?B?a2RQQktyd3phbktKY2xZcFplTzM0V2tXU3VYd2JEQTZHVE1XSlNjVytoQXUz?=
 =?utf-8?Q?t6RFdTsnNm1RQR062ycdGeZt5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4067637A76DF9F479A7CA973B26CC0ED@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d66605f-3ff7-46fc-68b7-08dd454b6d26
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 18:40:41.2000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EEKMawGthQjwWU5VtnjhzRXME7hrJykWc81VxZvm5SXOrpGMxF4y9ZN/dRyUiX/toVSoBVVUDr7+J2L3MDQUow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9047
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

T24gRnJpLCAyMDI1LTAxLTMxIGF0IDIzOjA0ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiArUnVzdCBhYnN0cmFjdGlvbiBmb3IgZGVidWdmcyBBUElzLg0KPiArDQo+ICt8IFJlZmVy
ZW5jZTogRXhwb3J0IEdTUCBsb2cgYnVmZmVycw0KPiArfCBDb21wbGV4aXR5OiBCZWdpbm5lcg0K
DQpTZXJpb3VzbHk/DQo=

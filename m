Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E7EA825CB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 15:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1312410E8A6;
	Wed,  9 Apr 2025 13:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dRAxgQmC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915D610E8A2;
 Wed,  9 Apr 2025 13:14:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fs6Tj49ilOSPjZCMn89VKsxECJkHEJ1iimhQ3la4D92d62B34dCxN4Mbe24Tvjr/s0e8DK4eAa8iPgOUr/GjyOvM4cLXhkAsRCJ3gEHfp8cXdqTsgUy81UHDQMg5yUyOK9+7eAPCacyD2P/CFM1Rw5vv1XfqmyXF0q/GgPRFAI0eIY0sEpAg4N/DvUF3rQVZjKtQFPwJ6DknbyKFDDfufwG4Mvlm1PuazJjpvO4vzS8WpX83aV0tWkgIzoz09QS7g3hb9Kwi/b+YjG/FdCd2GzX+YdNcAsS16p53oNuP2fU2oJNqMboTg4JU4w8Ofskb4yYEoVWTTOECli2LyXLEeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+beTUDOeGNcOa9/1Qw0Po1vYpAh/ASpjaKzQowXQFMM=;
 b=cpIdX/Uh4vTdc15HV1pK7QnOQYS19BUWHPeZaw+dkmVuRKj3VX4KT4+2FzMz9jaoi/rYQG4fiyDrke5PKgFzby0rh/liNoClAKMdw6EynNKEfMGj+8ypLaFpb3mkeh/0zMZwoJAx2JK6hv0s7Vtx8OpUdGgn3zIcEHPp0ulUDUwVK+dqFdM/nV+7zTadSKq/OIbNAd6DYJvzxSE8GMnDRBXhO34K0JlgqgL90r/tdTmAvDN5KmjEVyp8Qy2a0on/0gniRdIaHz9QyI5qiudyDDxhi0eKWSR0PpaNM5c/JWnbUbOEkaoR+DFTgEm249Qc4ScZ3GUVOXmbjc+uFDnJ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+beTUDOeGNcOa9/1Qw0Po1vYpAh/ASpjaKzQowXQFMM=;
 b=dRAxgQmC0zNMbEAs8630LRhZD7iHx+pvTbJdw0KYo1Wu9xxEjc2bM4KDjVyn5Het56savKyeuFzgPrDzCRKEv3ZoZKXVfzPDVZ5+tP2u+pTUgleTZAEzqI+39szz+z2V26wfmzPl+SneAqXqmFD7i1msqJzMFhTfKFmLt8U4ykM=
Received: from SA1PR12MB8599.namprd12.prod.outlook.com (2603:10b6:806:254::7)
 by PH7PR12MB7892.namprd12.prod.outlook.com (2603:10b6:510:27e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Wed, 9 Apr
 2025 13:14:42 +0000
Received: from SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b]) by SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 13:14:42 +0000
From: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>
To: Philipp Stanner <phasta@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>, Qiang Yu <yuq825@gmail.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, Dave
 Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Matthew Brost
 <matthew.brost@intel.com>, "Huang, Ray" <Ray.Huang@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, Melissa Wen <mwen@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra_Canal?= <mcanal@igalia.com>, Zack Rusin
 <zack.rusin@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?iso-8859-1?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Bas Nieuwenhuizen
 <bas@basnieuwenhuizen.nl>, "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>,
 "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "Huang, Tim" <Tim.Huang@amd.com>,
 "Sundararaju, Sathishkumar" <Sathishkumar.Sundararaju@amd.com>, "Jamadar,
 Saleemkhan" <Saleemkhan.Jamadar@amd.com>, "Khatri, Sunil"
 <Sunil.Khatri@amd.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, Ma Jun <Jun.Ma2@amd.com>, "Huang, JinHuiEric"
 <JinHuiEric.Huang@amd.com>, "Kamal, Asad" <Asad.Kamal@amd.com>, "SHANMUGAM,
 SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>, 
 Friedrich Vock <friedrich.vock@gmx.de>, =?iso-8859-1?Q?Michel_D=E4nzer?=
 <mdaenzer@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "lima@lists.freedesktop.org" <lima@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] dma-fence: Improve docu for
 dma_fence_check_and_signal()
Thread-Topic: [PATCH 2/2] dma-fence: Improve docu for
 dma_fence_check_and_signal()
Thread-Index: AQHbqUgKH5m0Y2vyt0qwPWKmlhdvzbObSmeA
Date: Wed, 9 Apr 2025 13:14:42 +0000
Message-ID: <SA1PR12MB85990C007B278312B023783BEDB42@SA1PR12MB8599.namprd12.prod.outlook.com>
References: <20250409120640.106408-2-phasta@kernel.org>
 <20250409120640.106408-4-phasta@kernel.org>
In-Reply-To: <20250409120640.106408-4-phasta@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-09T13:14:41.695Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8599:EE_|PH7PR12MB7892:EE_
x-ms-office365-filtering-correlation-id: 5f375aab-a741-4b98-702c-08dd77687d68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018|8096899003|921020; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?qsAR5voT6dCTiouAFvKMVy8ByjdxNedFMpA7mKgDMhneJraJe3SqAnymaF?=
 =?iso-8859-1?Q?NjTD3FfOhSRy08AU+647wsiKXkxJCcLeXxw0zV2FhVejRdrpZHGkpzCjRP?=
 =?iso-8859-1?Q?y+822xUzER98wjVpDv+7oFiI7B90sDXbdj6WdiELzFKAtjkg7cqvZxgDlM?=
 =?iso-8859-1?Q?/0j3B34JeAE7BHzNE7RLJKU+67PVr68POW9fQL5+PUGY75R87+8zD6BDOt?=
 =?iso-8859-1?Q?LnOHdHwPtd/xX4M2T4bbNBvDe6OzZEWXJ5FSLU1KP/gE+3Th8Ck5Ap0C9F?=
 =?iso-8859-1?Q?Eek+Tp/ZqBj7OZon0WniC0rgVunqK9BNiViBIP0FcnOMJq+ryK2olXoXVK?=
 =?iso-8859-1?Q?EwCdlIXlMqsD8sS5UA9lDbaqc/OuOY535sbCqPWyuepM5uA7T9IhBv8mYg?=
 =?iso-8859-1?Q?IXC/zOzf3y3TidjO5L/99XuzLklE9r4oHu4i4XHBrVlhqO1GpWm0GYaWGV?=
 =?iso-8859-1?Q?hFuyLmZ4dl9QNtQbICU7OeoQl4KxCOtg7XWMmPzCflu9avqqtogvg2cR3c?=
 =?iso-8859-1?Q?eH8qYEYD0D7Rex8mrh3yjadUfDJP7FrkABThQYDVxpu2wWS9iY4sHfPqVb?=
 =?iso-8859-1?Q?dEQcIV5bKiXOQPIaukWxWExvobRFu47qXVkNm0phKMlOOXFJ7isO0M3EYS?=
 =?iso-8859-1?Q?zrMW0HFauLl62cfPYenB84QdWY5B+kfCBNqNuU/VDj34fBYuvVn3EnZMdh?=
 =?iso-8859-1?Q?RWXZiNPJqZTuBkBoIGf6Se53J7xspHhlIRL6kb2GciQCf59iSZyEJF/KRW?=
 =?iso-8859-1?Q?9X/uOUlGQZKfPadhUK2lelP1fHQVRwhZb5jy4KWvKIvaqdocJ50OPe7eiU?=
 =?iso-8859-1?Q?BtMuS+ggWBUe7P57MuCq3ksjnGVjuy79tPxOt0yDuWUvXsA/5sNOFaHpTr?=
 =?iso-8859-1?Q?qp0m1s2EvTz6I5HYV/93WA9Ak7wio6x6P89vOL17xZKrPbEgSpyEpdMGcp?=
 =?iso-8859-1?Q?4dmPRpI4F4J+2rzPkMC0lPff54+/VH7L3IGPqB8YI7dwdNBFhcnJnjMNCM?=
 =?iso-8859-1?Q?1DjMrUlxmVfKDvymT4M0YnSEEcxmZ7bFU7i7d71rtvZxZZKdcnjtJAEncH?=
 =?iso-8859-1?Q?LZVisWfsIUJY4Ml2dOaeOki6kgVvg3D5GHGC7Dnf/ymME2+Q1WR0Cdzuph?=
 =?iso-8859-1?Q?rT045e2IwG199H/zBFhobc8v2JMPa+81yjg/8XzBJGnl9II5/4tnKrCHxL?=
 =?iso-8859-1?Q?4MPIEwYEZ1uOiICjm2HEaV3Ta9s3IxGeqJ8W9mIV3ZBdmvfupi3Sh8K93S?=
 =?iso-8859-1?Q?CLjLD52u2AjTs6YeFPw4if3axvBPYRO0bE4sbnX83l+adD1XGkO5OG3CYt?=
 =?iso-8859-1?Q?yKVUyqNFQd29xGmsgf4OmzcO6ZZ83e7I2PXXKC9LY+QV6hJadvb/57kh8Z?=
 =?iso-8859-1?Q?bXvQ+2Il6mG37c8wXFLh6/t1RVQ+q/LfEl0KkHVkLoCG47+gkqq87Ldt1q?=
 =?iso-8859-1?Q?29S3s49uS7piL1MYSJHOwZPBYfq8RJlWdjOa+D0Cag6T6S+6FkkRhKznuy?=
 =?iso-8859-1?Q?1krAyKadON3vn3QP4dqAXJqoMbMrbECf+reUCOcgGejdhrDWQ0GpKpxdFT?=
 =?iso-8859-1?Q?U31LMN0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8599.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(8096899003)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?aetH4S6mEIbmpXy8Y1HXh0pSRIaffU5Z2tcmHFLF9aaB0Mcf5rsfltdcsd?=
 =?iso-8859-1?Q?v62yJ9T+uXRe08NJLfyNmnQpjNIh1d+IeFwGQSh0X/hnGaueX2aMkauoiS?=
 =?iso-8859-1?Q?/a0sm+Mt+qehnxs6VkSKvaf7qsoFucu8FV4hCc1iMRkMw93R9+56l7c3NM?=
 =?iso-8859-1?Q?rpjB0CjTS4Xe5I0Sq96dvUMzGbWedamCs7ZGJVSqDeLvWdYM+aQwsCMrPe?=
 =?iso-8859-1?Q?JIIkU1pY/FIhfmwOv3FMJPG2iAVfqP2Pb7Zw1pLETs/RvAaYrxRBXIaxmX?=
 =?iso-8859-1?Q?hq9ZTZF/CTPcQD4pUXdIIxkUt1LZR9F48U0n+rVQ+sIINA4933wQ3HVPzZ?=
 =?iso-8859-1?Q?JfTHV9kLPgp37MEIdV7+6gMMIIM7hNn/7cgLpVAP2BNYxtOGD5RJ3ZdtmY?=
 =?iso-8859-1?Q?/aQvav+vgnhHgmI2K3O0EkFmR233SPHwl2yOFtsCu0Nbh9vN+bgsKqejp5?=
 =?iso-8859-1?Q?Ch/9mzsGrY/yzU5b0b7PLrZC54cMHyEATRcqmnAeNRCr2Id6zwPQjuYFM0?=
 =?iso-8859-1?Q?6WX4ZMIYKK20IYMOOpQ9Ar+ReEbvNvPDkjFfswIUmOXyR8p5jcPqx0nLPC?=
 =?iso-8859-1?Q?haisgcgryUvWu6S9rrWG8pbOlpcJ58ilq9Abs1duKFWq/Sw5P/1n01a5Ri?=
 =?iso-8859-1?Q?qfE6U9YAxyIHbJlmmsBsjHsEBmtFmqxbKtjFbxs80l4ix+BmqZKoj4HX9D?=
 =?iso-8859-1?Q?VT8UYLtcm3rwDWfgRsMjGHu8rzZaIrOFhq+grei7rnV9vXoJkQx7HGlEMq?=
 =?iso-8859-1?Q?9zMEZXDrlS1c9PHt/+vtWTfQa12RedCFs66NxSJyvDMGl5KQC6lLKk+fzO?=
 =?iso-8859-1?Q?icsPF7ZXNBUsgjMakAgsYfwWiYwTi6fSU4WAhsMh1pyOS8+EF7YyvR3aTY?=
 =?iso-8859-1?Q?PZjurL2tDOxLJOtupNkmuxQqPO01WTNwvA0xtihBz16rMfiYT2MN196WWh?=
 =?iso-8859-1?Q?5uJOdjFRyyzQaiUzPCJs7ckHJW5lJdcE4LY8888Gpd3MN+MBGcbZnK14AL?=
 =?iso-8859-1?Q?8XU6nU731DtdadXF8/Cj3YsshYx4uWqqGe0kNTgi2iGhXsqJIPmt4Fv4SV?=
 =?iso-8859-1?Q?tVKB6C06iNmDFH/ITukhplyXx/iXvokMRp6cUJfeS/dz5hCES3oFbrp50I?=
 =?iso-8859-1?Q?2aYLAaYQ9v1nAQusAi3NvRoH18sHIFcD28GYKeYeZr2letsHvelQT1PnHR?=
 =?iso-8859-1?Q?metCVxtvF71kOjG2XQ2eiderogBQKBE+5/rzMHgtqwbMg9vss2AxYgxt6U?=
 =?iso-8859-1?Q?lcLjG+RENdGv/GJyrbFrslwOQ53PR5OkwTdB4nTk91GsGE1etlpqFhBVyi?=
 =?iso-8859-1?Q?e9V5c9itMsS2R8F/yN/lZ0p78cI8aRtBFTlhgMfn/KnNfZ7eO1F7xwHKkQ?=
 =?iso-8859-1?Q?3Al4LTHvhJQd2akIv4DXyU6oXOCglNZQvhaSIVkHKvVQCqVYiFFzScj4tm?=
 =?iso-8859-1?Q?d0YRAd1buF/Y09HCgeOoRj2ZGM9O/p0NriafwYhdAGw1wtMnJRdnZpVbVk?=
 =?iso-8859-1?Q?qDy3MKyvnoVFnqxsYKdsSXu9I3LQmkgj7zcaTj6BCxL03B4kCr3Sgyc04s?=
 =?iso-8859-1?Q?/YNnlovr8lyQgF4hB7N2l7ZgaQ7nWFMpJpijidrGdg80794l7HAqd+OulQ?=
 =?iso-8859-1?Q?IqGSKWpQNkfRE=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SA1PR12MB85990C007B278312B023783BEDB42SA1PR12MB8599namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8599.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f375aab-a741-4b98-702c-08dd77687d68
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 13:14:42.0701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /9Mxv07spe1AZbizOl6ybzdOSBMXEPOJs2ZeKdh6K46r6HDm4rfWKhMw67+n0Vfw2+TbczNNQ5/jl5HfGtLSdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7892
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

--_000_SA1PR12MB85990C007B278312B023783BEDB42SA1PR12MB8599namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Philipp,

I feel like the problem has two parts. The documentation does not make expl=
icit that DMA_FENCE_FLAG_SIGNALED_BIT is "caching" the hardware state when =
a fence is backed by hardware, so what dma_fence_is_signaled here is doing =
is just busting that cache; when the hardware signals the fence, the dma_fe=
nce is considered signaled, just with a stale cache. It looks like because =
of this omission nouveau has made an assumption that there could be a canon=
ical path to signaling dma_fence but in reality, anyone could call dma_fenc=
e_signal at any time if it realized that the cache is stale.

I do think that the caching behavior here may be confusing and it could be =
a good idea to separate out the concept of a software fence vs a hardware f=
ence.

Regards,
Teddy

________________________________
From: Philipp Stanner
Sent: Wednesday, April 09, 2025 08:06
To: Sumit Semwal; Gustavo Padovan; Koenig, Christian; Kuehling, Felix; Deuc=
her, Alexander; Xinhui Pan; David Airlie; Simona Vetter; Maarten Lankhorst;=
 Maxime Ripard; Thomas Zimmermann; Lucas Stach; Russell King; Christian Gme=
iner; Jani Nikula; Joonas Lahtinen; Rodrigo Vivi; Tvrtko Ursulin; Frank Bin=
ns; Matt Coster; Qiang Yu; Rob Clark; Sean Paul; Konrad Dybcio; Abhinav Kum=
ar; Dmitry Baryshkov; Marijn Suijten; Lyude Paul; Danilo Krummrich; Boris B=
rezillon; Rob Herring; Steven Price; Dave Airlie; Gerd Hoffmann; Matthew Br=
ost; Philipp Stanner; Huang, Ray; Matthew Auld; Melissa Wen; Ma=EDra Canal;=
 Zack Rusin; Broadcom internal kernel review list; Lucas De Marchi; Thomas =
Hellstr=F6m; Bas Nieuwenhuizen; Wang, Yang(Kevin); Zhang, Jesse(Jie); Huang=
, Tim; Sundararaju, Sathishkumar; Jamadar, Saleemkhan; Khatri, Sunil; Lazar=
, Lijo; Zhang, Hawking; Ma Jun; Li, Yunxiang (Teddy); Huang, JinHuiEric; Ka=
mal, Asad; SHANMUGAM, SRINIVASAN; Xiao, Jack; Friedrich Vock; Michel D=E4nz=
er; Geert Uytterhoeven; Anna-Maria Behnsen; Thomas Gleixner; Frederic Weisb=
ecker; Dan Carpenter
Cc: linux-media@vger.kernel.org; dri-devel@lists.freedesktop.org; linaro-mm=
-sig@lists.linaro.org; linux-kernel@vger.kernel.org; amd-gfx@lists.freedesk=
top.org; etnaviv@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; li=
ma@lists.freedesktop.org; linux-arm-msm@vger.kernel.org; freedreno@lists.fr=
eedesktop.org; nouveau@lists.freedesktop.org; virtualization@lists.linux.de=
v; spice-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] dma-fence: Improve docu for dma_fence_check_and_signal=
()

The documentation of the return value of dma_fence_check_and_signal()
and dma_fence_check_and_signal_locked() reads as if the returned boolean
only describes whether dma_fence_signal() (or similar) has been called
before this function call already. That's not the case, since
dma_fence_ops.signaled() usually just checks through the sequence number
whether the hardware is finished with a fence. That doesn't mean a
signaling function has been called already.

Make the documentation clearer.

Move the Return: documentation to the end, since that's the officially
recommended docu style.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 include/linux/dma-fence.h | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index dc2ad171458b..3df370b2cc7c 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -385,14 +385,21 @@ void dma_fence_enable_sw_signaling(struct dma_fence *=
fence);
  * dma_fence_check_and_signal_locked - Checks a fence and signals it if ne=
cessary
  * @fence: the fence to check
  *
- * Returns true if the fence was already signaled, false if not. Since thi=
s
- * function doesn't enable signaling, it is not guaranteed to ever return
- * true if dma_fence_add_callback(), dma_fence_wait() or
+ * Checks whether the fence was already signaled, and, if not, whether
+ * &struct dma_fence_ops.signaled indicates that it should be signaled. If=
 so,
+ * the fence gets signaled here.
+ *
+ * Since this function doesn't enable signaling, it is not guaranteed to e=
ver
+ * return true if dma_fence_add_callback(), dma_fence_wait() or
  * dma_fence_enable_sw_signaling() haven't been called before.
  *
  * This function requires &dma_fence.lock to be held.
  *
  * See also dma_fence_check_and_signal().
+ *
+ * Return: true if the fence was already signaled, or if
+ * &struct dma_fence_ops.signaled is implemented and indicates that this f=
ence
+ * can be treated as signaled; false otherwise.
  */
 static inline bool
 dma_fence_check_and_signal_locked(struct dma_fence *fence)
@@ -412,9 +419,12 @@ dma_fence_check_and_signal_locked(struct dma_fence *fe=
nce)
  * dma_fence_check_and_signal - Checks a fence and signals it if necessary
  * @fence: the fence to check
  *
- * Returns true if the fence was already signaled, false if not. Since thi=
s
- * function doesn't enable signaling, it is not guaranteed to ever return
- * true if dma_fence_add_callback(), dma_fence_wait() or
+ * Checks whether the fence was already signaled, and, if not, whether
+ * &struct dma_fence_ops.signaled indicates that it should be signaled. If=
 so,
+ * the fence gets signaled here.
+ *
+ * Since this function doesn't enable signaling, it is not guaranteed to e=
ver
+ * return true if dma_fence_add_callback(), dma_fence_wait() or
  * dma_fence_enable_sw_signaling() haven't been called before.
  *
  * It's recommended for seqno fences to call dma_fence_signal when the
@@ -423,6 +433,10 @@ dma_fence_check_and_signal_locked(struct dma_fence *fe=
nce)
  * value of this function before calling hardware-specific wait instructio=
ns.
  *
  * See also dma_fence_check_and_signal_locked().
+ *
+ * Return: true if the fence was already signaled, or if
+ * &struct dma_fence_ops.signaled is implemented and indicates that this f=
ence
+ * can be treated as signaled; false otherwise.
  */
 static inline bool
 dma_fence_check_and_signal(struct dma_fence *fence)
--
2.48.1


--_000_SA1PR12MB85990C007B278312B023783BEDB42SA1PR12MB8599namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Philipp,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I feel like the problem has two parts. The documentation does not make expl=
icit that DMA_FENCE_FLAG_SIGNALED_BIT is &quot;caching&quot; the hardware s=
tate when a fence is backed by hardware, so what dma_fence_is_signaled here=
 is doing is just busting that cache; when
 the hardware signals the fence, the dma_fence is considered signaled, just=
 with a stale cache. It looks like because of this omission nouveau has mad=
e an assumption that there could be a canonical path to signaling dma_fence=
 but in reality, anyone could call
 dma_fence_signal at any&nbsp;time if it realized that the cache is stale.<=
/div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I do think that the caching behavior here may be confusing and it could be =
a good idea to separate out the concept of a software fence vs a hardware f=
ence.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Teddy</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Philipp Stanner<br>
<b>Sent:</b>&nbsp;Wednesday, April 09, 2025 08:06<br>
<b>To:</b>&nbsp;Sumit Semwal; Gustavo Padovan; Koenig, Christian; Kuehling,=
 Felix; Deucher, Alexander; Xinhui Pan; David Airlie; Simona Vetter; Maarte=
n Lankhorst; Maxime Ripard; Thomas Zimmermann; Lucas Stach; Russell King; C=
hristian Gmeiner; Jani Nikula; Joonas
 Lahtinen; Rodrigo Vivi; Tvrtko Ursulin; Frank Binns; Matt Coster; Qiang Yu=
; Rob Clark; Sean Paul; Konrad Dybcio; Abhinav Kumar; Dmitry Baryshkov; Mar=
ijn Suijten; Lyude Paul; Danilo Krummrich; Boris Brezillon; Rob Herring; St=
even Price; Dave Airlie; Gerd Hoffmann;
 Matthew Brost; Philipp Stanner; Huang, Ray; Matthew Auld; Melissa Wen; Ma=
=EDra Canal; Zack Rusin; Broadcom internal kernel review list; Lucas De Mar=
chi; Thomas Hellstr=F6m; Bas Nieuwenhuizen; Wang, Yang(Kevin); Zhang, Jesse=
(Jie); Huang, Tim; Sundararaju, Sathishkumar;
 Jamadar, Saleemkhan; Khatri, Sunil; Lazar, Lijo; Zhang, Hawking; Ma Jun; L=
i, Yunxiang (Teddy); Huang, JinHuiEric; Kamal, Asad; SHANMUGAM, SRINIVASAN;=
 Xiao, Jack; Friedrich Vock; Michel D=E4nzer; Geert Uytterhoeven; Anna-Mari=
a Behnsen; Thomas Gleixner; Frederic
 Weisbecker; Dan Carpenter<br>
<b>Cc:</b>&nbsp;linux-media@vger.kernel.org; dri-devel@lists.freedesktop.or=
g; linaro-mm-sig@lists.linaro.org; linux-kernel@vger.kernel.org; amd-gfx@li=
sts.freedesktop.org; etnaviv@lists.freedesktop.org; intel-gfx@lists.freedes=
ktop.org; lima@lists.freedesktop.org;
 linux-arm-msm@vger.kernel.org; freedreno@lists.freedesktop.org; nouveau@li=
sts.freedesktop.org; virtualization@lists.linux.dev; spice-devel@lists.free=
desktop.org; intel-xe@lists.freedesktop.org<br>
<b>Subject:</b>&nbsp;[PATCH 2/2] dma-fence: Improve docu for dma_fence_chec=
k_and_signal()
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">The documentation of the return value of dm=
a_fence_check_and_signal()<br>
and dma_fence_check_and_signal_locked() reads as if the returned boolean<br=
>
only describes whether dma_fence_signal() (or similar) has been called<br>
before this function call already. That's not the case, since<br>
dma_fence_ops.signaled() usually just checks through the sequence number<br=
>
whether the hardware is finished with a fence. That doesn't mean a<br>
signaling function has been called already.<br>
<br>
Make the documentation clearer.<br>
<br>
Move the Return: documentation to the end, since that's the officially<br>
recommended docu style.<br>
<br>
Signed-off-by: Philipp Stanner &lt;phasta@kernel.org&gt;<br>
---<br>
&nbsp;include/linux/dma-fence.h | 26 ++++++++++++++++++++------<br>
&nbsp;1 file changed, 20 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h<br>
index dc2ad171458b..3df370b2cc7c 100644<br>
--- a/include/linux/dma-fence.h<br>
+++ b/include/linux/dma-fence.h<br>
@@ -385,14 +385,21 @@ void dma_fence_enable_sw_signaling(struct dma_fence *=
fence);<br>
&nbsp; * dma_fence_check_and_signal_locked - Checks a fence and signals it =
if necessary<br>
&nbsp; * @fence: the fence to check<br>
&nbsp; *<br>
- * Returns true if the fence was already signaled, false if not. Since thi=
s<br>
- * function doesn't enable signaling, it is not guaranteed to ever return<=
br>
- * true if dma_fence_add_callback(), dma_fence_wait() or<br>
+ * Checks whether the fence was already signaled, and, if not, whether<br>
+ * &amp;struct dma_fence_ops.signaled indicates that it should be signaled=
. If so,<br>
+ * the fence gets signaled here.<br>
+ *<br>
+ * Since this function doesn't enable signaling, it is not guaranteed to e=
ver<br>
+ * return true if dma_fence_add_callback(), dma_fence_wait() or<br>
&nbsp; * dma_fence_enable_sw_signaling() haven't been called before.<br>
&nbsp; *<br>
&nbsp; * This function requires &amp;dma_fence.lock to be held.<br>
&nbsp; *<br>
&nbsp; * See also dma_fence_check_and_signal().<br>
+ *<br>
+ * Return: true if the fence was already signaled, or if<br>
+ * &amp;struct dma_fence_ops.signaled is implemented and indicates that th=
is fence<br>
+ * can be treated as signaled; false otherwise.<br>
&nbsp; */<br>
&nbsp;static inline bool<br>
&nbsp;dma_fence_check_and_signal_locked(struct dma_fence *fence)<br>
@@ -412,9 +419,12 @@ dma_fence_check_and_signal_locked(struct dma_fence *fe=
nce)<br>
&nbsp; * dma_fence_check_and_signal - Checks a fence and signals it if nece=
ssary<br>
&nbsp; * @fence: the fence to check<br>
&nbsp; *<br>
- * Returns true if the fence was already signaled, false if not. Since thi=
s<br>
- * function doesn't enable signaling, it is not guaranteed to ever return<=
br>
- * true if dma_fence_add_callback(), dma_fence_wait() or<br>
+ * Checks whether the fence was already signaled, and, if not, whether<br>
+ * &amp;struct dma_fence_ops.signaled indicates that it should be signaled=
. If so,<br>
+ * the fence gets signaled here.<br>
+ *<br>
+ * Since this function doesn't enable signaling, it is not guaranteed to e=
ver<br>
+ * return true if dma_fence_add_callback(), dma_fence_wait() or<br>
&nbsp; * dma_fence_enable_sw_signaling() haven't been called before.<br>
&nbsp; *<br>
&nbsp; * It's recommended for seqno fences to call dma_fence_signal when th=
e<br>
@@ -423,6 +433,10 @@ dma_fence_check_and_signal_locked(struct dma_fence *fe=
nce)<br>
&nbsp; * value of this function before calling hardware-specific wait instr=
uctions.<br>
&nbsp; *<br>
&nbsp; * See also dma_fence_check_and_signal_locked().<br>
+ *<br>
+ * Return: true if the fence was already signaled, or if<br>
+ * &amp;struct dma_fence_ops.signaled is implemented and indicates that th=
is fence<br>
+ * can be treated as signaled; false otherwise.<br>
&nbsp; */<br>
&nbsp;static inline bool<br>
&nbsp;dma_fence_check_and_signal(struct dma_fence *fence)<br>
--<br>
2.48.1<br>
<br>
</div>
</div>
</body>
</html>

--_000_SA1PR12MB85990C007B278312B023783BEDB42SA1PR12MB8599namp_--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18711B9D489
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 05:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA0510E82C;
	Thu, 25 Sep 2025 03:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RbF0pUXS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010017.outbound.protection.outlook.com
 [40.93.198.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCD110E82B;
 Thu, 25 Sep 2025 03:09:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RoeeBsDJ1DcBftktZew7i4R/unMwQbwPyAPr61k0NAy2nfRvfVLM8WjpYTGv1RZmYsxx3LB+KAYF1t6f61SdKrKP86UoFmETOC22snaJ3RssZxcsdQ6ncHMQwPSIjsWrI3KBJYrawIG6ruNTYP+62ZeeOuzVEARwjJ/NwCetYTSmfD6+bDv7X1SKA0on2RUOlUQX308li+2YCpBS9useFC6s7Clqe+nmfTEXRFE6NJYjRHG7eC57wMn6jrUicj2JC0HpCSP4D6+nsdnN0YuFHlKdadYKAAOWk0xdwb87SW8XaurPk0zb3nF0uzgedxwG0wMIoyhC1GnCHvOuR9c8GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfgRmDEwBGx9/QO5nySO27OOi9ViTOVbjAaxzGIZsbY=;
 b=d9R7BowezMJ1W5t95t35iHgwl/h6lNaRUz+4l21+laPBeG6Q/1JaXnWS94/SER7wGiOlibJjE0RHSmSHzjnMTTttfkGRR6o4z9sQBbuDWKIOK0jhl8v4Sx2X88Bdc9YeHpHRIs6LAgWr99AjimfxghcAwrtjjH+u+2dLQ28olob+W8jbsKSE6/JD4dKkgQsYMymsk/uYRX7euJ8atH4QrTfMiURG3IHeFQTLtj62WMxSSb2CUQJEYoKy1R4yxuWwe2aSw0u7TgiOGqdiGR0BhUEbviRuakbiUoqt8bL3yDMheHUc4j+n/hiQga8reIs8xvicJPJW88U91IRXsl+5jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfgRmDEwBGx9/QO5nySO27OOi9ViTOVbjAaxzGIZsbY=;
 b=RbF0pUXSQgj0M4/PGnQhjrhuocDLTj5uW6+gLFXA1nAYmIkze2LcfpHZsCRMQQlUWSjtZPhbAesnOJkAQUghUbJgsOqIfd0hPsiiH6f1IHgVJTeZqxC6W+8/V2BAx7ng632hIkSBTe8zs0C6DyggrM7S/RUxmgqICtxSh1N7murKfPyp99QxEMGcD5F7jjVSetBHihjnWuV9TJcZvKyvk/BD2hS8aGXJFfG1jjJzMfkHKKLLhcMt26jNtSOIId3LLN/sqO1pX1iXo7Cf8PrrL39v4KBfev/KnShPtVQWmvhNl4w1VpXbS2hghbbuXtKwS9jQNiWXglOQMCfcGY0B8w==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by IA1PR12MB6065.namprd12.prod.outlook.com (2603:10b6:208:3ef::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 03:09:41 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 03:09:40 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
CC: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>
Subject: RE: [PATCH v2 10/10] nova-core: gsp: Boot GSP
Thread-Topic: [PATCH v2 10/10] nova-core: gsp: Boot GSP
Thread-Index: AQHcK7R06ZDkYzega0isddeVEheGQLSjOu1w
Date: Thu, 25 Sep 2025 03:09:40 +0000
Message-ID: <CY5PR12MB65261F96A203E0FC76E78C89C21FA@CY5PR12MB6526.namprd12.prod.outlook.com>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-11-apopple@nvidia.com>
In-Reply-To: <20250922113026.3083103-11-apopple@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|IA1PR12MB6065:EE_
x-ms-office365-filtering-correlation-id: aca247af-5a08-4433-7d8a-08ddfbe0f7cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?WaIkdyUoF8Rlp5g4AXovE6pux4YmTprny/3nIHEXu18DYDDB0d10q66+iy?=
 =?iso-8859-1?Q?u8IwJq6sSeYyHvRniNDn5Wp/YInqHD6OeD5/t1J/7Cl3NzMQYfk/3Yyzrk?=
 =?iso-8859-1?Q?hQw1E2e1vg9dYOvuF+dis8Tj29aDYYB4K5Tx4GvU/53D28J9E4ZZu3jxO4?=
 =?iso-8859-1?Q?CNYWNqhcv0krHLOTjywQdtIvihfR22/wuXdT6B8QVbqJ1Tes8vuA0PXMP7?=
 =?iso-8859-1?Q?Mp0Vwo33wTCxwJORp0LrsSYIm66uEOvDaoJ+C0edQ4ScH2GRxfizTWYi18?=
 =?iso-8859-1?Q?hcgfMFvRftU2NXVDuI1GqDhWWN07ACZNvKwCUMXgA8V3DTv8Sz9bGkoukk?=
 =?iso-8859-1?Q?vCpF6OMf6RZF3EejI7KmPROhb28FuUlTFAh3l449U2I56HZNx0qkFSX8QN?=
 =?iso-8859-1?Q?SBWryluUgxPFEBw7RCBqtgI2f53RRcmgsFmLkTCdLrLJ41Z3PndWCu5Vjf?=
 =?iso-8859-1?Q?louTEoY6LN3OHzBua0AwVBPL/D9YoxaMrAvoEPcZhJA+RspmrA6+033T5s?=
 =?iso-8859-1?Q?b9hjD7Z8JB1LtgqRQ9z4JD27Cfi9BYl3V5dxvMY/ffzPzDWqyeYSpYqIiJ?=
 =?iso-8859-1?Q?KdoNEi8st/M05McztM1lCFTuzAHuvl3Mi6g87XF5mIvgCtV6+ENxH7drla?=
 =?iso-8859-1?Q?j44M0J9lIcw2liZT66OxMDakUVrbja6Md/aIOWvqBHjypPQYlSgBOPTZg1?=
 =?iso-8859-1?Q?X2vv7+MY0ewnlqMLeZ3n21toFWaN4zmnqVM5hm2XdjMutFhBeTiKOVUzlk?=
 =?iso-8859-1?Q?SNJPV6siBZBW+vyLw5k9HROf/Qa+8JxQrQEpRsxyE1buned4fV0cG8xEhb?=
 =?iso-8859-1?Q?jBzDYdrE1PmK6XWh6QE0/aFuBvttLeDHfblyXdpElOtXWGpHJIvLHWjsYy?=
 =?iso-8859-1?Q?xn21QOxZz2B7PaMdmOmX7qBGJuay8dvec3SPD3BebDUqICHJeBEyOW2TtL?=
 =?iso-8859-1?Q?t5CpuP3Cup717km3vp2T5zK7FAapdLgNmOfinlBBfOKeVuNzmPrQcdAzz8?=
 =?iso-8859-1?Q?Wayw4WU9go8XEwnwbxf2hIwcRrOnpTvPlfB8947Ynl7nDuQpg/ssEx1qBF?=
 =?iso-8859-1?Q?OhJke2ag955mI/ltdgl0HfFJIpfbWu7PR4q3lO5qnRIDBmwvNi0nGySFvY?=
 =?iso-8859-1?Q?kM07w6uLmKGCL+jcDy5G7mq5G07ESz+5yQi1Pp1Iojgp/LgQWzBcN42PIg?=
 =?iso-8859-1?Q?5K6F58iQMnT1USElkL0hP5uInJbEuZm5J+d3rXX7hlhkySi9ILAlANKsgh?=
 =?iso-8859-1?Q?M9ZyMNHmHm2PQgo4Wv/PFFDfjXtsDa0SNjyihGAV2Pb7WTzv4nDt+BFu56?=
 =?iso-8859-1?Q?o82BvWrJOHth7ooOhR2oY0y7Q2CEmmr6/GZ/FWzfhgOmYObSk3r+fiKJPq?=
 =?iso-8859-1?Q?PJ+LDhq+dApAtnBJGWk2lbZaQZuUOxv7fhKrvYp9iKVEaNvJT4wTEuslNP?=
 =?iso-8859-1?Q?ywFW8DVE/hJoEsBrY4AKgtEHuLjAuxdi5TlNW9mt7ogBMfI87+fc9rGXRK?=
 =?iso-8859-1?Q?PCXUMibVouluyV2FB/lIAtt7GvektbS0UNQCU3++OCfMrZSklUCUQ54c+j?=
 =?iso-8859-1?Q?SmWPmB8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?eU9UyAuOjtVAcst0Ek8HLIFanmzAPmPlHXuGdQzvGeRmCj0yFJc5dL0BWA?=
 =?iso-8859-1?Q?wg5Oa9k8V07GArFd2sJZIzVYZg7GcEqxxDFyOCYSbU8VNUeAaOV4CHBvhe?=
 =?iso-8859-1?Q?zhMuiHe45nE7M+r5M4519HqjzPGioSm1gFcdRxgoXT9mCHq/eM+WAi4cIH?=
 =?iso-8859-1?Q?MzI7+UpATHkQQwsWeLqealP2b6YGHj/VS5knAZ5e5gi7mUF6ddLsDLwrne?=
 =?iso-8859-1?Q?DpGBbuHEGjmnmlzPl+ehZknHzjFdNHxj/HRzj0qRJu7JwUHlBAry0PZpqE?=
 =?iso-8859-1?Q?EYc8pFZdqvVIXUilJMeNb8d4S0FxD1f+GAPLuyzFnU+GEnCiYLopHw5BUR?=
 =?iso-8859-1?Q?0FqxdF3l8xk7UJIRSzZ7KGELwaEibBo0Td64TJ0JuP2ky96kkLdenOn/Sk?=
 =?iso-8859-1?Q?kUXAxkIGy1eqio53tDstUTp99DGm1Mz6WK3Os3dDiBNyHhfbjHOsBteCEG?=
 =?iso-8859-1?Q?7Ht/TqvuR5HSBl5U1phNsz5ygioIS0jewf4QNt4WyLr/6/JfEyA4Avrax1?=
 =?iso-8859-1?Q?6XSyztE3jG73EHl3WufExNt5Hsq35AI3hM4M8JRvy5Ce6ERyFoKyeSF56S?=
 =?iso-8859-1?Q?JUprumA1mhv1dDdMHJhPpxwFZSwTFrWVj11lH7fZuSamy/4QfeK3SqLHxW?=
 =?iso-8859-1?Q?qcObfRq6IjbW16oqgb9H3TCMk5WvqqoJKLit0BCbTw3oL+AyhFmUVYk6nM?=
 =?iso-8859-1?Q?VPJKolAsUpzalzEQ+phtP2WWrAowNsYGsh1h2wOUB2jnsO/rJRtgrHzxtp?=
 =?iso-8859-1?Q?tnkisC8xE0fJGNtLtEUlUx+Ckk9/x6vCe0F8a7lkgxu2a8XtY+mrQGaK4Y?=
 =?iso-8859-1?Q?Sc2sl2+8ou1w12rgrRTsXUlSvsM/lokX9Bk6sH/e0oWsNTSCNPqsfHkiht?=
 =?iso-8859-1?Q?ZmoOR9Tn4gayKTAZ8PdJErqhCl6HM9WV2688fjruP1Zmtx7RMF13oeenbd?=
 =?iso-8859-1?Q?JbOAYGjyv5giRe1Rvkzv1cZl+Dlkbpm4KyzPHhKV/ffyZ56LYcbKBe2fjM?=
 =?iso-8859-1?Q?lYfENajhoRWa7Q64zOs+J+8adPvYtvnU+upoJqjbJDbqJjz8nhSeo1RAu0?=
 =?iso-8859-1?Q?H8LQN0WZLlHRD5l1ajwP4S6CEeG4AEN/JEXfLndhfLES6xXwr50388LHRv?=
 =?iso-8859-1?Q?SE49Bf3rp22GPIhlnSWu2Z97JFAhw42jxBVyKS/FDVh0mVuC4O46HEx5w6?=
 =?iso-8859-1?Q?YCNflT8YRRkRcSCu2LarjiSWTgs5QXxpRmq0rlWD/QD49aqXNDTr15i8fT?=
 =?iso-8859-1?Q?VNCh6QWxlW91Gw7ZZiAFTsnPeI1okCkUbjjtf21jz3eYgd9oe8ZXMhWxQz?=
 =?iso-8859-1?Q?TpRops8JP10ICjeovvqgYZ+Bblb/yjnq4yQS22QWPsCqGezLSR+cFtkrYh?=
 =?iso-8859-1?Q?8taK5zoKqGACFnzDSF3DFkkmJL5NhYZzLu0Gzvfy+EuCNhzS69YQjZV5Fe?=
 =?iso-8859-1?Q?ipq5sRiT4cbArWQwJF3Gvpz1JY1EwZRsQMa//Jwk1vyDbK8/swZ24CMMdp?=
 =?iso-8859-1?Q?9YO0skabOE/ZKSGzbEGxirhmoygYAlz6FYjD37XQ5LHXr7XEuaz55wuriL?=
 =?iso-8859-1?Q?rUuZRb4o+1EdSUMjWC+XHu6voJuvLvDKTRqyGkrpb+tynvwp/0bm3DSpl3?=
 =?iso-8859-1?Q?ztwu0AX4EHjTE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca247af-5a08-4433-7d8a-08ddfbe0f7cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 03:09:40.4996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JlLuh1Fa/TZ1EjHL6jFIN8jOrrrRBQyMKeqn6zudfJUAidxR/IvADxozjm988lEcTP4/E0SpUF6SQOo6wnPGNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6065
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

> +        sec2_falcon.reset(bar)?;
> +        sec2_falcon.dma_load(bar, &booter_loader)?;
> +        let wpr_handle =3D wpr_meta.dma_handle();
> +        let (mbox0, mbox1) =3D sec2_falcon.boot(
> +            bar,
> +            Some(wpr_handle as u32),
> +            Some((wpr_handle >> 32) as u32),
> +        )?;
> +        dev_dbg!(
> +            pdev.as_ref(),
> +            "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
> +            mbox0,
> +            mbox1
> +        );

You should add something like this:

        if mbox0 !=3D 0 {
            dev_err!(pdev.as_ref(), "Booter-load failed with error {:#x}\n"=
, mbox0);
            return Err(ENODEV);
        }

Booter returns an error code in MBOX0, and it's very handy to display that =
code if it's non-zero. =20


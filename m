Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C46B29955
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 08:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5173210E3C2;
	Mon, 18 Aug 2025 06:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FNVesESN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB2810E1B7;
 Mon, 18 Aug 2025 06:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755497196; x=1787033196;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z/w22DEfCiEqW7pv1Hb0JsoqcWyDuaPzOfHfgrCJhEk=;
 b=FNVesESNCkfOf1oYEMNewnyVCt/E18BsZrGILd6r0+5Gq+oHXW0kfEuy
 0VhR9nTXD/y4xAySfxz0sqw8ZWxYmydc210vIx5OE3ntse7AosD5cqTBg
 toH897h2cIVjwoCG6ynjFVstSJi7k395lcYKQKKpSI+QfYWY74IY3J/x4
 OqDV5+B0LNhqAxPs5ktQoHoUcTgG2hH9LRVGLoOQzYn3g2+4oKQBaFs73
 hW1sRuhm0Ojg8/bSbIX/pInp9yPFnqS11ooOzjxU96I04GbucmMktitoD
 PG7BiynCscdlEe+1NL4myYN7tXcru4FeOLoklTx/V8AW3mWS+4JGRna75 g==;
X-CSE-ConnectionGUID: Stm370KGT+uRhFikY1VVww==
X-CSE-MsgGUID: jywiHENKThCRNaSzlLhYmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="68425867"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="68425867"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 23:06:36 -0700
X-CSE-ConnectionGUID: FpxtMrfLSEmbPt+22JkS8g==
X-CSE-MsgGUID: WXoTlwYvRlaRBZ7YGiKbOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166990201"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 23:06:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 23:06:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 17 Aug 2025 23:06:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 23:06:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uC0/TOm8uCE0vnR9YJYGSlw9UG4vhpXp7MAw6tcEnYaN1NWPWtZT5Z6+Fq3TVIHqrHKv1zCKpmGY8TUEV6eRc5oCqEy7LfQgpcfnX0bgevPQNz8r6kgURbDgXQT9L7riY/j2KinvKewxZ6fu6x8gXojm3IMGcQXOKad6XPPl/MTOpgzfuV8jL2W/Yg/hCrPGnzVT8cgt3jgpC8A6VME91oCxWE77LWBN9Y3OA64ky9itv1mbwK0gQryCzWrahqzqp7yjn/oCpSYmgoqLYVn33SOXPe8Pn1UbPD/VyDL7bKCqdmmwofBGEHBJeJVEpgvKG3XzRyW8xBZWgLQDPFQP+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnbCkSuAB36yqHaTum9S5IWR+8jejDzHSodG5/i79Hw=;
 b=b3xXqoNaMShex3jGqncXHIR3GGU2al30bCBq/tOpCcBrR78tlkTcVZx8PdfbcpUyNkpLSzN8ceJobO7tLrQEg8qGt2IC8EhkcP01y0ILQnHNZ7dKITYCvyPOw9wd+nM2z4K3LVtCZqLCMCgvGpi45N5OkVBVMQUJJ2k4WVn4sCBtpail00aUBRw/tmb81tdlhg1Fz0HJ19QWAS4WgK92KDLm1mkHxVkFc/VFkmgBy5EDr2himBF5Y/VetU+3OJ5XFwXvVWiMImQK9uMP0WjxzFLbAbdyQf2UGgnrMYLK8mZ/mj9aWtVsus5KGK+yd3u2BHfJOT1tHzR1iDmLVbGkdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW6PR11MB8391.namprd11.prod.outlook.com (2603:10b6:303:243::14)
 by MW4PR11MB6811.namprd11.prod.outlook.com (2603:10b6:303:208::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Mon, 18 Aug
 2025 06:06:32 +0000
Received: from MW6PR11MB8391.namprd11.prod.outlook.com
 ([fe80::229a:3e89:506f:a662]) by MW6PR11MB8391.namprd11.prod.outlook.com
 ([fe80::229a:3e89:506f:a662%3]) with mapi id 15.20.9031.021; Mon, 18 Aug 2025
 06:06:32 +0000
From: "G M, Adarsh" <adarsh.g.m@intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Garg, Nemesa" <nemesa.garg@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 01/10] drm/drm_crtc: Introduce sharpness strength property
Thread-Topic: [PATCH 01/10] drm/drm_crtc: Introduce sharpness strength property
Thread-Index: AQHcB357TjVZThAFWkStUzz+19glnLRn/QRA
Date: Mon, 18 Aug 2025 06:06:32 +0000
Message-ID: <MW6PR11MB8391EABD7C6AB5BD99453422C831A@MW6PR11MB8391.namprd11.prod.outlook.com>
References: <20250807092841.3169436-1-nemesa.garg@intel.com>
 <20250807092841.3169436-2-nemesa.garg@intel.com>
In-Reply-To: <20250807092841.3169436-2-nemesa.garg@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW6PR11MB8391:EE_|MW4PR11MB6811:EE_
x-ms-office365-filtering-correlation-id: c33f2c0d-720f-4805-b87f-08ddde1d6157
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?V2poBV5AUh2aD66jCNNyVnwjUCt7ywdLe647tpibaB6n6GDOWfVCNwVo34g4?=
 =?us-ascii?Q?0ST1XPaPShnUYJHTyoqe7b+hXXEFghKpEmi+JRHy6GNqTPTOp+j446mBVSTj?=
 =?us-ascii?Q?7vtMww7ulhJ0T2Qlk3X9DFAIPSiqj7ieU+lIhks8d4pxKFFVB2qujsjxWxo6?=
 =?us-ascii?Q?a1qdTRQmS+6E7EY5IP0KthHuOYGJL8IVbbrBf8EpgBU+ek4cGwOzhuShHCWe?=
 =?us-ascii?Q?7K6rgOwTJ/lkXU9G2CkoOhpypbfAB+p39x+b+W96KXAixLcsTkB7aJQxt+/e?=
 =?us-ascii?Q?LKClRgsdNT0kwuFxQFq5+0EVIdihR4nhMA9yTO4v9XT//rSkttDqMlXYUGRc?=
 =?us-ascii?Q?RfSLhYosCA+S1YkBesaEIfg5BXT4cG3P7np2kv/vzOOFtVJaBIESsuJrNl4c?=
 =?us-ascii?Q?1ASzUl90fP+FjMFFkQeortpCTKoht3Ofmy5fdJPGWBmrVPwZAnpkWq5lgkvC?=
 =?us-ascii?Q?vkXk9odK7vWopZOE68GRM+bU0lUF1yZHHrcnZ2qd+JuUAAmee/FQbIg4BiDt?=
 =?us-ascii?Q?rzgrbFu2hO/gvPXaR5CI1pMomkwzn0Jr62JSaysYb4LgyIVg+ClCn/RRNAHM?=
 =?us-ascii?Q?eInP5gHTWfoH2ohBBZKqDSHshpA8Izmom/eP568J0cV5Xcd1wCN9qeyzmnkC?=
 =?us-ascii?Q?dPx5KOt9cnQyZUkVlhJCrroOaiID9onWYcXPJ9vT1Pgec9NVy29SIhCUtca2?=
 =?us-ascii?Q?gM9ICCQMqPrRsyqLTUOCKQSk40GSYz+6r/PZfB4I8AfaMaz3AaQDKTKPOfCI?=
 =?us-ascii?Q?fPb0Y2/3Xglq3KgliKr/0eHYimfwo74cLCAa86IYzDXHHBNvDurC5ixRl0bl?=
 =?us-ascii?Q?z0JKg3uP/B/+TWzqVnM9nYa2zvxhq4LC6d++NOt1tul97oSk1FZ9xl0+HWcD?=
 =?us-ascii?Q?oRdTq38csA1RK8t17VPyxICstIwBPaw26NvOYK1dhv687uMDTQPDoXsqCdzg?=
 =?us-ascii?Q?ijyh1ELfW2kQ5tdvHdaFKwosYCDVOcQaidH2GdTOytaXNW//qQaffDMcxqnP?=
 =?us-ascii?Q?yQKtg2rANH2GlRh+I7kIbIN0dKu8kUexMN5+vs/7BBMRqrGKQoPaFK4sRuR/?=
 =?us-ascii?Q?hajn28zt6LzdorDXZ2PIjoHa9lwdz/hE6Ft9uNTWXnE+1C/RbymUWwdXYtW8?=
 =?us-ascii?Q?37ewuRnaSvch8edsLgtisl3uywE625acOcFBIdya26w56lymePhfeVgM8iW2?=
 =?us-ascii?Q?8lTE/8hWQdSu1Ylxs1nEHz3CuXfh8SWt7rKMdlASjZD+vDr102UEffmunaF9?=
 =?us-ascii?Q?v8rcVP+0HnSuue4K3L8m4rYxc21HNudPLTgb/XPH2iBR2pAF0Tas8ZEVkdnI?=
 =?us-ascii?Q?AkWFanyl+Ua4MNlOwbyKMLKKpTPrRQBdKr53Dh3MiXesqsTjWtyhuz4gbehK?=
 =?us-ascii?Q?AeyzZpEcPZ1snLMTYWmDalv5GOpRK4ZLRkV4q6ly1/KrmG4egyJKStmc+uQS?=
 =?us-ascii?Q?OFZSkzIdYwJp2Xw+IaGeZKUmudpYWxvbXcRJd4cPOVOKKhmHZ6hjb5vWAIz2?=
 =?us-ascii?Q?FnZQ8L8b8aE14ss=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR11MB8391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(376014)(1800799024)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?X3+Y0fCivtsF+GzyFamG4iXcZxLXXqZ/c+NPtLOVQFPBvjR2Ma5Vv83MmbSC?=
 =?us-ascii?Q?LPQIb9kJLbO+dH0Fpri2H4BH0AE6kOFvYcHVXDkMjnhiDL1ED30+crW5G5bM?=
 =?us-ascii?Q?n3J3bhuw5rI988D+i5P0sqJ9ZZvF4iVqTg/MqZUkbaqqNjPeuhxBA47L7X+Z?=
 =?us-ascii?Q?uoBTVYF0tliyeqWtJT521S/QeX7UeNdsziAoaVPBBDDXbdfwXBS5K+eey7CM?=
 =?us-ascii?Q?Sk6etDu/UDxAyIqRddGG/mIjVgGFyOstebUXNw+qvXqat9hCenPJ4Ljjkzgo?=
 =?us-ascii?Q?QHXgs2uZjzaE1ZsY3r4F0+UArIEg5A/bDkP0aLMUQatZpcrNZ5YkGinRpxv8?=
 =?us-ascii?Q?g63rIl+7PG9HYEV1gCAa2hjJ89I/QVIqNJE2KCF0rLjLxWuB1O8hjN5flEKS?=
 =?us-ascii?Q?MBCcXN6cwBt/q/e97n9sHjeGATATf+8JpwpJ6Zvyj8WGFhNuTBQe0mP+ehbS?=
 =?us-ascii?Q?zOTo4lNsBdY4qAdwBtjB3a1XAruteW+W3kC7WO2eXufrqOAvdmzY2UgfNYCm?=
 =?us-ascii?Q?n5tCYKbVV/A2ihv2GdMmZW9KpspM3dTCWuccC8wVeAi3mDCsGcaMGgLG2NJF?=
 =?us-ascii?Q?GkpummmtlM7s1EKF+lw/ErBfQftiTNdv/TnU1t50cCKE4DarZk/wip6i0jIT?=
 =?us-ascii?Q?mR1Hp/3seo2TVYSAJbzHITtBFuQIwclehMWcXvvqffN5ChjvhzS8vYObCIwX?=
 =?us-ascii?Q?iK+J0f9rDIXigTDVB44Fp1+dWVA6qv3CezghxB9YAQe887XmH4jHPEy/24fH?=
 =?us-ascii?Q?NIeXaxb1e2dUgB8oEMH0GIpQtw6+X1htOP/aEXNAVCDMI5vPb/jA/v8FUxac?=
 =?us-ascii?Q?AQnJODuPitP9ckqvebe9pDvO2Be5YpVKufUN0D3GqKmWjGI3OCDPiR05L1ov?=
 =?us-ascii?Q?MryA5pY0Jv26JG9TQro7E/FbGE9Btfl8WnsMrk5AzrG3jG0n+tbL6zSjPReY?=
 =?us-ascii?Q?mG/ukAoi9+weKDjd8U1zxZBsG0RAzr++G1wWUUY1qPXc+P8Hf6yMkvD4v7Ju?=
 =?us-ascii?Q?4dfesIfDQ9//f20C+lLlZQ61Xd+rdgjej0hA+vz2Es8I1U4XJ8GrVuystzlg?=
 =?us-ascii?Q?ceYPr48cliTZHk+Kvny+lUqvpkf0IQko8L9G6PYrG2B+RUDJcKv2LpNyi4me?=
 =?us-ascii?Q?mPuTqpTvMOI8Mi2JTqeSoeys/HtttrIHF2FiH4cQczY+ZGlm8zVkGAV/ZPQO?=
 =?us-ascii?Q?MiC9NM7oRrL3NZOcidP0lFZxD7Lei/31qUXn+auuut9xUywcfgqigJHANkqU?=
 =?us-ascii?Q?W9e13WQ3WH/PCIOr54MaQlpdIfwK975wMpMfs1hxJLB7rtc8XBEI618EXeJm?=
 =?us-ascii?Q?6f6knJllWpOZFqNrcKEGNkh6nQSn3I7Mqu3PTu/oRdLCRbQKIJGUs69EE4Pn?=
 =?us-ascii?Q?wDqsT9iTo06YbVS11T+tZhho1Xb038FfAXGvKEzq6jHBvhXLVEFyMhRnczBV?=
 =?us-ascii?Q?1QcsejFUxGTOvZ9JDzxywOJIP+DweDjvrbXd7JRhXCFOmcG1yg+FRHws/vNm?=
 =?us-ascii?Q?gKPZaKMjf9b8lpju4sEvZnrbvDZNug6P1RUyvsV3/GLmV7MS0qJddGh/e/OJ?=
 =?us-ascii?Q?pPpjw7mxf+oksSQTkaU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW6PR11MB8391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c33f2c0d-720f-4805-b87f-08ddde1d6157
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2025 06:06:32.4919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lOF8TB9l92U/TtR1yeyQtbpzo50tGR4lBeVK5PhEkFIZPsoQA+QLSxrhz3w7Ys95xhWzD7PNw1oqS4zVzsa6wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6811
X-OriginatorOrg: intel.com
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

Hi,

I have tested this patch series (rev 16) with https://invent.kde.org/plasma=
/kwin/-/merge_requests/7689, uApi works well. The sharpness is applied and =
the changes are seen immediately and relative to the change in user input (=
Strength).

Tested-by: Adarsh G M <Adarsh.g.m@intel.com>

Warm regards,
Adarsh G M

-----Original Message-----
From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Neme=
sa Garg
Sent: Thursday, August 7, 2025 2:59 PM
To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; dri-de=
vel@lists.freedesktop.org
Cc: Garg, Nemesa <nemesa.garg@intel.com>; Nautiyal, Ankit K <ankit.k.nautiy=
al@intel.com>
Subject: [PATCH 01/10] drm/drm_crtc: Introduce sharpness strength property

Introduce a new crtc property "SHARPNESS_STRENGTH" that allows the user to =
set the intensity so as to get the sharpness effect.
The value of this property can be set from 0-255.
It is useful in scenario when the output is blurry and user want to sharpen=
 the pixels. User can increase/decrease the sharpness level depending on th=
e content displayed.

v2: Rename crtc property variable [Arun]
    Add modeset detail in uapi doc[Uma]
v3: Fix build issue
v4: Modify the subject line[Ankit]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
 drivers/gpu/drm/drm_crtc.c        | 35 +++++++++++++++++++++++++++++++
 include/drm/drm_crtc.h            | 18 ++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic=
_uapi.c
index ecc73d52bfae..2302c2bea28a 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -419,6 +419,8 @@ static int drm_atomic_crtc_set_property(struct drm_crtc=
 *crtc,
 		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
 	} else if (property =3D=3D crtc->scaling_filter_property) {
 		state->scaling_filter =3D val;
+	} else if (property =3D=3D crtc->sharpness_strength_property) {
+		state->sharpness_strength =3D val;
 	} else if (crtc->funcs->atomic_set_property) {
 		return crtc->funcs->atomic_set_property(crtc, state, property, val);
 	} else {
@@ -456,6 +458,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val =3D 0;
 	else if (property =3D=3D crtc->scaling_filter_property)
 		*val =3D state->scaling_filter;
+	else if (property =3D=3D crtc->sharpness_strength_property)
+		*val =3D state->sharpness_strength;
 	else if (crtc->funcs->atomic_get_property)
 		return crtc->funcs->atomic_get_property(crtc, state, property, val);
 	else {
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c index =
46655339003d..a7797d260f1e 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -229,6 +229,25 @@ struct dma_fence *drm_crtc_create_fence(struct drm_crt=
c *crtc)
  * 		Driver's default scaling filter
  * 	Nearest Neighbor:
  * 		Nearest Neighbor scaling filter
+ * SHARPNESS_STRENGTH:
+ *	Atomic property for setting the sharpness strength/intensity by userspa=
ce.
+ *
+ *	The value of this property is set as an integer value ranging
+ *	from 0 - 255 where:
+ *
+ *	0: Sharpness feature is disabled(default value).
+ *
+ *	1: Minimum sharpness.
+ *
+ *	255: Maximum sharpness.
+ *
+ *	User can gradually increase or decrease the sharpness level and can
+ *	set the optimum value depending on content.
+ *	This value will be passed to kernel through the UAPI.
+ *	The setting of this property does not require modeset.
+ *	The sharpness effect takes place post blending on the final composed ou=
tput.
+ *	If the feature is disabled, the content remains same without any sharpe=
ning effect
+ *	and when this feature is applied, it enhances the clarity of the conten=
t.
  */
=20
 __printf(6, 0)
@@ -940,6 +959,22 @@ int drm_crtc_create_scaling_filter_property(struct drm=
_crtc *crtc,  }  EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
=20
+int drm_crtc_create_sharpness_strength_property(struct drm_crtc *crtc)=20
+{
+	struct drm_device *dev =3D crtc->dev;
+	struct drm_property *prop =3D
+		drm_property_create_range(dev, 0, "SHARPNESS_STRENGTH", 0, 255);
+
+	if (!prop)
+		return -ENOMEM;
+
+	crtc->sharpness_strength_property =3D prop;
+	drm_object_attach_property(&crtc->base, prop, 0);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_create_sharpness_strength_property);
+
 /**
  * drm_crtc_in_clone_mode - check if the given CRTC state is in clone mode
  *
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h index caa56e03=
9da2..bcdbde681986 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -317,6 +317,17 @@ struct drm_crtc_state {
 	 */
 	enum drm_scaling_filter scaling_filter;
=20
+	/**
+	 * @sharpness_strength:
+	 *
+	 * Used by the user to set the sharpness intensity.
+	 * The value ranges from 0-255.
+	 * Default value is 0 which disable the sharpness feature.
+	 * Any value greater than 0 enables sharpening with the
+	 * specified strength.
+	 */
+	u8 sharpness_strength;
+
 	/**
 	 * @event:
 	 *
@@ -1088,6 +1099,12 @@ struct drm_crtc {
 	 */
 	struct drm_property *scaling_filter_property;
=20
+	/**
+	 * @sharpness_strength_property: property to apply
+	 * the intensity of the sharpness requested.
+	 */
+	struct drm_property *sharpness_strength_property;
+
 	/**
 	 * @state:
 	 *
@@ -1324,4 +1341,5 @@ static inline struct drm_crtc *drm_crtc_find(struct d=
rm_device *dev,  int drm_crtc_create_scaling_filter_property(struct drm_crt=
c *crtc,
 					    unsigned int supported_filters);  bool drm_crtc_in_clone_mode(str=
uct drm_crtc_state *crtc_state);
+int drm_crtc_create_sharpness_strength_property(struct drm_crtc *crtc);
 #endif /* __DRM_CRTC_H__ */
--
2.25.1


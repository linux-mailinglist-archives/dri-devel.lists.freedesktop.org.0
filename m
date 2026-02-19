Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oISsKQKSl2mR0gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 23:43:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A17316359E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 23:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB2610E760;
	Thu, 19 Feb 2026 22:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SfwUhLRq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442B910E337;
 Thu, 19 Feb 2026 22:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771540988; x=1803076988;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=KLSYCJTIM6Jssz/PX45dlW2QDcm0WsUIMFDeY1Mxw0E=;
 b=SfwUhLRq2zdbWKHeAJadD6s6qoiJ28G1i5mRZEKnVNN/delwBH9ZoEYD
 C7Zs/WAs2P5DNF+IhHJmPmvhntV3AQkDxwSHeR3V5pFZH+RETSr3UB72S
 aIUHGbHYowxWX1vxDNysFPn2KXWQS9QublpVMGX+pVJ6YAMyPSCI6SbTC
 +8cv2mmc3+MniMtbgh4hA9tsKFABLlORG2d4MzMNY9cFOFCoskicJSOrM
 SgfUucqFrTwI28i1iOe9M2U3if7Y7WOcjN+2l6As87PK1z6cVcjyrLY6q
 n/ct2g7R/qMjy1keFmeSDCEVvHWEA/B8DB8tOqFXSl8HxIliz0lL+9TWW g==;
X-CSE-ConnectionGUID: 2BGP9LwXQl6+4Z1sQDY/Cg==
X-CSE-MsgGUID: 4B85yYB5QYaLYTGTm7iWhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="60215230"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="60215230"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 14:43:07 -0800
X-CSE-ConnectionGUID: s2Y06X9jS0W5Sj/tq4XRfQ==
X-CSE-MsgGUID: F7RxqNLJS0m4/cL6+0QL5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="213269291"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 14:43:07 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 14:43:07 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 14:43:07 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 14:43:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHEoGtvSGZgM5MqReLO5+zijb3iAvNfVjJhTPdLZ6gBc7DI+CMEmnItK5nW9u22C0DmRIAsp5rbK4LzHcmb6Yf0PcPb3kRgQ5cdgTHfrsgsFJVYf730uzM3BMA01Ze9Hxqh7GjGQ7vYkNIZrFMZ3NyBOdLY3J5Aimfg2MQKTxlAe7BjVpdPuq2naZGIewukJfCLV/iyDC+nrGbW9JATqVjjU+qe8i6KpVJu4qSxn4uk0kfhvhuVqEYI2YAO3SvVet7e2g0QcEYZmYP2vavHP41owbzMKg1b7VPnrNmVKIUWHWPzMj7AKulRinpnJKuEEOJ2z4iCRiTN7Pxw26rXQ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+taqbMj8AsER8It6/JzzcFkhYpA5KUebd/NxiQx1D8=;
 b=C0hkWVi4JSEN5VEky00Ns4wlXU4rmwY3KSf+9WiEnzZgjGQB57Ln555uYSZaFSCKblYd+VzfkOwqWjR9xPcS3RJg4v8GkTDnFMI8sfvNM7epm88nfqfYjyefSj0kTNQ7Syiy27ekgxuLFRh7G1MtBi6acKTkfiItN4FqJR8zlSc/KQ2OhPl+mfcUMFFIddPOa3pEIjITxP0/9zjUr3YUPx1hPcVpF8V8jo0qqgDI6Xcga7NOimeKCEECg9Z1IkyRndv+HtQdILLV79YPBtHKYSYHuuLNorkBCG7StA9GusQvw1RGkMcDZuUNO7DcchdeClLDKjt22Cp4xf7uZtGxnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV2PR11MB6022.namprd11.prod.outlook.com (2603:10b6:408:17c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 22:42:53 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 22:42:53 +0000
Date: Thu, 19 Feb 2026 17:42:48 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next-fixes
Message-ID: <aZeR6CXDRbeudIVR@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::34) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV2PR11MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: fb50053a-92d6-44c4-4627-08de70083809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4r9dhl3d5gvsKvfbg2zaHylq3YMJ78/Y0iSP67dkcPlXLfGHITs0ynKXNM?=
 =?iso-8859-1?Q?KzNCGwjgn8w9N6daldpjCLZFBLB/HxTKUN219fRFSo5VpO8KFdReJhbM/3?=
 =?iso-8859-1?Q?uQcSuAxlm/8sCeaVHm8qCjjOqP+dKgH+MvsNuIi/fedN+8OReUWZ2tQjoa?=
 =?iso-8859-1?Q?7Vt+/RzXxgiUxG0l4NIK37b8fGsScqg5rPZLMfSxQHpbOyo9hNMH0Y0o5Y?=
 =?iso-8859-1?Q?lBGihKO3I3N55kLypwnJKxc277+34jZ0aLHQxC9KEH+iAhKrdRo5XdP8/z?=
 =?iso-8859-1?Q?WKmCkHK0EH2f5RxqfASl01wrQiueVx6NmpPYZbao40y4V56bRyzQ3nxTZ6?=
 =?iso-8859-1?Q?X+pS5wVy9MyIfXcDPDYGyx6MfEIieNWSXkBw8mcY2y51LcW+1B4xlZV/OH?=
 =?iso-8859-1?Q?IO6XnWLUKq+ML6jdukxM6RMq6OTd0COZO9jB8e2efUZ/f/OdNBAeu8grxL?=
 =?iso-8859-1?Q?S1hTgWUCyQW35n4CcR3yoyusQigbb80MEhSZlluEAsHoU0SAfoexGToORy?=
 =?iso-8859-1?Q?6mKkJJb8B6M91oC6ouqbQUxUArVE3aLnvanae0Pada746wKb21P0BO2JKE?=
 =?iso-8859-1?Q?p/n4RGQafAjsB14hG0qaskTRuCPKeJWH6OLV5wso5Fd3002PdAJyuSpCyV?=
 =?iso-8859-1?Q?429Fm3zwH/ZxTIDGDPePC/rE6Tv+SEmX9hyxo1ptLCxlIewEKXJ8JyrsYq?=
 =?iso-8859-1?Q?m4RiSaxr4iP5v+s+6aV/J0pi+iTcG/S3BJwiw/NUeJoZZ01DEJCqpoXD+E?=
 =?iso-8859-1?Q?2nmVO/8ZvEApcZ6NO8RGQuXvT8Esi24JECErU7axsYMr3Ovgo8h9omGI6/?=
 =?iso-8859-1?Q?MPsgMv8DVAjOlEHUstMj2ZTD35gB5YmuFBKMkOzUHqsoh1djDHCq5N4w6l?=
 =?iso-8859-1?Q?mZA+FhFSoXbLRKHZAbPqHvynuRPHUKN19RCtTWwMseKHd585noH9HiYwqC?=
 =?iso-8859-1?Q?+t39Mov7YueEvQ87+vFnVUuaqdq4A+Jeg69ogWewlfW/f1kY0Ek7XtLSx+?=
 =?iso-8859-1?Q?MBXckhBTZfc2pw3Hwz0h828LvUBCPLzd6iCI2S7Ewz8dr8204MX5B4ugoY?=
 =?iso-8859-1?Q?LGwFOES8CmQe/942Sl1kaGC7v0bWJJ8pYAajXM1nk22EV13xmfAiIcOA/e?=
 =?iso-8859-1?Q?AqcDBYjM9/D7G54Rz+j08hSdqolUBMkZY+njgjLp7GmXxT/SChXpGRHDtP?=
 =?iso-8859-1?Q?8AMLZs0VmrzbF66xBZ0cFYSuKHPEIfm4v3eiuGhlqXBMe4s9TzZ12hi/Pf?=
 =?iso-8859-1?Q?sYlzVH7fDTsg+FYMHqVS3q42pMy2SoTpvx2ITyPP+HWjDG4ItfDsDiliNP?=
 =?iso-8859-1?Q?fpjGDGdOokUi6gMpDaSARQX6bqesnKmGinpdrYfBxjkghUaOH5rU7STvg9?=
 =?iso-8859-1?Q?Yo6YlTX+3V5VoCqL07Ub3H2KTbSG9qU4iEr0FD622kPe2/53Bguz8oRr2x?=
 =?iso-8859-1?Q?3UPqgvE+OfUlnfm1BDT1IVmaMMX3dmh8wPZ/VcY8ZtmatWXUnZL8JiZjIu?=
 =?iso-8859-1?Q?nVbKFKY/t2k8r4MEU/YarElEKVNMBr4qLiKz+okjv7ydb2ZxcT9KSWE2p0?=
 =?iso-8859-1?Q?Imw9SnY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nr7889uTXp+m+KNpgwO0ZFuM1tRoA5gtJ/A5FUU+EWhgohYah+D75VZEyK?=
 =?iso-8859-1?Q?vb0Ih2BgSDlJKnaUztub2pk7V3N5QoHJlRWvqQCdb1LjlWvDLxAmcpYjQR?=
 =?iso-8859-1?Q?O+ZWMCNeP/hm3gNDLEvbj8dHyN1ON7hA/pEh9sE2BrQU9BJzYF5R5HYiVO?=
 =?iso-8859-1?Q?g/6n77m41oQ5ns0CiS8C1kx5y1Sfn7PYnp1wlk6zpMiVrXigmaUi+JaVLE?=
 =?iso-8859-1?Q?WHY5x1g1zmmjet/EkaSq2nBF5T3CfYHc4ls76be7J/YRWTApUe6P7dQ2Sb?=
 =?iso-8859-1?Q?YhpwTFEkrDKIbH4V1/9X/RqcKsco1j0VLf81iJ7ilj2mJ7iA9GxJWwXl0a?=
 =?iso-8859-1?Q?M8dF0/foDN4yLsae7KDABMr2zRaAHGik+FGI8cX3o9BZ1FujbTUDijnqof?=
 =?iso-8859-1?Q?Ip9Sk20UiI8mhD6dQkadYOI5xUkM/fZ4aAEBNN0BdQlwLhD/JzyT8crT5P?=
 =?iso-8859-1?Q?8BxxtcEgLdntZm5Gp+aSLRnVlqec4FY8UFb2lqPpqknooYMghWBERajdKb?=
 =?iso-8859-1?Q?0pfddk7n3i8e0fBp+RfvrBKCr0/DyOvci+YtFjwbNnUTEaCQNTYQqvS6ov?=
 =?iso-8859-1?Q?wbuHloBf76rjKQWdD1rIUK+PtsaJEvXTiSZEJ+qGbuuhBXlH7m0mXJbdL1?=
 =?iso-8859-1?Q?qb05YjcipsQEFz8e1PZhQz68Sb3yQmzS5p7FgCFOGe2UUfWK3I4XoPD4yT?=
 =?iso-8859-1?Q?0+1z/dIKHd+acCNleDo0rpyOVh27ml38pw7hJNhyN1eyzIoLn1EFvHQJ4o?=
 =?iso-8859-1?Q?JGH4BI9Z/NkwG4QUgbd3/1dPnBLUI7T2M7ayZ5UYYDZYKvELb9ho3gS2jR?=
 =?iso-8859-1?Q?hNPHpKJVLMoZTP6Naf19BKFAT7G3V30q4P/rZqa4LtX5xp78z8mygXgMWW?=
 =?iso-8859-1?Q?oaL99aPHDWT0/p05cz6VICbLOroehIWBYcLB5w/gb27LvgJK4Nsct3ef5+?=
 =?iso-8859-1?Q?CrP6SP8BP/mOgjgbmtrDWkYeMKSSjjltiG/mYxbIQUz2iOKVsFaOsxJW/5?=
 =?iso-8859-1?Q?WeRpAG+UmaflOjRao8F28reyn65S6VpLyWSOhLpVetWUCoshDvPv1BnE5D?=
 =?iso-8859-1?Q?A4yeYKlDbrY4YNTgcsZHYOfnGbi+/RtNVrckmRSq1PRqs5jHQ23FV0XmeA?=
 =?iso-8859-1?Q?lvQyWfhU8XWtaW9V81GFN/kzw21FMQ94w8FfAg0E/Egc5BAFdqJXAShtEY?=
 =?iso-8859-1?Q?xYQg4ixe/FHApsA9X+9fdPx7cq9nlqoy9K2A4wTqtRtXBPlZShaLKFhohx?=
 =?iso-8859-1?Q?JEgzSfx60QQqsPQT6deFjb0oVWKJZCBWIA3DEky9BlnbE5gcderl0ujlGI?=
 =?iso-8859-1?Q?w6fVyZ7ODFvgdkEyAaI83VnehjdOEhgBMCfp/FuctWKvy8rDNGhO0TozC7?=
 =?iso-8859-1?Q?rQzif54B5VgX0GVle8CfmUczByRLy56Jf0DSS7TbJPuUxesESxTMmKBxxu?=
 =?iso-8859-1?Q?6x+I7cegfYo0jXs+LN5Q3fqaL+QnUWV/anoLKI1Z5U3EDhOojbC+KlLstY?=
 =?iso-8859-1?Q?CaEFYCSVGcEFYSrzIkGPGzzk+VWWVcpSyCQVXBY8Rj7DfmXKM2WxBsPMyo?=
 =?iso-8859-1?Q?QZtBmU7mixt4xXY4Gza4E40XOqSuJr1BLKaOaOPQFRyEB4KrN/RiYyiQGD?=
 =?iso-8859-1?Q?3JV7HddZSPJg6KD+TZaQHdvj+z+fMqSeuZ+cPg/mR8y12Rnl5YAaI2TmqU?=
 =?iso-8859-1?Q?tniSXtDbsuyzDmtyhjqpxBEyvw03WhjErjfKAy88rHAnW/+5rap2DsFPuy?=
 =?iso-8859-1?Q?esOA94uyV9z7JnVXzn2XGKyd0ZUIOAIRBoLtDu7BTAc8yKFSaWxThp4/zY?=
 =?iso-8859-1?Q?44fu1OMSUg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb50053a-92d6-44c4-4627-08de70083809
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 22:42:53.7690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQ8jhsbHtNEY4Z9xVXf/CTSk2mAvnBptQANwOh7CUfKuCogk6tfcDWpQ8htny9R+wHyS1TBo3jtLoMZWln+0rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6022
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[16];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rodrigo.vivi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 5A17316359E
X-Rspamd-Action: no action

Hi Dave and Sima,

I know we are around the corner with the 7.0-rc1,
but if we still have some time I'd like to include these
patches so we minimize the -rc2 fixes.

The special thing to highlight here is the drm/pagemap fix
for the drm_gpusvm and the removal of a sysfs. The rest
are regular fixes.

Thanks,
Rodrigo.

drm-xe-next-fixes-2026-02-19:
UAPI Changes:
 - drm/xe: Prevent VFs from exposing the CCS mode sysfs file (Nareshkumar)

Cross-subsystem Changes:
 - drm/pagemap: pass pagemap_addr by reference (Arnd)

Driver Changes:
 - SRIOV related fixes (Michal, Piotr)
 - PAT cache fix (Jia)
 - MMIO read fix (Shuicheng)
 - W/a fixes (Roper)
 - Adjust type of xe_modparam.force_vram_bar_size (Shuicheng)
 - Wedge mode fix (Raag)
 - HWMon fix (Karthik)
The following changes since commit 2f5db9b4002470ea19380326c5a390647c56e780:

  Merge tag 'drm-xe-next-fixes-2026-02-05' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2026-02-06 13:02:44 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2026-02-19

for you to fetch changes up to 2d01d88a532b8847757d3015c66beca315f496bf:

  drm/xe: Prevent VFs from exposing the CCS mode sysfs file (2026-02-17 19:42:00 -0500)

----------------------------------------------------------------
UAPI Changes:
 - drm/xe: Prevent VFs from exposing the CCS mode sysfs file (Nareshkumar)

Cross-subsystem Changes:
 - drm/pagemap: pass pagemap_addr by reference (Arnd)

Driver Changes:
 - SRIOV related fixes (Michal, Piotr)
 - PAT cache fix (Jia)
 - MMIO read fix (Shuicheng)
 - W/a fixes (Roper)
 - Adjust type of xe_modparam.force_vram_bar_size (Shuicheng)
 - Wedge mode fix (Raag)
 - HWMon fix (Karthik)

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/pagemap: pass pagemap_addr by reference

Jia Yao (1):
      drm/xe: Add bounds check on pat_index to prevent OOB kernel read in madvise

Karthik Poosa (1):
      drm/xe/hwmon: Prevent unintended VRAM channel creation

Matt Roper (1):
      drm/xe/xe2_hpg: Fix handling of Wa_14019988906 & Wa_14019877138

Michal Wajdeczko (2):
      drm/xe/pf: Fix sysfs initialization
      drm/xe/configfs: Fix 'parameter name omitted' errors

Nareshkumar Gollakoti (1):
      drm/xe: Prevent VFs from exposing the CCS mode sysfs file

Piotr Piórkowski (1):
      drm/xe/vf: Avoid reading media version when media GT is disabled

Raag Jadav (1):
      drm/xe/bo: Redirect faults to dummy page for wedged device

Shuicheng Lin (2):
      drm/xe/mmio: Avoid double-adjust in 64-bit reads
      drm/xe: Make xe_modparam.force_vram_bar_size signed

 drivers/gpu/drm/drm_gpusvm.c           |  2 +-
 drivers/gpu/drm/drm_pagemap.c          |  2 +-
 drivers/gpu/drm/xe/xe_bo.c             |  2 +-
 drivers/gpu/drm/xe/xe_configfs.h       | 12 +++++---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c    |  2 +-
 drivers/gpu/drm/xe/xe_hwmon.c          |  6 ++--
 drivers/gpu/drm/xe/xe_mmio.c           | 10 +++----
 drivers/gpu/drm/xe/xe_module.h         |  2 +-
 drivers/gpu/drm/xe/xe_pci.c            |  6 ++++
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 54 ++++++++++++++++------------------
 drivers/gpu/drm/xe/xe_svm.c            |  8 ++---
 drivers/gpu/drm/xe/xe_vm_madvise.c     |  7 ++++-
 drivers/gpu/drm/xe/xe_wa.c             | 18 +++++-------
 include/drm/drm_pagemap.h              |  2 +-
 14 files changed, 72 insertions(+), 61 deletions(-)

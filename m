Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F3C907D87
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 22:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05A510EB99;
	Thu, 13 Jun 2024 20:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VU6g3PDK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A53510E15A;
 Thu, 13 Jun 2024 20:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718311151; x=1749847151;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d8jYBAmw8HmwFCfPouxPO6nnruKHlVcXg2zW7MM8OWk=;
 b=VU6g3PDKwx18PHg1YXBqxgzH0kEHXosq+3r4qyWtLH5UPxaC2kB948hB
 rvsSH/RpnvYByRh3Yr/8E1JSd4NBdxl1XEGkaEM3WsLxBBV2OuY6+fTkY
 YBnaKfGqWRDFoeZnc2Hzfn9y11LsUGgU7bf23h4T6Fr/sEgBElkJoKeEQ
 z/yHwk02IHNo5Dx6MlEQUW3N+3GAEuazvJYIx34ZlIAJM9IyoV/BvGFBG
 Vlwv/L3EelSBt+8SsHXuUzE2ZKYbbuJTdaudTG2llgAg6piOK2Ltq7kpA
 9nFnhi66haQmsY6/hvCDo1BcwJgM7YXMAE75TEru/2OjA8OROfrANtWNX A==;
X-CSE-ConnectionGUID: vkyAFFLBQJ6AOtU3N0EJSg==
X-CSE-MsgGUID: uN3UEB6+RnGif0KmKtzzZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="12061593"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="12061593"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 13:39:10 -0700
X-CSE-ConnectionGUID: 2aY8sTuBQ7Sf2iU5Ne44qQ==
X-CSE-MsgGUID: QwTatAEDSbWuuvqG73FpcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="71063150"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 13:39:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 13:39:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 13:39:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 13:39:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 13:39:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLd4Oem8hkMLTFN5O3WxEoT1/dmLA2bSdik9jtkmCriNbXi+FANxgeXpR5O4Kj9CkveSl3jy0GJ1VzliMXTn6T1mJDjNttxlRAe4cf0+lpwtM1atF/ngd7/3ndsdhRpmImQ44FLoc7o3+ggCDhvhN2FA+oMSmUilfL0ioYUalIXxrk1HwTq6FW0AQu40i+uPUxEB8e872p9TPlzrjFlJNSOh0kvCaT0emuKpcbqMzsavGkFKaH/843xf9y8QI0Z80v8mxU8uAh0TSST1iKnwc48VTOBVHT6b8292Nr/2E205p5gk2u71a9FU8b/ON2p0ZgmjzRT25BndzUzkhfR+mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFpq7QhKAzA1A/WHuoHNNQdzSDotpHFTv0tLM0LsJwg=;
 b=mMx7bY2cuIpN1LpQvNU62AwWVKsS50yIXlJbtbuD0VwObSG123C99SHMg+HShblM151t+h9m7H/XMSO9QmdnPpWDk7dvxPosMcw/nA9utasUAmnqfMK4EyLHq67IsPkKSB9tx/ekRVfRIaupCExxgJuyKf7S61fSzQ5ZthOpctv2SYklqjDOrjFI8e7EMFm0DAz520PuXcIVfVwGp8AIglmwuNaFZCi5wG/5ZKmarvmgUetfQ38Si1uhN7C0fAwneLR9FJf9efRO629a6nIupueTTfPpLPX5UVnTvXMhW95LSWCiVq4Eh06HxrwSX+TKTvd8iNHV+Ma6bRFRWigMkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5771.namprd11.prod.outlook.com (2603:10b6:a03:424::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 20:39:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7633.037; Thu, 13 Jun 2024
 20:39:06 +0000
Date: Thu, 13 Jun 2024 15:38:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <ankit.k.nautiyal@intel.com>,
 <suraj.kandpal@intel.com>, <jani.nikula@linux.intel.com>,
 <sfr@canb.auug.org.au>
Subject: Re: [PATCH 1/2] drm/dp: Describe target_rr_divider in struct
 drm_dp_as_sdp
Message-ID: <tkizxstuhnmi5clgay2a7ejh762jcdouaf7s2j6vrzsbzn673g@wbnnf23xmbhm>
References: <20240613051317.345753-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240613051317.345753-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240613051317.345753-2-mitulkumar.ajitkumar.golani@intel.com>
X-ClientProxiedBy: MW4P221CA0022.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5771:EE_
X-MS-Office365-Filtering-Correlation-Id: a655d13e-55fb-4c68-30f6-08dc8be8dec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|376009|1800799019|366011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fOea5OIYl/P/SVY0YJBW0Hjligt9s6oaj1g3BtZfsEn+JOCR8XPzRLq/uWX7?=
 =?us-ascii?Q?grJpFV/lMUjeigmu1dxZXsTjLku8o+AK1/gKPB5GEw8AsdVqJg2xUmt4/sws?=
 =?us-ascii?Q?hWb4AgI4gBCqLC6yMwVNOLEWzVCj4RBU7lk0SOM4jEtNXAddoRx35IRVwNw7?=
 =?us-ascii?Q?Dm9gdhQBh3H8QCoBSJjsR3gyFX00oZfE5QY12Wzqno20LeJ2b7ldASpkVz5L?=
 =?us-ascii?Q?veZaMHOxiZzEC7fHmA+bSodAoSMUFSzWEmk6hPYDbxb7MYEF6bn1+qbb3xXE?=
 =?us-ascii?Q?1mN0hLeouYHiMFwQVOR3JJf2Jvuw0jOFaubXRqdYC6v39QUMuCaDNJei0idB?=
 =?us-ascii?Q?6L4P5VczwLNvU+0BV/aOEYUf070+AqEG0Hor/mwILnLOBXDSOtYwg6D8B11T?=
 =?us-ascii?Q?7kJp2LBdvGjCuj68e1k6iN6RY4AVx6yemoKZ0OfVEynM0+6wsjZE6CRpFYIo?=
 =?us-ascii?Q?H98DHnrOtzQQQuCh7sZlL5YJlJ+GYucd5PLfXvCvqzDECmseCe3Yl6YksSkq?=
 =?us-ascii?Q?S0hRcb7S+2MkvyWITgeDIP7v7envI8wjfgQAZUDWhdq/twoSjCRxqTBClMVG?=
 =?us-ascii?Q?dnT/hF1kfuZU3D3iAHq6+b5odWpx+bTWPPpQ4CYJifXkzZpQVVDwSE27dDw4?=
 =?us-ascii?Q?gksyrGkMu8iMcNhzZg+3h4xMwPFlbnHW7/mzXqV40I155dhrAHxrr45Lp6SP?=
 =?us-ascii?Q?nvxvNiOlGz0JmKIrsVoY3j8H18ffDYC5ptMAv8r1lAjC4GKsN5nsf23we8g8?=
 =?us-ascii?Q?ahg5txt10vZ/PW4kyWCtG6ExB5z4mV0tkFG//CO1NHMAJyF1H4xpzbmhrECM?=
 =?us-ascii?Q?gCQLfb3MbJNHXvQPlaTm+zc5+h/P0+XH+Xpcg5ptrQ/oz0gPZCWWx4KmUfpL?=
 =?us-ascii?Q?4AHqRyT2J4CObSStrXPj9WUogN6ftXKdsFhBs1W3gYbsN7TZJWu+zy+o0zev?=
 =?us-ascii?Q?NZJcdbnbvRQwU4iB3rTLsexn7xIEUL8HFGcFnIh44HmhFGQEaLEcxp17+BeE?=
 =?us-ascii?Q?q73SgQYhqoZZXh4nMVd35Vqv9v9GwVLj0+Pb2CS4FlT5JD2yYvUlywI9tw6Q?=
 =?us-ascii?Q?Ayds8C0usbw/VbWrIcExm1yqyQHukmEcUCoojLNQ6KQndGwKNF6HXz9VV99c?=
 =?us-ascii?Q?AVIKrvCEhjKH6OWynAAEl5vidymVWKOoHG1mJrRlCHVquqcDsLvkswsC8dmd?=
 =?us-ascii?Q?FcvFB6sOJ1/fP3vdO81uVAiD7yO/mGXI6C/dBgxH2SnEgKb0KodH18olTJo1?=
 =?us-ascii?Q?58sPfINa05Z62pCXiAzaJqJqNLH4r61+rXJVcxw93w4r1ND2R3CN9gE478I3?=
 =?us-ascii?Q?4y6c6sZxaYyxK6HtmPUrMRQY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(366011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cdcmAma6g2Njfx17AOaPo/BIf8esqwojAVxFBa0TwgJ4gJBUsIfHidjURQvq?=
 =?us-ascii?Q?xRCNwx6CXuXifOoX0ZXbe8NhGrXbDFAgnZn9CinYTIozE80CytjSZRRZdARo?=
 =?us-ascii?Q?L1zQGJsDZ88ztp6WR7sZr42+EZ3uhciaMwvb7TYCUuHF+1DoYmY2lVicvV0r?=
 =?us-ascii?Q?aLhslt57n1mo8i/nNMt0v49QIPKPG636wGnvDMkBoeJUecATkiqs79qGU8FH?=
 =?us-ascii?Q?D0CqTHZmnRZzCiea/+W4EuXdfwvpCiCjzxD2ZvsuP88fAjWbMvPAEa6XAy/5?=
 =?us-ascii?Q?lMa2d6udQOIwmsz3rZVz4Hxzl8VRSwpX+s/GiJ+Erf/VAfC9b+wrM/bxUzUu?=
 =?us-ascii?Q?CUPx3vxCZUSPa+OaFzQIDVgNPdqQXcTORWdD2XJVomLKRGvKRywERRS8Cl9+?=
 =?us-ascii?Q?pJ2ZjSz9GP9+L/0u0SbanoKeXufIY45pWK2br1JkSNEcRmBz6/gTq9orGSO/?=
 =?us-ascii?Q?YCA7wGCjy3ZUZDEmShDPwqLVhNDOIGFOps5krsx+6xNXnLO5lsUyROS3WlRf?=
 =?us-ascii?Q?2RZFN5YV6JkYXYgF/lmsrc+HxMgBBBSO1zVvpJJajucMgZZ+Kyp0bGW4ePBb?=
 =?us-ascii?Q?5JSjwQ7Ah/56AhdpNFCEryODgoBiJWPxa9QxesLTH0k0oAVHw5HoITHFqF0r?=
 =?us-ascii?Q?fer8/5dx6JK8fmZ26GvHnBpyuXmbqrbna6Kaeg8RI6f9jKzrzFscJ707rHAC?=
 =?us-ascii?Q?rhbQitHMpRDeoPtk06mWRvHb8bIGwyiZlBDsYa//t2G/fMe+4RlRFeKveVKr?=
 =?us-ascii?Q?3XBNvJMUnr1TMu24OtNbz5ZQN+xzfQLSHQ9mp0+M+YPSMHvLJypQAYGfHQvH?=
 =?us-ascii?Q?Tj5oJs2a4go3LjyLckRoJlC7jHYgNhAmU7Yt91Gd/lZalqrFtwR8GPYw4hbX?=
 =?us-ascii?Q?nSUs/KUC+rw01zu8RTg5K8QD/pvf3qxJ7JfMz/wCGWPBj1DpCe2pBbdh+Pzj?=
 =?us-ascii?Q?jFgDd676VOd24X5t/3kOI2Bz2gVlXPalZ5gzRe0BbsWbHGGqMiB9e8v8mS85?=
 =?us-ascii?Q?FzdKS8EY4eAQLVcAisyYsvbYIk7m5EjyuievYSp0MdPhWtyn5VOLkWprOizb?=
 =?us-ascii?Q?QbP8T0rB3SG5oUcODABiQVFojllE7zcA1NgBjPS0iOpjTrJ6ozg5YJQcWyiE?=
 =?us-ascii?Q?VvtfHHPMpMhhaD3QQtk43crm6e49QhuQSaxKp2q2CPmV/pZ10JOl0cagtXPO?=
 =?us-ascii?Q?SRg3PG58Msr/Jw7BLH2NtiO1leEonH0sSy+UkGEehghhfxzDGCsLweOxup+V?=
 =?us-ascii?Q?vwicIe2yIpEHzZdHIHlC3IScZMjZfig19lbvj5HRc7eCRBefppw+67LJSnhu?=
 =?us-ascii?Q?M+/cDqXIxmdYATCEhXTWtNJFRbO0vhWxA0UlNPewKL3uX9F3CRyd2/Tv8xHB?=
 =?us-ascii?Q?CIceHI+NSHJJagRt5oWXvUaglUeVOMujrw8I0voGUwHoWpN3K7DC6T4UgPOR?=
 =?us-ascii?Q?GuI8oL33noJxlTUF5EkoOQV+M0xuvt0PSRO4d6Ctll/7T1D+hNvEH7+02kwz?=
 =?us-ascii?Q?R36+sx6MnPeE4VCMxcgwkL0aRJcK1A3gIjogn5Eg8igQJM2I30DYn/syKJ1D?=
 =?us-ascii?Q?L1xNEMiseK/wjrevrP0hjfFUewW8+QVjFmnqaoOaAIMMY83201rpcFvqi1r6?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a655d13e-55fb-4c68-30f6-08dc8be8dec7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 20:39:06.7865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1+4+78STn3eZ6FJZKhC4ZwZcQP1rJf9cI2GT5soeaiwBxyhuHZ29DzLLYG9+TrsJJfASgU3kX2SYQfxGkKV8qeLqkhJ1ODIzZ5+IA+Bnik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5771
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

On Thu, Jun 13, 2024 at 10:43:16AM GMT, Mitul Golani wrote:
>Describe newly added parameter target_rr_divider in struct
>drm_dp_as_sdp.
>
>Fixes: a20c6d954d75 ("drm/dp: Add refresh rate divider to struct representing AS SDP")
>Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>Cc: Arun R Murthy <arun.r.murthy@intel.com>
>Cc: Suraj Kandpal <suraj.kandpal@intel.com>
>Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>Cc: Jani Nikula <jani.nikula@intel.com>
>Cc: Stephen Rothwell <sfr@canb.auug.org.au>
>

^ wrong newline. If you do that, git doesn't recognize them as part of
the trailer.

Lucas De Marchi

>Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>---
> include/drm/display/drm_dp_helper.h | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
>index ea03e1dd26ba..7f2567fa230d 100644
>--- a/include/drm/display/drm_dp_helper.h
>+++ b/include/drm/display/drm_dp_helper.h
>@@ -112,6 +112,7 @@ struct drm_dp_vsc_sdp {
>  * @target_rr: Target Refresh
>  * @duration_incr_ms: Successive frame duration increase
>  * @duration_decr_ms: Successive frame duration decrease
>+ * @target_rr_divider: Target refresh rate divider
>  * @mode: Adaptive Sync Operation Mode
>  */
> struct drm_dp_as_sdp {
>-- 
>2.45.2
>

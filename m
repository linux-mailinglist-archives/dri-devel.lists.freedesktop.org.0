Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA64D9723E5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 22:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9602110E6A7;
	Mon,  9 Sep 2024 20:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3byX0tz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E25610E6A4;
 Mon,  9 Sep 2024 20:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725914608; x=1757450608;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I1YgBwHjIZj3B9PUccc1rJiZeoE7+U13SaVKCEWDFOc=;
 b=h3byX0tzfoJLHPZo3JWK6qaySTELGNSG7rG1TPkB5sGCIu5poOJy42Sp
 faLKs5lo7jvyPKQ1Bobe6S/HI1BF9U4ldoN5uAweUfEy9U53Gpem4rClS
 1yecKNzqEGHh1zqgd2YZnBI3yCy/IfcJvHoWAP4IA5HfQjHx5RFLnEYx/
 V8aTfZbN/ySjmgBZzBzX7ZsgN2lHl+hPZnQi0HSLwnVOot7a259HPrNMF
 Ujm1HevjwWa8zQTDT39Vo9xUUVOnFBjAlaHh9JqY7poQ3TFd/AjqTHjrU
 Vnu1FbtbdDkc0BHkQlXMOj6RzNQnXQPlbsc9Q1wJDcsFZjJGlrMqmkHBE g==;
X-CSE-ConnectionGUID: MV/I7lQrQ8an0SIC3ccc0g==
X-CSE-MsgGUID: ODNqvEFXSPu89S4a3tGWFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28519980"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="28519980"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 13:43:27 -0700
X-CSE-ConnectionGUID: cCMT9dmHQMuQYfMHRB1Xyw==
X-CSE-MsgGUID: 6aRn+Td5R3iWs4nJOLm9Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="97596764"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 13:43:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 13:43:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 13:43:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 13:43:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 13:43:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hTEfLPmego0zuqa3kdsYuHpoQEQo9chVuOnXnlmo2F+Val4pN4lRkCaYoNzG7gPtW+5mt/Z3aEDPW1UgL6rJooZR3xCAz/ol9VjXEgW7c22tA6RRj56/xeFH9st6aTLfdEE9IBetnwztQB3RKPIMk5mgtdd2NY0k8p7TqpbhYRvAo2XEFMLnLmqnj+VW7Q/nXSeJLnb0+t6XByYsK6zYMdJm2pT2BfR4u1MIH1CJ4eDhiaeWpjN0rhxNw1Z6QWgQwKmKQjk8JOOwOVZjJNi4yKPEeLjXaKEabFMPj8SoonuMFN7ijjPnnXvf8xy1Gn7FS0fnA8/uyRvPn2rs39FcrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6xD5whYdZO23q6nzW+36m04l+bboe3L8XqtXgvELg8=;
 b=UfgPp3UBrB0NOm28o86uyCTuY7+V61D1+sLO8PaRXCnAUetG60gSvwha7DjH/a9SXmuozXU44UIXkkYKvdK6W1om3zN/OH34jDUjUc2vDnobTEJCy5p46Vy7VwZIMdvY45rtg9d+hTMylNaGeX6iMTpoRrE/s+bUYkeLk60qeRhn3WJZa5/LwjuanxD2jhA7CybDL/SH17987PasRht+j+g6z9e5HyeFonYcAkOBw34qNRX4ohiVEDSjR1mu7+nh90wIZMODZD3Dknh84C8avsUERA6Aupvst/sHejTyasBV2mUF5U4RNtmzcOtu6UwJObrg1N6a1/UgRlW2VTp4FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS7PR11MB6103.namprd11.prod.outlook.com (2603:10b6:8:84::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Mon, 9 Sep
 2024 20:43:24 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 20:43:23 +0000
Date: Mon, 9 Sep 2024 16:43:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Asahi Lina <lina@asahilina.net>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Raag Jadav
 <raag.jadav@intel.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <thomas.hellstrom@linux.intel.com>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <tursulin@ursulin.net>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <francois.dugast@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <anshuman.gupta@intel.com>
Subject: Re: [PATCH v4 1/3] drm: Introduce device wedged event
Message-ID: <Zt9d4wDYEhRLJ_RZ@intel.com>
References: <20240906094225.3082162-1-raag.jadav@intel.com>
 <20240906094225.3082162-2-raag.jadav@intel.com>
 <7ca931aa-986d-48d4-bcee-37c3badd91c8@asahilina.net>
 <x5kvnv6cdo6d2wdcsokvvsedzpr5crcncmmiqnkyomf4nez4mk@er3axfov44fc>
 <4c9ce216-9762-4dfd-80c7-fe285cae05c2@asahilina.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4c9ce216-9762-4dfd-80c7-fe285cae05c2@asahilina.net>
X-ClientProxiedBy: MW4PR04CA0358.namprd04.prod.outlook.com
 (2603:10b6:303:8a::33) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS7PR11MB6103:EE_
X-MS-Office365-Filtering-Correlation-Id: 08774727-c6a3-4fd6-5305-08dcd1100b47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aJg1OcT5LrH+SUMk1Ca3MN+MUsE+7zw4PjRuzpmV3mZkJy71s+ftyyZgZ1Lb?=
 =?us-ascii?Q?qRFMESmC81Mrr11LKkaPjeM7JW/ZKFFTqUa8SnkEscBzF+XIyXXza4ch80sx?=
 =?us-ascii?Q?+jQ9Mp69cptnaVPRC/buXHIpTAi+x9q8hND4H3N43DOLjlEIj5OHBIYC1p2A?=
 =?us-ascii?Q?gri0bHQP1OwbWy1jHORGjrD/Ox5jLxSAqu2oZAQZlng9Pkm5ggony6ipHmwE?=
 =?us-ascii?Q?9K/Zga217loqlkDtvhwX3CvRIJvKCb06VLfSbfQ49fDUFYEDt+heT5SaLdHW?=
 =?us-ascii?Q?WpianxmDKc1oodndNYZr9vgZDNnnV72afZY4WPAbMlDOu+PaKhw8glDHsWz1?=
 =?us-ascii?Q?KNgbKm4PX8oz+TcxrD2EdpM0IhJpFr0FbCq0iR/yP2r+lsgzU1b44wWNAGsM?=
 =?us-ascii?Q?KqpxGJs9zkzeSlL6Sy/EVQPj96wX5jL060b53AD28vwXS9arj8sLTs+eHGFH?=
 =?us-ascii?Q?RS9/TtBRw9Z/wwBJ33Q02zO8s5VXxAO4lhIucAbI8zW13II/cI1mOkfqFEP5?=
 =?us-ascii?Q?tzq/oysLpsOfo/AlW/SY4q/qUMtg/FN/ENnLRCk5bGUupi7XFtL/TjfsyEiV?=
 =?us-ascii?Q?+4e9t/q4U74pL3mXFaUEDP9+4iFUlQjbuNWqr9z5pzya549ciUAhebX/r5ae?=
 =?us-ascii?Q?jYigkv5aTbrp8r6iZHdE6kBySbFrKU4iLz1h9LeNMoAl8GjbmpgcKVpodPos?=
 =?us-ascii?Q?T3tNUWAXT1pGZjYZ6+Pn7zXhqIwUM+kNAXwgXpPsBuW9OgE8UbR+NHbEw8IU?=
 =?us-ascii?Q?X+OiyGNhY7vtzjqWvktlLZcXn17K6zW06eZPtk7nstl/A6hyLdaYOKjYYIAb?=
 =?us-ascii?Q?h+Tu8EJnyz66yntoc2HUqF38mpgMRtuKAwLGb7E+ismPv9QX+rUOYBofUmTP?=
 =?us-ascii?Q?lOhZImLSNpEiQ2Xx07dfFrV1wFCO03qGuR0egwhFuFl5+fAdaGIxsCYruypy?=
 =?us-ascii?Q?aCFLcCe5gNj8F30WG1BEpNvAUuGqCivCVdg66fAcXcmw+PwCIpcTDZ8u8+Tr?=
 =?us-ascii?Q?YJy5zuHMYg5IuoOnvtKYA/ZWQ35PaNcs7D21jLz3WxNJZRDqypdyvD2EE5xt?=
 =?us-ascii?Q?88a+HX5fRB5YHl6rIy5ISF0BoZJKe7rc3Tc/BObfW5dXm210iQAYzhDg65Nv?=
 =?us-ascii?Q?qP2BC4fKIhZK4vqYC+lGZVAMIzyE25cHDPpYYQOpX7tSHUfDfZsj0lemX6jo?=
 =?us-ascii?Q?TP/FCzrklyQSrRvhYCsVKJZgdiBt4jfXpAV8Sd+iQQfLdrFhByxICGg3la8d?=
 =?us-ascii?Q?drgKKyDrAj+5qOGpm8tJqtMeHksVFthXEE/0myuHBJmRoU73PkWMThPOQrh7?=
 =?us-ascii?Q?bSEMYNly+M2O+MuAxo22Vnpbz0M//lFCsH2h632pQv0e5w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mEdpczQO8Ej/ltX1LNBP7Zv2IAkjXBTgoA6xzb4bwxn7yv4hBzfXPyRIdw71?=
 =?us-ascii?Q?SypASQO7Y7P3tHiyEwAy9hI1qg3YXlzmWq6t1zrGPIWoeEIW19Ws25L8dCMg?=
 =?us-ascii?Q?XNWEfci4nY0zNJJSq+lSUj4Qxd/6/Jt4/Lq5T/tDrul0ZM8GehCvE6hQWHxz?=
 =?us-ascii?Q?nCq19l01FCU8zKSGGsrK07E107hBAhDadY9UB1aUhWgaId7TQQQoDFayQSQD?=
 =?us-ascii?Q?7SiDNQmdozMtKfBzDSTLyufsEgv5nmvAeSHhyi1Y26AdmIUwma6gXVqj6lQc?=
 =?us-ascii?Q?C2oKv0HkVbRmHiOwmgzDpqA7tdOtF9jpPY0B/oQyT/2YaMf1RqMUrJWTo2py?=
 =?us-ascii?Q?p+H/+AxDsFVEgSwWAgFjWz1K48rs+/f2cBOyNX9I+Khi7Z7JToIrnqtcya9k?=
 =?us-ascii?Q?cjWhioPLReZ0jLcTJIEwn4+8u4DM0AQcTX0Zoeq90lfjrASuITurbH/wtmNr?=
 =?us-ascii?Q?ni5fbuxmI2oSlFnAObLKZQjQhdTUexanA0fl5/MwBRQZmxwOmqOwDeXpcbTn?=
 =?us-ascii?Q?TepIE424FeqZA0qUtDmMx6CtAPvWxYfyTNNo89nkx2bdwMprT1pf84Jacyvo?=
 =?us-ascii?Q?vDaK3c5y6lAPDpZPozTmcmJqkxcG7WnCx30wqPVRGdRAfNwzEZ6SIFngyBrs?=
 =?us-ascii?Q?pCi8TLG7tpJJGnpvAgkKlK2TKp0xEGdfJGjhUqig5s72VfAKp5DudPwaV/W+?=
 =?us-ascii?Q?I5nWddPT0IRsJW+GfdHz8cUTQLTVNmJ452cwvfiv6YjdpVKolAq/kz5/LFZo?=
 =?us-ascii?Q?H9gdV/oB8HYVRM7GVXExSP4ug6WnSTPF+QVCXABof1E9Bara+4z2d0IlMVCr?=
 =?us-ascii?Q?D+4vzpudp9lLCTGmnZ43NhG044DrRRQ806Awnbkejf9J+yE9Y1UgY8Jb079q?=
 =?us-ascii?Q?QkjqPGRphPB/rmZu80bcre3HPcH5WeHuNcAfbqrMkRdY+MI+7/ZGn3aAlip6?=
 =?us-ascii?Q?HmMf15219oG1ifmSr0vFkWBEIdh9RJtfo+Hx6MPJyghSJh5GQw5ONcBYEDWe?=
 =?us-ascii?Q?Bm88SHPUuFuYjF/QRRAPYFI3rA6G62sN2gzDiwUtySeTDMDLhPnJsqJsIYEa?=
 =?us-ascii?Q?SqkQM9RHn8PfFNk5ovmR7keqWcb5DGsAl9if4OePEmF8ZTgTpqk0BG7zVCpw?=
 =?us-ascii?Q?pJfa8mWuVBH4ff3Tey6tuDFu3rIIuPM+5swUZIp9iN84jheLJmQcIGMlQ2cx?=
 =?us-ascii?Q?dPS+cTJLXechrW94I/xk/bCYXixyWXjj0e8or1hT3pxwbxWF3fBx5435tuWR?=
 =?us-ascii?Q?iLevC/au/+ReartX3NoGPRarQUXXvXk340samBg+mwHtCF3HcAesZYZdRumA?=
 =?us-ascii?Q?CbEsqoe0QvxYUuxO22OgL9+2lgsRp3JlFvPXJe2E8LTKhf2ZcbmQcOSTNywL?=
 =?us-ascii?Q?1Na9ve7s+27giPW+4jRuFW3f1+N++ep/EwCFvcsUsO0/qX+sT5iSZwwbsw6N?=
 =?us-ascii?Q?5oXH2o7DDMM2mtBcIihMeBfDsOjPF2MemFPgRYn6B3kbeC+BZAkNYlLkFBh+?=
 =?us-ascii?Q?mM4dOE7ouQCPUOjj626jIVopFa6R0hUja11bjM/NdCBodc/cvN8lw5UH7QaE?=
 =?us-ascii?Q?QHIfh4PzsEVOhVwC8LQZKRMUnzWwktOshcYOWlYcaS+wJvLKEZfJqeYmcjXl?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08774727-c6a3-4fd6-5305-08dcd1100b47
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 20:43:23.6706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMtZAcOIds1FKC8GoVH7IYCKEUr4Krw6S45L5uAEvwScoJJGJH2eAxdTDlhsAXnFKxeucIHiigIxhpHo7HsJuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6103
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

On Sun, Sep 08, 2024 at 11:08:39PM +0900, Asahi Lina wrote:
> 
> 
> On 9/8/24 12:07 AM, Lucas De Marchi wrote:
> > On Sat, Sep 07, 2024 at 08:38:30PM GMT, Asahi Lina wrote:
> >>
> >>
> >> On 9/6/24 6:42 PM, Raag Jadav wrote:
> >>> Introduce device wedged event, which will notify userspace of wedged
> >>> (hanged/unusable) state of the DRM device through a uevent. This is
> >>> useful especially in cases where the device is in unrecoverable state
> >>> and requires userspace intervention for recovery.
> >>>
> >>> Purpose of this implementation is to be vendor agnostic. Userspace
> >>> consumers (sysadmin) can define udev rules to parse this event and
> >>> take respective action to recover the device.
> >>>
> >>> Consumer expectations:
> >>> ----------------------
> >>> 1) Unbind driver
> >>> 2) Reset bus device
> >>> 3) Re-bind driver
> >>
> >> Is this supposed to be normative? For drm/asahi we have a "wedged"
> >> concept (firmware crashed), but the only possible recovery action is a
> >> full system reboot (which might still be desirable to allow userspace to
> >> trigger automatically in some scenarios) since there is no bus-level
> >> reset and no firmware reload possible.
> > 
> > maybe let drivers hint possible/supported recovery mechanisms and then
> > sysadmin chooses what to do?
> 
> How would we do this? A textual value for the event or something like
> that? ("WEDGED=bus-reset" vs "WEDGED=reboot"?)

Looks like a good idea.

Although in our case it is not just a 'bus-reset' but unbind+bus_reset+rebind,
but that should be okay to have 'bus-reset' kind of text and driver
to document the meaning.

> 
> ~~ Lina

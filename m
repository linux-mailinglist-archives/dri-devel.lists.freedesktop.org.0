Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2054C8725E0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 18:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16EA10F114;
	Tue,  5 Mar 2024 17:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8dQExSB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B457010E57A;
 Tue,  5 Mar 2024 17:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709660755; x=1741196755;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LoB59iybE/FqiE1PFQhVs59q2ez5aGoiDkcC5koLPGo=;
 b=I8dQExSB6FjE45smftVQRh4KJ1TXS19vdmzxsB7F9hK1ptV0Y6flrSVK
 n0et/JcfFAwlmrDa4WN68LGQzd/WiGrBXUWRrJOyE1+zhZRbebpzUplIm
 z2knqx8vsUwD71HonIR00FYqIofSe1HyPiYCMTKT6Yn25czCDIod2Mi3F
 j8GIpi87TKFGoWpOL4tw+LGlOtCPl9Gt7ksRCdrFkVv46rcFyHWmc1e9u
 t5GYwus8hT9dhVlqEAn0iFZuKzquAgiV2HGCydwAn5vKiqoKa9YRLfrJd
 xA6VJy0kfcPi/TbCyzBEN8tJ2/Hcg9VH7+jSfaS2hEHfFrjRKpqVQytvX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="7176914"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="7176914"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:45:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="9392596"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 09:45:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 09:45:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 09:45:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 09:45:35 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 09:45:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0G+1WpyE0k8u5agZp5QyXEx187KYKyCVcSXbjSBarWubPhyQHPCfwJhWCJFKHBrBEbmHsBTU3R1U7Bho63sWlbSBXPJCXcKt/fGGjsf4fbXdzwOFL8Qpy9bk57w1yB4EmugZsDQaiNe5Od7oYuJqFUAHmbDdnQ7m1TOP8pP6nwjMUDvEIMekX6To8yZv5EuS900Qe/nao3qP1ItyiCLj6H0bD9X5fOGYLIlNVb+j1Vm6UcN8hlyP7n0D3Ov8l9qlsB3bZn/lT7Dz72h4xXd3rvw7IeFHCYxFMkIMzUhmWcdJGrOXQYOGBsk6KfXviCa5QsD9ou7Iv3w8Y1/a/UDKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pulLy7aAFl02EeiyDka3JY1tsrg6w6dN3uTQqpv0Y90=;
 b=HYzAQ3H5lAjGPdtPT8gvXNN3Sp6O5MI6Lkox5CB810flql30i4cwyxJP00WovgABNzCb8gp8XbBzvkM19tFRWDgtSNeagtOg6mpc3kC339+GIRP+WLeUYfUJXRjD0gpPCUmbjOcqe2oM9WxpRhcje8q+QNPyU7lMATQb3o09w1AYUIaTV2FfVFza7wkKvaWjCTCJS+Ig2pVcqUfJyVVDwQxC9Ysz5V+cac1usQE7FBV1VznnWScq0kQkZLaEBKXMU+XHbXxoA3XxgOTFp9YKePqf6LW42RPL7VT1yvVLbvsAjgAY5hwnuFQb9rTUsBia7i/EpPEvmTDDn9oMGX+w3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Tue, 5 Mar
 2024 17:45:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 17:45:32 +0000
Date: Tue, 5 Mar 2024 11:45:20 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: Maxime Ripard <mripard@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Daniel Vetter
 <daniel@ffwll.ch>, Danilo Krummrich <dakr@redhat.com>, David Airlie
 <airlied@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Hamza
 Mahfooz" <hamza.mahfooz@amd.com>, Javier Martinez Canillas
 <javierm@redhat.com>, Karol Herbst <kherbst@redhat.com>, Lyude Paul
 <lyude@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, <Xinhui.Pan@amd.com>, "Rob
 Clark" <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Sui Jingfeng
 <sui.jingfeng@linux.dev>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [RESEND v3 0/2] drm: enable W=1 warnings by default across the
 subsystem
Message-ID: <yfsm3rrqtv3z6c6xyprappevvgqtxpwgjgt5ejoe74gfvhvcia@ybmkknyulv5x>
References: <cover.1709629403.git.jani.nikula@intel.com>
 <0df557af4aaceeb1ef85ee3c74169ee9@kernel.org>
 <8734t41sno.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <8734t41sno.fsf@intel.com>
X-ClientProxiedBy: SJ0PR13CA0152.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: 47511c4f-5750-4938-a4f6-08dc3d3c0e47
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AoG+njeMAXLEw4uSRylFCgPseItYHU0nbepKbpjKZosTZImBWd5Fg1ZGYwJd9tsWv1MtpPU51UZ798xd4v/Jh3cZax9YDp5V1hGa6wcV812/fMyHv36fwJqEK6ZRWNwZXJIV+CPoJinZBGi1ViWcebZV+Qvh59RSPWGOOT4DhI3zPf4dvZIq2wVAb+NVhnYixWX4PqV70yg5IiydkAKSY42p08SzLvWL/ECOBQLHEq2DnUX2v89kNgbwZyDkd/9MFTa9NxGfagljBpPBtSM/JqpvylyFwTo/uld3eOeSuHYAnMEBI8BCXk9jZw3RkcRq7PXTdsuZ6B9e4umNGAloKt/mJCCgqr0jeEOSnJ4Av7e53Lj4e9b0OawWpmo7yiqK1YOYHxUOnFsCaGCh3dDPx1CjyP3m5gdk7i9Y9gtQ+BGJOH5xrq3ePYz4hloQR/9DkRAX3onSnt/44tbXltlS5R3rIcl6hUDKcInxG2oOnHcD2QFd3tiWuKlpVC0vSwxtXMdpHrYMZbsoSfFz/SFeLShHUc5CMpFSMp9XgXJxxTG6aVUcTXSKe7dGUs0mgYEBf35qw5bhlby3s5NysxZsjgRkpszYgfai/lZBJyt5gXDiev7hH70L0rQ1jL4kZnlUsc0SK4zKOf3JL5bEsN1WDPZHx7x/MOCCDV9p9DDaXBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5GbrfkmuNKVNF9S/sgoJmHuQTRWicHG158MbBgedunClZnaoyfvZzCgH135b?=
 =?us-ascii?Q?t2C2y13wPgwSzw8U//r+6/2YYQB7gQmzP6Y/2sYX5OBBuT+z8ssD7LKPb69S?=
 =?us-ascii?Q?J8bDaGXLFURlEvyy5ZlY9L9NXB6MMZRHrxjEcvIOc1o4mE9zX5yFm5WXY19Y?=
 =?us-ascii?Q?DPOLnuwcALjdxHZ9xU7GYR82aXnahQmmPsAjwtvo1iCIQhzlvskDszIdEqYy?=
 =?us-ascii?Q?10qxeZsQFZxDIfZS7WSQvfj+YQ5uuRfVaItPMx32w4qKtBlqViGA8+nLUdRv?=
 =?us-ascii?Q?O91IkvrB2r2XDCTUbne5WAuVecjJtKmHeCqcUIDOMCi+F8dy3dWCVQd0fHcN?=
 =?us-ascii?Q?+RuU9og65rhx9Fa4Z6lVcxzjMgKgBPTktZoIobPPcqeseBl73ldhwI29nU9N?=
 =?us-ascii?Q?LmNcZzb3dxFnS3/5TpCHYItM7YwsQ+lSyTpaZXiJJomKzHCQJv9VAkdSkKfz?=
 =?us-ascii?Q?4N/6UziUOSYgyFrXnwqSmDDfrPJrjD1LEm89Icc0ISaJnKrFiZuilpdkQF/D?=
 =?us-ascii?Q?vXacVq2sxdwnnRjfTjbSiVs7NVcPKkKcWCefJ7CIVgFtsZauavv373U1spFe?=
 =?us-ascii?Q?GxIgqFMs0W4QgrvWGm/RLunhZ/p4b9spu5djcmejcJhPLTPeZ+IZX/y35zta?=
 =?us-ascii?Q?IVrc799/JGGj5L3MmAnZPqWwJwPenJIFgCfii/bwkuHuu67Ra7yhkWLCmV6j?=
 =?us-ascii?Q?HJak2WRmkFcYfzMptB35eH/eE2bPISnYPYxTzo7xb4gvHi6rP84vbIiVgITl?=
 =?us-ascii?Q?RH+/d1SVy5duIjicyZhaz7+Luf7DruKLIOu4a0O6ADK4VFbUiHiH1WM3ktXd?=
 =?us-ascii?Q?ar1dNeagA1FD3veJTR5eaUmyYdMQJAGmpjz/8SY7m2l1XxeO8b8MUFyzK4HQ?=
 =?us-ascii?Q?6zUmU3qvMislq29BVNBDrJCCNQ5tn5r2jTh7Ydid4zLxZ2e2jYq04kLzDExI?=
 =?us-ascii?Q?o82vRokXBccOTiDC21Y76LY+aXa4OoFQwezBBgQPzofuzjlISV/RtvmQWl1g?=
 =?us-ascii?Q?0qFGbITRTTi5fOXczCoIP50bk9edKXA69y6TZyByehidIjq/qyiyvM/Y5fdy?=
 =?us-ascii?Q?8crz7JSmbU7Ux4QXU5iGTOv3CAizUVocVw2Xhn+a3dvzQW2xLQxzBZTSHYMT?=
 =?us-ascii?Q?H7boaGt0vuQdcyV+gao0ljvly581Owa651pkYYjIa1C7plJSRp2JTZqaeM6j?=
 =?us-ascii?Q?uQHhuLOztilzZPicUuYY4vQe/9ZEAQXGFL4mhE2IdkGJkC2ta1VU2jmnM7zX?=
 =?us-ascii?Q?ulNz+cbbLH2sbfUHtoSKWFxGmsc/8Ws1GkgMR4sSQ97fO6J3ilkRFDFAaQI0?=
 =?us-ascii?Q?oiCotLU+Bvqv52cCEtqiXeF9bnAllY+4ufklzwcYux6/S/lZWQLvTmefnpOJ?=
 =?us-ascii?Q?XWoVPaESueXGYrpaVCqTU1D8doBXuAIqZHIA3yD5WbqpHYwNmfW2eqG+7hKw?=
 =?us-ascii?Q?NFbkNduPl2pJtE58XAgSADTvej99BkZk7ToncBBjpVKd0fwHFveW8CZtlUbI?=
 =?us-ascii?Q?FCVkefBRAEcvdzF/GqSy1A/Oc46ahLLXbtHt1SSqBl68sZUzBWsDMFgcyBya?=
 =?us-ascii?Q?gj0n8AE7g4kQ2oBLe/4dRC2VBqp5ZnSoygVN6w/btPN7vwVBtnIACRXFKaRD?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47511c4f-5750-4938-a4f6-08dc3d3c0e47
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 17:45:32.8105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6nf64eUl0wedTnouDsd66atbtfJ6SKU8INojPU2QkSPDWk6makc3AIa+gF65K2D0ene5z1jtXDnai26DUo2Zg1h67tqh2no7ObdKQ2zACQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6117
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

On Tue, Mar 05, 2024 at 07:43:07PM +0200, Jani Nikula wrote:
>On Tue, 05 Mar 2024, "Maxime Ripard" <mripard@kernel.org> wrote:
>> On Tue, 5 Mar 2024 11:07:34 +0200, Jani Nikula wrote:
>>> Resend of [1] with an intent to merge after the CI results come in. This
>>> is aiming for v6.10, so we'll have maximal time to find all the issues
>>> my configs didn't catch.
>>>
>>> I built this on x86-64 (both gcc and clang), arm and arm64, and
>>>
>>> [ ... ]
>>
>> Acked-by: Maxime Ripard <mripard@kernel.org>
>
>Thanks everyone for acks and reviews, pushed to drm-misc-next.

should we start removing the now duplicate ones in i915 and xe?

Lucas De Marchi

>
>BR,
>Jani.
>
>
>-- 
>Jani Nikula, Intel

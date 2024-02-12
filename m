Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4397D850D09
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 04:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C75B10E735;
	Mon, 12 Feb 2024 03:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdXeyny5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F4F10E735
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 03:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707709019; x=1739245019;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=wQzhwcocB5o10m2ItiCRXxzAsdvwN+hsSV7p+kY5oC8=;
 b=mdXeyny57VABdLxCNnIpLElYoykSRjyGSTCHpYp9SacluKT2wqfKZOoI
 3atzOVUykohmuovcbktAunEYIX7zWU8PJHoUh1XHrs39Uq820WCo3P/EE
 yrRl6ktnoGhphLImQ6RsdV7Nye/XWfTD3vvGTlZydLR/dhtTy8n13Rj/b
 Rgq9spZze8Hs3NDpz/3NEguqfS9ctReoUJc4UWk8Hant7N+vshQyaytQc
 wibFcInttsQRN6AVMgbpUzN2Jeka6h9Mf8mvdEwM4xgdcuuHOzxymBPwn
 xBISH/D3AYaCXZFaFeVVL/4Tjeskx+Xzr01lY2VhdMA+rSv0cv8G9SDcm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1541057"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="1541057"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2024 19:36:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="2527303"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2024 19:36:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 11 Feb 2024 19:36:54 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 11 Feb 2024 19:36:54 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 11 Feb 2024 19:36:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwBVK7KarEbGIoZdzvccHOWgTzbWgDwQKVut9p0hO5x5vUJODO66jnB1Pd6JXetzsopn0VKpCrAUfK2ac/Vs3xKxh6+MIWUZ+/FFEQxZWrpFmsBFzH/6cXT999zSvq9GeFBWTnJUh8qTNkhhXhzV5tA0wfJkVK3WEOaJdLI4XKmOklLkeBVVmZSpYSjCyPupThyNKeRLmj6btl50hPk8RFclM59Qg7V+kEptckMTyfSu5Re4woT5uWY1Na1Iv57n7su3ZsXKQGZgQKgnrxGkIH27/UeoDGLZM73YEAgdAKL0pqGcDUZdNrLboeg9QBS8v0L932ovCFg86CWjXMmY1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tu/gDxNFoR4oATqdE+hgFf9DRsIWn6uAuLdgKjxZZzA=;
 b=WPwTw5UHyy88rq64gW1Tc1YPU8Y7Xvf6/Ij2TOVHTZ5pr8SxCJfduXBVAitPYFFU4Svr599NcW49K+OfeFR/Sn/iTcK874SOEDcxlMjujGGrigwMpyV26VA9EXPWKdSxPyoNcioAcBxueqCrWNgv6dsEamD+oHYNFPSLwv/FDmYzEKgyAAX2JS8HLMzlT4XxwWFzbKWAbcmd+cc4+yUoanCTvRdLKeFV3UAfTnmlJrIG9h+6fBBn1Wiorvlk9YQCO2ajQLI2k0Gln54yb81DW1dTI1wIzSNTE79vtIPHYYcgno6O7rDHvgp2cZAc8hgW+2o1O3zkXe2gh2aJzNPS5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by DM4PR11MB8157.namprd11.prod.outlook.com (2603:10b6:8:187::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Mon, 12 Feb
 2024 03:36:52 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708%4]) with mapi id 15.20.7270.033; Mon, 12 Feb 2024
 03:36:52 +0000
Date: Mon, 12 Feb 2024 11:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Simha BN <simhavcs@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>
CC: <oe-kbuild-all@lists.linux.dev>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Michael Walle <mwalle@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 03/10] dt-bindings: display: bridge: tc358775: Add
 support for tc358765
Message-ID: <ZcmSR7oT4de4C0bS@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240211095144.2589-4-tony@atomide.com>
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|DM4PR11MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 48c8cae4-39a0-4cda-be6f-08dc2b7bd9fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jHvqmT2baVhlmgGw2tdNaHhoB1F1g0zsWmDdXK91S2az4II628CLRHFU/+VLuy6LFoclK+zQbPewYO1jFq4xHFJVXLt5ZETkw2ad83y5iCkwQydguZJjmbzPp88uwU/6xAlvj+DLTOkNZgUCDLcDDvHgy7hLVigpECBhlVnp4REAiGw62L4Syb/8uoQtsCKlvBsndx0yO/mVpxVPSd8Pkok6P3X32FF9WpzS6jJE5OnDmX877H5D1KPzr7m7Tmm+EVg02Pn1BWKm5ZAUGfh+SlV+Wp2uw8BmmhCRNDL+udZtSv0zuPBqsyjRd78usu8V4WN7tuHRsEjef+sCkrkfw/nv3zf1t8Cdep6gjbJX+3eZxGVLif3Bzu2grJhZzaB7pUH4Lf+agpLt2Y2Y+kG7dmr1NfHHD6pzFSTwnkhAh6sCSp1Pv2WQSezSwgGnD/AplBujOFSauesH4gPvzrCFDJNAycAPPgGmRnJIiTuyDBalihGzGMjABPdcbRM5sBZMrz1/pLeEHCGuuUpsVB22+VL+AaRSmS+Xe/bL2tZV/jXCqcZmOLiO4MAUq6bN05hSaJCMfp55Gb+Y6ooxCoGdnaTWiHlSIQV5oICC1+sYqEi07GyZhf83lKQo5hVwPYA8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8414.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(396003)(136003)(376002)(346002)(230922051799003)(230273577357003)(64100799003)(1800799012)(451199024)(186009)(921011)(33716001)(6506007)(6512007)(9686003)(966005)(2906002)(4001150100001)(6486002)(5660300002)(7416002)(66946007)(86362001)(82960400001)(38100700002)(66556008)(478600001)(54906003)(110136005)(316002)(6666004)(83380400001)(66476007)(4326008)(26005)(8676002)(8936002)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l3wC08HLhpWepPwmucvbfT2mMGc8xG60rFRvtrQ3NGfGMfUCoFBJq92HXn4c?=
 =?us-ascii?Q?gORsShhrZSatsSaQJuaIezGNaLOxwax4vAF/1N4/k+/xUEDKkhPgA7DSlaGY?=
 =?us-ascii?Q?cA64kZGhiHzON/QUW8/wDNBv3SyVmbmtZ4KY3aokUFtxgKPQmlZGI5Qh/HvH?=
 =?us-ascii?Q?usZpXQjQ3cHak7pTrJ/yOt7lDoqMcg8d4lPZn37xERWRmw22B+L1wDX/vCmh?=
 =?us-ascii?Q?nS7V06/RdtzOjXq21mqrwg589PXi9asbGqF/sD7CMyEukXh1R8wvRD9yyQAp?=
 =?us-ascii?Q?bNQNk1lC53ooLj5jqxQU/gSlEAg7tbC2wywllwykVzgOQL08lp3xblBy8Tpv?=
 =?us-ascii?Q?Di0Crj8CacZ16+Q2vW0weN+sOmSqwNw4d6I0JjIYpXrArnaDsR6FCV//FfRF?=
 =?us-ascii?Q?CBovn5yL5E9U/1ETaWCGWDcuEN8rXg0PqaJaW20qhyT3kcjBpAgbeGLlT91q?=
 =?us-ascii?Q?+OuCXocqvv11m1CDO/YNvPMobH8mOFZ/gxQYffeZtFquctooIJL4CRSJ3ZHk?=
 =?us-ascii?Q?06kgWudq1FWvmETzwXs6fJXj+6c+qBgFuxRV/AcQtU3mOwhajG/R51ct29V9?=
 =?us-ascii?Q?GM+SO3PklKgM6Z3elGslFw6XZqL/ejuv6gT5vigSVNLagb3AkR4bisQegMHj?=
 =?us-ascii?Q?FbNCEp1AvlrptRMYu7zAzDMQ9kSgmi3K1y+NHkNhUYvgMAjjwhiXMSfRl7DC?=
 =?us-ascii?Q?AK7FESegJ1rgffTy8olAAeyGrRj8t2kEP0GJxVEQzYLyrqXqvU1sqXc+c7lo?=
 =?us-ascii?Q?6A7IqFv5lFpF6/vavOGCRn5OOsQaajx+iqBsc1AOISWFyHVNpA48ELAmvsX4?=
 =?us-ascii?Q?HcvNPhmSfdYLZi6+o7VMBDA/isN1bWzOiMxwcMi1hXvO1/OAf11eq0c1akMm?=
 =?us-ascii?Q?6gJ2kTe1bww+x5sY+ZP2PA6EHe1k2eTfq7IhkYR1QTMgOTxWGt9BR1OO1Ser?=
 =?us-ascii?Q?hXvuOojWA2i2H6WpiPn44sCv1+mssBpEC4piZ8UUOyQagt2DsMW5Qoj7Xq55?=
 =?us-ascii?Q?4xgBa4jwkaeNnnEPHDURndNc0XTAdktb4v/+x5Ld/K5g5qVwj+fhVkHLfxZ+?=
 =?us-ascii?Q?UK2s1CXtj6tJ6nbzr4AtPWBhA2YVkBDfVGH+pktBsbJ7HG9FpSFM4mr+bR/7?=
 =?us-ascii?Q?D1Z2BSCj2Ziv2yqTOSchVcI7EZvU2/2GVYPwdlY7Mhd0xxu8BsQG76LHoGC9?=
 =?us-ascii?Q?RY0nvtj4Y5/GQBwj9KKe9v5QyCfbj9Rqfv5uI42xKCMbJG53JgOZT0d0WwEu?=
 =?us-ascii?Q?1eKHtwrJxNYCR9hbhqgXMIhNTDZNePUYTjEab/kTT/bZAls1UlkZ29IThmLu?=
 =?us-ascii?Q?o40t+sXU+fYnlYqF1aydR7WVZLsx6PI8auGrmAX8PYh/gOGRSliUCv2rwvOG?=
 =?us-ascii?Q?qirhSTW83A1vWtKKZ+OQLWRyy2Vm3xkEf2XWk2nS6quUUACDoCSuRl5EERJ0?=
 =?us-ascii?Q?UAU/grq2l9i2I6+4h8whtrbl9M8fL18CuwifuQQDnLSrJ/o7oUH35YdZbHdR?=
 =?us-ascii?Q?RsclQekV/Wep3eugTjY/HAyszBNqENYW51xzrtg+ZEVwhO53FSTwSg/40aI/?=
 =?us-ascii?Q?BBGshXfPsX6LN7fctKC1qzlCeFxa23nNr4p0oBsn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c8cae4-39a0-4cda-be6f-08dc2b7bd9fb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 03:36:52.6245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ECC0Zq86yr3SOsT704v3DQUjjppTLPklBQBPpviWuaYsARUMxF5QRfoDL/TZZQmUEzr/xgwWeV9D6f3kvulmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8157
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

Hi Tony,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.8-rc3 next-20240209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Lindgren/dt-bindings-display-bridge-tc358775-make-stby-gpio-optional/20240211-180213
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240211095144.2589-4-tony%40atomide.com
patch subject: [PATCH v3 03/10] dt-bindings: display: bridge: tc358775: Add support for tc358765
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240212/202402120510.uIBwAZkI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402120510.uIBwAZkI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml:87:8: [error] empty value in block mapping (empty-values)
--
>> Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml: allOf:0:if: None is not of type 'object', 'boolean'
   	from schema $id: http://json-schema.org/draft-07/schema#
>> Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml: allOf:0:then: 'anyOf' conditional failed, one must be fixed:
   	'stby-gpios' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
   	'type' was expected
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
--
>> Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml: ignoring, error in schema: allOf: 0: if

vim +87 Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml

8b0d47e879b8fe Vinay Simha BN      2020-07-10    1  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
8b0d47e879b8fe Vinay Simha BN      2020-07-10    2  %YAML 1.2
8b0d47e879b8fe Vinay Simha BN      2020-07-10    3  ---
8b0d47e879b8fe Vinay Simha BN      2020-07-10    4  $id: http://devicetree.org/schemas/display/bridge/toshiba,tc358775.yaml#
8b0d47e879b8fe Vinay Simha BN      2020-07-10    5  $schema: http://devicetree.org/meta-schemas/core.yaml#
8b0d47e879b8fe Vinay Simha BN      2020-07-10    6  
84e85359f4999a Krzysztof Kozlowski 2022-12-16    7  title: Toshiba TC358775 DSI to LVDS bridge
8b0d47e879b8fe Vinay Simha BN      2020-07-10    8  
8b0d47e879b8fe Vinay Simha BN      2020-07-10    9  maintainers:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   10    - Vinay Simha BN <simhavcs@gmail.com>
8b0d47e879b8fe Vinay Simha BN      2020-07-10   11  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   12  description: |
6b27cbab742a1a Tony Lindgren       2024-02-11   13    This binding supports DSI to LVDS bridges TC358765 and TC358775
8b0d47e879b8fe Vinay Simha BN      2020-07-10   14  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   15    MIPI DSI-RX Data 4-lane, CLK 1-lane with data rates up to 800 Mbps/lane.
8b0d47e879b8fe Vinay Simha BN      2020-07-10   16    Video frame size:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   17    Up to 1600x1200 24-bit/pixel resolution for single-link LVDS display panel
8b0d47e879b8fe Vinay Simha BN      2020-07-10   18    limited by 135 MHz LVDS speed
8b0d47e879b8fe Vinay Simha BN      2020-07-10   19    Up to WUXGA (1920x1200 24-bit pixels) resolution for dual-link LVDS display
8b0d47e879b8fe Vinay Simha BN      2020-07-10   20    panel, limited by 270 MHz LVDS speed.
8b0d47e879b8fe Vinay Simha BN      2020-07-10   21  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   22  properties:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   23    compatible:
6b27cbab742a1a Tony Lindgren       2024-02-11   24      enum:
6b27cbab742a1a Tony Lindgren       2024-02-11   25        - toshiba,tc358765
6b27cbab742a1a Tony Lindgren       2024-02-11   26        - toshiba,tc358775
8b0d47e879b8fe Vinay Simha BN      2020-07-10   27  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   28    reg:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   29      maxItems: 1
8b0d47e879b8fe Vinay Simha BN      2020-07-10   30      description: i2c address of the bridge, 0x0f
8b0d47e879b8fe Vinay Simha BN      2020-07-10   31  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   32    vdd-supply:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   33      description: 1.2V LVDS Power Supply
8b0d47e879b8fe Vinay Simha BN      2020-07-10   34  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   35    vddio-supply:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   36      description: 1.8V IO Power Supply
8b0d47e879b8fe Vinay Simha BN      2020-07-10   37  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   38    stby-gpios:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   39      maxItems: 1
8b0d47e879b8fe Vinay Simha BN      2020-07-10   40      description: Standby pin, Low active
8b0d47e879b8fe Vinay Simha BN      2020-07-10   41  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   42    reset-gpios:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   43      maxItems: 1
8b0d47e879b8fe Vinay Simha BN      2020-07-10   44      description: Hardware reset, Low active
8b0d47e879b8fe Vinay Simha BN      2020-07-10   45  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   46    ports:
b67554232307e7 Rob Herring         2021-01-04   47      $ref: /schemas/graph.yaml#/properties/ports
8b0d47e879b8fe Vinay Simha BN      2020-07-10   48  
b67554232307e7 Rob Herring         2021-01-04   49      properties:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   50        port@0:
9a017bf40a32e5 Tony Lindgren       2024-02-11   51          $ref: /schemas/graph.yaml#/$defs/port-base
9a017bf40a32e5 Tony Lindgren       2024-02-11   52          unevaluatedProperties: false
8b0d47e879b8fe Vinay Simha BN      2020-07-10   53          description: |
8b0d47e879b8fe Vinay Simha BN      2020-07-10   54            DSI Input. The remote endpoint phandle should be a
8b0d47e879b8fe Vinay Simha BN      2020-07-10   55            reference to a valid mipi_dsi_host device node.
8b0d47e879b8fe Vinay Simha BN      2020-07-10   56  
9a017bf40a32e5 Tony Lindgren       2024-02-11   57          properties:
9a017bf40a32e5 Tony Lindgren       2024-02-11   58            endpoint:
9a017bf40a32e5 Tony Lindgren       2024-02-11   59              $ref: /schemas/media/video-interfaces.yaml#
9a017bf40a32e5 Tony Lindgren       2024-02-11   60              unevaluatedProperties: false
9a017bf40a32e5 Tony Lindgren       2024-02-11   61  
9a017bf40a32e5 Tony Lindgren       2024-02-11   62              properties:
9a017bf40a32e5 Tony Lindgren       2024-02-11   63                data-lanes:
9a017bf40a32e5 Tony Lindgren       2024-02-11   64                  description: array of physical DSI data lane indexes.
9a017bf40a32e5 Tony Lindgren       2024-02-11   65                  minItems: 1
9a017bf40a32e5 Tony Lindgren       2024-02-11   66                  items:
9a017bf40a32e5 Tony Lindgren       2024-02-11   67                    - const: 1
9a017bf40a32e5 Tony Lindgren       2024-02-11   68                    - const: 2
9a017bf40a32e5 Tony Lindgren       2024-02-11   69                    - const: 3
9a017bf40a32e5 Tony Lindgren       2024-02-11   70                    - const: 4
9a017bf40a32e5 Tony Lindgren       2024-02-11   71  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   72        port@1:
b67554232307e7 Rob Herring         2021-01-04   73          $ref: /schemas/graph.yaml#/properties/port
8b0d47e879b8fe Vinay Simha BN      2020-07-10   74          description: |
8b0d47e879b8fe Vinay Simha BN      2020-07-10   75            Video port for LVDS output (panel or connector).
8b0d47e879b8fe Vinay Simha BN      2020-07-10   76  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   77        port@2:
b67554232307e7 Rob Herring         2021-01-04   78          $ref: /schemas/graph.yaml#/properties/port
8b0d47e879b8fe Vinay Simha BN      2020-07-10   79          description: |
8b0d47e879b8fe Vinay Simha BN      2020-07-10   80            Video port for Dual link LVDS output (panel or connector).
8b0d47e879b8fe Vinay Simha BN      2020-07-10   81  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   82      required:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   83        - port@0
8b0d47e879b8fe Vinay Simha BN      2020-07-10   84        - port@1
8b0d47e879b8fe Vinay Simha BN      2020-07-10   85  
6b27cbab742a1a Tony Lindgren       2024-02-11   86  allOf:
6b27cbab742a1a Tony Lindgren       2024-02-11  @87    - if:
6b27cbab742a1a Tony Lindgren       2024-02-11   88      properties:
6b27cbab742a1a Tony Lindgren       2024-02-11   89        compatible:
6b27cbab742a1a Tony Lindgren       2024-02-11   90          contains:
6b27cbab742a1a Tony Lindgren       2024-02-11   91            const: toshiba,tc358765
6b27cbab742a1a Tony Lindgren       2024-02-11   92      then:
6b27cbab742a1a Tony Lindgren       2024-02-11   93        stby-gpios: false
6b27cbab742a1a Tony Lindgren       2024-02-11   94  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   95  required:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   96    - compatible
8b0d47e879b8fe Vinay Simha BN      2020-07-10   97    - reg
8b0d47e879b8fe Vinay Simha BN      2020-07-10   98    - vdd-supply
8b0d47e879b8fe Vinay Simha BN      2020-07-10   99    - vddio-supply
8b0d47e879b8fe Vinay Simha BN      2020-07-10  100    - reset-gpios
8b0d47e879b8fe Vinay Simha BN      2020-07-10  101    - ports
8b0d47e879b8fe Vinay Simha BN      2020-07-10  102  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46598B12626
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 23:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356ED10E458;
	Fri, 25 Jul 2025 21:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YrTw9cke";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A22A10E458;
 Fri, 25 Jul 2025 21:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753479552; x=1785015552;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HzHgQ3P+6EMCfUFLLaXUAVDXYss6Y1fOozOyeGR+4vE=;
 b=YrTw9ckefNW45snnaUL64pgP7GDBSoR9OPmrtrRWy8jcT9zdoE1IQ7cQ
 sqEJtrrEVp70ICQnTwib6EEE2OXdMY9CrFSZNFEwXVP227Juy2Gknlvsu
 Gjx/SIRUJ4npSGrqsJsPzvtXjreOGL/wwp/cy0EwIqPR7srkwY+tmZm4p
 bAqpu1sVa9+PKbqcLOZoVkKvtaOTospZDMWCyfQNo8JUA7hVcnK6bHNcI
 +FYhU6LNG56/BHmSYED39vgVug9SVz4LwpygkjU9cWMX9AuVghqfwa+X5
 RHu5yaZDJ0q0JFm2u6qkYHpS0iWkt2+rFltQBM2P8PlO17L90gVxpFnHE A==;
X-CSE-ConnectionGUID: zjFgV6cBQJCwrjmvtfpBcQ==
X-CSE-MsgGUID: jFu0YkKlRaip4YIfl0X6Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55970340"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55970340"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 14:39:07 -0700
X-CSE-ConnectionGUID: T6yv4N6bSwC8ws11WqGGsQ==
X-CSE-MsgGUID: UEQOP5UkTyeGZuE/PdfVRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161520183"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 14:39:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 14:39:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 14:39:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.49)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 25 Jul 2025 14:39:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMa0We1cz8xFjdLRCBPnoSXS9uj/RSp5/TbNejozXMmo1FoTuQUgLeNKAG8euzUx9s43PpX7lWutUD3Ae1zUr3+dEqguBdbJnprDA2oqXOqFW+w5ocmbemeNmmJobtViGCdrhohsa65ug91mWrHt7K1iSSaL4T9QUv8/2gDDJCwSkqOUkBQJkfl/c0Rm9C2sb01xbQCu6pZqfByp9Kq2Vr5b8qnQu2HyUdpd4kqcCfYSB+pRozFnYkBoPSaNtFGlpFGCUnizbhU/0X/1RynhanyqXY63OsXP91TDc3ER1QBUtwyuPRogA4TXBkJOkPD7mWvx03PNx8twvQuG0lY7Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifJ2EGzg2WT7JMliOI72+mx2Vc5nDZBhbqOGLfTnb5U=;
 b=N6dz3PhEKndB14S/SfX3aDgp6vSsShn2AXF+Wmi/2wEfjnIjfS+Fkxto/ZSYpz7/cHEX3+tEFldBgzh5hwFkySRyd+TTRIEsrYSobJ7fwq6C9opxOb0rJmqZBedPY6uUOdqDmmXrtkbWsk7wqQnpeyiHEC84ww4aLt+0+uu1HHT6GUvEoGAb2SvlbTaiDsFqFaeq3m8/U4HD0UN02sZWEQJwn028kR2dibYZRZPJf72E29AJTH2GLQPtDuphRKmhDQsdnm7SDJMtKsbPbQujWVy4hJfky1y/KBwssoPRRjGeFrx39e3Ez81DOz4SsjdmbKglnVPxIHQ7b2qK6uNR6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7772.namprd11.prod.outlook.com (2603:10b6:610:120::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 21:39:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 21:39:04 +0000
Date: Fri, 25 Jul 2025 18:38:51 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <gregkh@linuxfoundation.org>,
 <daniele.ceraolospurio@intel.com>, <anshuman.gupta@intel.com>,
 <alexander.usyskin@intel.com>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH 3/9] drm/xe/xe_late_bind_fw: Introducing xe_late_bind_fw
Message-ID: <6edjvu7hnzq7rzmr4dybfxderiwfozlvdbptho2z7sgkhy5eka@jndenohiutrc>
References: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
 <20250710150831.3018674-14-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250710150831.3018674-14-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BY5PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: 60c6804e-14f3-4640-1c68-08ddcbc3acfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?t9DjNps3ieg6h7MTUPk0AoElb0TGU4/hx8VMt7IS8qv8EJXyeIoemW5+kX?=
 =?iso-8859-1?Q?VxeffhzvNv2G9TdT+rUMvZemekFU1FJr+xiu0fxJha0AavVYmLRpvO0+k4?=
 =?iso-8859-1?Q?/uz1WkmTzfYHDJnJaPGbq0TBa4MU6FAdzFS3Bxx12acU8pYdmsaFWYMtfZ?=
 =?iso-8859-1?Q?kx3uR59huxHdeCcNPdGrFdTq9/i/VHVISiY1lmOenes6TsbgPWf6tNQC7D?=
 =?iso-8859-1?Q?dNVO04AoH1dVbmic38qCKnUTu6Hc0+gD61DsN/7DKkp+fouYcGD181DI/C?=
 =?iso-8859-1?Q?gMYH6uMHWdFWRv4l3QeNMQr2cEM+QU7mCihPTCBDG+gYzGVvyZQT1ZyCtW?=
 =?iso-8859-1?Q?LbD5jceSGB+FOyDoqk7kyhye1fCWYlp50xvqyyrGYawvz/oCHyHYoNg4gU?=
 =?iso-8859-1?Q?LVq3p7hkSeJjOaIl9I7BT956qc/PONQ9S/OM8sKIZCF3Oh2nLEp/3cb06p?=
 =?iso-8859-1?Q?L0p0EXkWxukYKOeexnYyKUfsiFzyiG9Q6jZq/H9gjYa6DvlvGjKBqecvIY?=
 =?iso-8859-1?Q?godK6XBnpsWwEHDHKbh1gHyQPUolUcJ0KTTe+OD23jHB+2qPES9o4RSxOU?=
 =?iso-8859-1?Q?OKQKXueWHB321tRcmRzYr+5HiQ4eUgqRvh3M/40Qz7pFN7Laki1ijmNrEj?=
 =?iso-8859-1?Q?ZGrxJ0Ge/65ZKxjCB9QuvjV7nZ3zA2jCDt2S73PCsFAVTNw18i5j8RXthB?=
 =?iso-8859-1?Q?vUTnp5VhxP+1ECkZLEhOhxxzcyv/jLI0rch/x+YXnzXDfOWjAxYZ+nHHMV?=
 =?iso-8859-1?Q?A0m1LD0RzMJO+gvzY0HIxUYartV/aimc53oGRQgYiBslMs5BrBdG5ZlRiX?=
 =?iso-8859-1?Q?Z/jhFUtKDnxUucO/gYd7kNRIJ1RxWHSb/YFdgdLHL3NiT3Tk96/GVcxWOM?=
 =?iso-8859-1?Q?wtrWa68EoYDd93DXVQGV8ibYNHqsdp+tiF7npD8drqxOh07MlaVlTAbIqf?=
 =?iso-8859-1?Q?3H4Y0qCuCbgpxcyBt1gFRrDvErJTiONEgsDHnIyes450D3nFhMnuQqYt4A?=
 =?iso-8859-1?Q?zMU2rVSWwrJ+X/7pBnTr01JADoKPq+yvxS5ezz/a6mCA0/0+BCditMKD7M?=
 =?iso-8859-1?Q?LgH6hfnIyLpLEoFgRg1Vdb87idGO+ylk4orFEAtCuVfeX8cTU8ns5g1+Iw?=
 =?iso-8859-1?Q?+VuYC8or4MXGZmqF7MoQFf/k3bupBPCHyvqftEP/+LI3njlL1tAwWqrh4Y?=
 =?iso-8859-1?Q?V+JEZWYcMC/EQzqGIs0GdwflxsXROTtbohqvQQN+OeH0+MxTDTSMuFnFGL?=
 =?iso-8859-1?Q?Wm6r//P3oCErRRfF9++y5N4BK/lrHR/mS2FJXgcyBUhipUyqVfPz9b5uYh?=
 =?iso-8859-1?Q?Aowitz87Tf1QXP6TJAKGdc9W3drRB4Gw5kEzG++zppOP4YvNVhCJyKU09l?=
 =?iso-8859-1?Q?VJcsIClrl3DwiHPnZ66Uo+DNVKcET64l5m/IEOyxNg6TR9+YZeM/Oti6Ps?=
 =?iso-8859-1?Q?kxAefqvoYnOg0yTmb7HvoZpJgTxXOJxB3dNZRP1zUcqN15sSDcFJNqsruV?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gsV+UtFuy+zQVHYK5Mm5RfILp+UweqodJlTFS5ZwoLS56peIFr7zproY4+?=
 =?iso-8859-1?Q?xtRB/yx9g2KL+soBDAYSUk45Wy3OIZzhSlAijVn1dgzRXkj+pTa/RzB32B?=
 =?iso-8859-1?Q?CfyyiLCeOHDeLHRwVfxkZrKfhLTpvdTQS6hnUwgeRVF3MqCw6xC6ZEj1FL?=
 =?iso-8859-1?Q?kbc9dXp/3Q3u+i3lJ9/ABnRBSsiZYz/T/lQekonUTL0KYHg9GTbwPaZA5+?=
 =?iso-8859-1?Q?7vfaiaLvYewaDHIdL2MVYk8a9Ifb67BR8Du15loS3N/t8SaubtQEJkXIW6?=
 =?iso-8859-1?Q?x0qXVkg2kfqZi8F464BMEXZE3nezEoNctghMwNxIA23nCQvt13ww78QkaS?=
 =?iso-8859-1?Q?W6iL8Z6ZzwzlqyusPgYLC+8/lW1GEzlBvlpWEE7+ju/WEbG+1gcXVIptMx?=
 =?iso-8859-1?Q?AYJMfQPeJqvn1l83dUl5h/aAyy1Qaiu6oNYWU97XU+KVOkkyXoL5OFVmhP?=
 =?iso-8859-1?Q?OGEkxliOg62TBWT7qp1EnGx/5OjXTJRK/Vhq6+5tZrnmG8E8rvasI3xZtv?=
 =?iso-8859-1?Q?9MIyFadS0CrrNJwJM2tM5ICn/72bN6YI2ZV0xMCiNSP3dr1P0R8xQeZVhs?=
 =?iso-8859-1?Q?cBbTztQnjYzT/sjuRCt5cQLX9OGFTtqthoJMUnc3NxWk1Nlsd480L2zR9i?=
 =?iso-8859-1?Q?Ipub3SQnBuu/bINXqChKBpq++65h48X2hqnjx1WwhWaVayUt5VeY+7ZqtW?=
 =?iso-8859-1?Q?elrrdp7nK3U6qxdBEFgTOegngxuXnw7CdMVrjeCIuQp+ovcongG5+m1yii?=
 =?iso-8859-1?Q?UXEa2s15c6fbHUdPS0iieZ4VOjdJ/2QuXLZsvPH37QsNKNAZx3FXXiPnLH?=
 =?iso-8859-1?Q?pZVndhnt4MoPdWWqVhwNAtpOmBj3M2UXKSxxEYunYn+rKVUeogWJS9ZQHA?=
 =?iso-8859-1?Q?KdUOzFc5eEC5X9MoviCedboil6koTz8PHnTls5nlOpgaNWyZgCx7aG87Oh?=
 =?iso-8859-1?Q?OWTjE2hzzSvr/U0coHErY33Te7Oxmg1je6jMZPQo/eXHs3oHLVb/7nQHRF?=
 =?iso-8859-1?Q?iW/go2OzYUW8MFjPaJarxiAuX9H0quLyQqtc3u5nX989/DSSlR1aSRlqZz?=
 =?iso-8859-1?Q?cRAnft1yEiwoZW2CQKfxZFuM9i0xyD+30u2aNWHXzj9226i4FPjKFDU5M9?=
 =?iso-8859-1?Q?NRTGbtD/lprqHaTGNzaPDRJrTpRfo02SzSNadVO1EbAnl5JkmQPCB2060K?=
 =?iso-8859-1?Q?2g4IZO6+LY+5nNdAI8m8HvsyBa4b7VasrQGM26XkKNqb7kPwYIhWdCv5xj?=
 =?iso-8859-1?Q?pvrPcvByv0Zq6BL+bdyXGjflGvGoW3VsFm0oKB7ITrFzLWsquw7q8T4m1Y?=
 =?iso-8859-1?Q?XlvHBdPe9gNLQge8fOguDw/Fpae5u71SjbSBnmJsqa9BhO4RgAhlHCaHdm?=
 =?iso-8859-1?Q?wtUvvR/mwIokZ4joOHwAKxKxCoB2UKHuDOjyr4isPN88Lq8SOZBEdekpmA?=
 =?iso-8859-1?Q?hka87zobIdlpUWmvdd3nrV0lbqbHZ+BGrPHHbUG0zloIffI2M/gte4RhU2?=
 =?iso-8859-1?Q?C95HSwG83V4sO6Pg5mruEGMZkEZ1f2YBl6lzsdwWOQd0RvsTnAtaPoQGvt?=
 =?iso-8859-1?Q?rMW8c7xta5/OvEbYnHtyMlngfRhAULPz2ORZEx4jaYp7zrpL3vWzh8fgCW?=
 =?iso-8859-1?Q?YvZ/A9lzzFW+lFfit9idcUrHkoJ64nPMa1U5MWisgs8nHT2tdm//YhIA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c6804e-14f3-4640-1c68-08ddcbc3acfa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 21:39:04.2940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7Px/x1yQNoG3yUO18pooEtazNVa40QtqbVnoS11bau23BpwICQfhaTa5RjzT2UBXymMvBnhY7iWs8QRWy4SoJsRcrgwQSeViMJdfvPxcf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7772
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

On Thu, Jul 10, 2025 at 11:08:34AM -0400, Rodrigo Vivi wrote:
>From: Badal Nilawar <badal.nilawar@intel.com>
>
>Introducing xe_late_bind_fw to enable firmware loading for the devices,

here and in the subject: no gerund, please.

>such as the fan controller, during the driver probe. Typically,
>firmware for such devices are part of IFWI flash image but can be
>replaced at probe after OEM tuning.
>This patch binds mei late binding component to enable firmware loading.
>
>v2:
> - Add devm_add_action_or_reset to remove the component (Daniele)
> - Add INTEL_MEI_GSC check in xe_late_bind_init() (Daniele)
>v3:
> - Fail driver probe if late bind initialization fails,
>   add has_late_bind flag (Daniele)
>v4:
> - %S/I915_COMPONENT_LATE_BIND/INTEL_COMPONENT_LATE_BIND/
>v6:
> - rebased
>
>Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/Makefile                |  1 +
> drivers/gpu/drm/xe/xe_device.c             |  5 ++
> drivers/gpu/drm/xe/xe_device_types.h       |  6 ++
> drivers/gpu/drm/xe/xe_late_bind_fw.c       | 84 ++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_late_bind_fw.h       | 15 ++++
> drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 33 +++++++++
> drivers/gpu/drm/xe/xe_pci.c                |  2 +
> drivers/gpu/drm/xe/xe_pci_types.h          |  1 +
> 8 files changed, 147 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
> create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
> create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 1d97e5b63f4e..97e2b1368a6e 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -76,6 +76,7 @@ xe-y += xe_bb.o \
> 	xe_hw_fence.o \
> 	xe_irq.o \
> 	xe_lrc.o \
>+	xe_late_bind_fw.o \

almost there, but still not sorted as it should be

> 	xe_migrate.o \
> 	xe_mmio.o \
> 	xe_mocs.o \
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 0b73cb72bad1..cb595bae5f55 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -44,6 +44,7 @@
> #include "xe_hw_engine_group.h"
> #include "xe_hwmon.h"
> #include "xe_irq.h"
>+#include "xe_late_bind_fw.h"
> #include "xe_mmio.h"
> #include "xe_module.h"
> #include "xe_nvm.h"
>@@ -866,6 +867,10 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		return err;
>
>+	err = xe_late_bind_init(&xe->late_bind);
>+	if (err && err != -ENODEV)

let's not be creative in xe_device_probe(). Boring is good.

All the other parts in this function handle ENODEV internally. It's up
to them to decide if ENODEV -> return 0, not here.


>+		return err;
>+
> 	err = xe_oa_init(xe);
> 	if (err)
> 		return err;
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 78c4acafd268..a8891833f980 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -16,6 +16,7 @@
> #include "xe_devcoredump_types.h"
> #include "xe_heci_gsc.h"
> #include "xe_lmtt_types.h"
>+#include "xe_late_bind_fw_types.h"

should be sorted

> #include "xe_memirq_types.h"
> #include "xe_oa_types.h"
> #include "xe_platform_types.h"
>@@ -325,6 +326,8 @@ struct xe_device {
> 		u8 has_heci_cscfi:1;
> 		/** @info.has_heci_gscfi: device has heci gscfi */
> 		u8 has_heci_gscfi:1;
>+		/** @info.has_late_bind: Device has firmware late binding support */
>+		u8 has_late_bind:1;
> 		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
> 		u8 has_llc:1;
> 		/** @info.has_mbx_power_limits: Device has support to manage power limits using
>@@ -557,6 +560,9 @@ struct xe_device {
> 	/** @nvm: discrete graphics non-volatile memory */
> 	struct intel_dg_nvm_dev *nvm;
>
>+	/** @late_bind: xe mei late bind interface */
>+	struct xe_late_bind late_bind;
>+
> 	/** @oa: oa observation subsystem */
> 	struct xe_oa oa;
>
>diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>new file mode 100644
>index 000000000000..152f3e58de94
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>@@ -0,0 +1,84 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#include <linux/component.h>
>+#include <linux/delay.h>
>+
>+#include <drm/drm_managed.h>
>+#include <drm/intel/i915_component.h>
>+#include <drm/intel/intel_lb_mei_interface.h>
>+#include <drm/drm_print.h>
>+
>+#include "xe_device.h"
>+#include "xe_late_bind_fw.h"
>+
>+static struct xe_device *
>+late_bind_to_xe(struct xe_late_bind *late_bind)
>+{
>+	return container_of(late_bind, struct xe_device, late_bind);
>+}
>+
>+static int xe_late_bind_component_bind(struct device *xe_kdev,
>+				       struct device *mei_kdev, void *data)
>+{
>+	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
>+	struct xe_late_bind *late_bind = &xe->late_bind;
>+
>+	late_bind->component.ops = data;
>+	late_bind->component.mei_dev = mei_kdev;
>+
>+	return 0;
>+}
>+
>+static void xe_late_bind_component_unbind(struct device *xe_kdev,
>+					  struct device *mei_kdev, void *data)
>+{
>+	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
>+	struct xe_late_bind *late_bind = &xe->late_bind;
>+
>+	late_bind->component.ops = NULL;
>+}
>+
>+static const struct component_ops xe_late_bind_component_ops = {
>+	.bind   = xe_late_bind_component_bind,
>+	.unbind = xe_late_bind_component_unbind,
>+};
>+
>+static void xe_late_bind_remove(void *arg)
>+{
>+	struct xe_late_bind *late_bind = arg;
>+	struct xe_device *xe = late_bind_to_xe(late_bind);
>+
>+	component_del(xe->drm.dev, &xe_late_bind_component_ops);
>+}
>+
>+/**
>+ * xe_late_bind_init() - add xe mei late binding component
>+ * @late_bind: pointer to late bind structure.
>+ *
>+ * Return: 0 if the initialization was successful, a negative errno otherwise.
>+ */
>+int xe_late_bind_init(struct xe_late_bind *late_bind)
>+{
>+	struct xe_device *xe = late_bind_to_xe(late_bind);
>+	int err;
>+
>+	if (!xe->info.has_late_bind)
>+		return 0;
>+
>+	if (!IS_ENABLED(CONFIG_INTEL_MEI_LATE_BIND) || !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
>+		drm_info(&xe->drm, "Can't init xe mei late bind missing mei component\n");
>+		return -ENODEV;
>+	}
>+
>+	err = component_add_typed(xe->drm.dev, &xe_late_bind_component_ops,
>+				  INTEL_COMPONENT_LB);
>+	if (err < 0) {
>+		drm_info(&xe->drm, "Failed to add mei late bind component (%pe)\n", ERR_PTR(err));
>+		return err;

if you are going to return an error to stop the probe, then make this a
drm_err()

>+	}
>+
>+	return devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>new file mode 100644
>index 000000000000..4c73571c3e62
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>@@ -0,0 +1,15 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef _XE_LATE_BIND_FW_H_
>+#define _XE_LATE_BIND_FW_H_
>+
>+#include <linux/types.h>
>+
>+struct xe_late_bind;
>+
>+int xe_late_bind_init(struct xe_late_bind *late_bind);
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>new file mode 100644
>index 000000000000..f79e5aefed94
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>@@ -0,0 +1,33 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef _XE_LATE_BIND_TYPES_H_
>+#define _XE_LATE_BIND_TYPES_H_
>+
>+#include <linux/iosys-map.h>
>+#include <linux/mutex.h>
>+#include <linux/types.h>
>+
>+/**
>+ * struct xe_late_bind_component - Late Binding services component
>+ * @mei_dev: device that provide Late Binding service.
>+ * @ops: Ops implemented by Late Binding driver, used by Xe driver.
>+ *
>+ * Communication between Xe and MEI drivers for Late Binding services
>+ */
>+struct xe_late_bind_component {
>+	struct device *mei_dev;
>+	const struct late_bind_component_ops *ops;
>+};
>+
>+/**
>+ * struct xe_late_bind
>+ */
>+struct xe_late_bind {
>+	/** @component: struct for communication with mei component */
>+	struct xe_late_bind_component component;
>+};
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index ffd6ad569b7c..69b8ead9ca59 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -332,6 +332,7 @@ static const struct xe_device_desc bmg_desc = {
> 	.has_gsc_nvm = 1,
> 	.has_heci_cscfi = 1,
> 	.max_gt_per_tile = 2,
>+	.has_late_bind = true,

again, boring is good: all the has_xxxx flags should be sorted
together.

Lucas De Marchi

> 	.needs_scratch = true,
> };
>
>@@ -578,6 +579,7 @@ static int xe_info_init_early(struct xe_device *xe,
> 	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
> 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
> 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
>+	xe->info.has_late_bind = desc->has_late_bind;
> 	xe->info.has_llc = desc->has_llc;
> 	xe->info.has_pxp = desc->has_pxp;
> 	xe->info.has_sriov = desc->has_sriov;
>diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>index 4de6f69ed975..51a607d323fb 100644
>--- a/drivers/gpu/drm/xe/xe_pci_types.h
>+++ b/drivers/gpu/drm/xe/xe_pci_types.h
>@@ -39,6 +39,7 @@ struct xe_device_desc {
> 	u8 has_gsc_nvm:1;
> 	u8 has_heci_gscfi:1;
> 	u8 has_heci_cscfi:1;
>+	u8 has_late_bind:1;
> 	u8 has_llc:1;
> 	u8 has_mbx_power_limits:1;
> 	u8 has_pxp:1;
>-- 
>2.49.0
>

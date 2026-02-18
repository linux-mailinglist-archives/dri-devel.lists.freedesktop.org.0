Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF1YAJgRlmkXZgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 20:23:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DCC15905E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 20:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00DC10E172;
	Wed, 18 Feb 2026 19:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bq7QTwHQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DB510E172;
 Wed, 18 Feb 2026 19:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771442578; x=1802978578;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MJgmoqHRDonuzppImsbjjrHz0AasiUk3y1LYMrWYKYI=;
 b=Bq7QTwHQQ+hGaBw5CWEyReHAX6g4s4gZyjtV1ktuNcQQd+SyXM9kPYkb
 cKGfanWHbpSTVV/3Iyia+O7DiwK7znFxIWmA393oTgjPPNuqZClrjWDuc
 MhqtwnUP9Ve76kjV3OFbP9OXBY54CR2B4agOXQOep14UzKITQ7Z7SgQbi
 2Nlv2djS3xoroYDztZwiDgDomxDH8+JdMcPm6+d4Rz7fevTSqSKd9Oym6
 wAe3WyReBUodXM5uYfl4kurBfUjiIYdpugQoydCY4B7dB8qDQxrFbuQv6
 bLoUO4Z/C2plNVfvmCFNtGB14cS/qTqtcFZBENZfMaTy6hksCFs+Toye+ w==;
X-CSE-ConnectionGUID: 9gxq2iEwR5ixqvf9gWuwIg==
X-CSE-MsgGUID: lMjY1mNmSKqn6GPJcSZw7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72517685"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="72517685"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 11:22:57 -0800
X-CSE-ConnectionGUID: WDrm/e0lRxOnSKzIzorcXA==
X-CSE-MsgGUID: dKidXl9iRxS7MIVoC4LP8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="213456329"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 11:22:57 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 11:22:56 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 11:22:56 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 11:22:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2CZ49lCbOo0Hl+aS5kVrR9rTXEALom7E8AOz4OZFJWHhJ9U5nP+tQLDVvx7WlVZBHxp/Tezi+hYTGTaES/mHqUHOcN11mu4ZR+e6h0lR0lzlNBcKgFl0g/CuNTJ94bYyMs36g8+jDnUOz/OzDDw6Ozrz9R2/ZaLOZc5m+RfLc31aXHYePWT3wBP0EegQo8G2aOEaKDVQlkMQPoSyG0M6tL1GKqVShRSZFf7yRp03td2cC9gyH9Ph8wZlCL5hQB6kHMvHfF0mAWoQCAvNqfFgGSFA+jkX+rTWyxpjZ8G+L1MOWSG+lED9zbaS+ATLF+Z5RhcGtm+QHjh7ZyOZry29w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzPtqnsNsuAqAWim2V1z9BU35ekQGvE6p+RgctFyDTs=;
 b=ysO54IloKxPHbwcev6f8yaorESACS3Scuqu4IlWR0Hrbnt/oh64qGJECtWgIVlc43veUWlQso+7bH6CloGPJ5QHujen4AFu/LJcUWn6VM3Lv+YmVkFxbvqMnxqF+CbKoY9HVouezgKziZUIE1Gs2oRm5UR8/3iNtAWgRjj5lutEhbWsC1+iXmgsCD/8fmub4e0N92bGtSzVusUAxylsofNVnJ0dmxMnm5b1iekJRA3Mr/BfqOX1Eo8wBMLUskywiXzQqwARh+zkr30PXUDItRVQVyTuP7SS23xXmHNEltqxhPdMP7c66/ftueP0xg+esAmrmBMbwM/ksRRgPC/uF9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 19:22:53 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 19:22:52 +0000
Date: Wed, 18 Feb 2026 14:22:46 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, "Matthieu Baerts
 (NGI0)" <matttbe@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <raag.jadav@intel.com>, Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 "Paolo Abeni" <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH v7 1/5] drm/ras: Introduce the DRM RAS infrastructure
 over generic netlink
Message-ID: <aZYRhpZstuJYeagQ@intel.com>
References: <20260218121904.157295-7-riana.tauro@intel.com>
 <20260218121904.157295-8-riana.tauro@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260218121904.157295-8-riana.tauro@intel.com>
X-ClientProxiedBy: BY3PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:254::25) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: 51a7ebec-247d-4e38-3e4b-08de6f231c5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?stxKo0Dq4e73kKF1VbTqCrzvhWYYgohmZehTVwv3ZCVvLMkLCpOwTT2H/h?=
 =?iso-8859-1?Q?+986/k4KGDaxk9MwhmYdAu07e3/WVgmLoyc8hHEyL65Sf3v1dt5i9NNWoq?=
 =?iso-8859-1?Q?v2cnnRXlNLiZ9vSfwYfidwNZAeAntgWZ3XeDEyuIM/bKvM1GkBOvAsCdfk?=
 =?iso-8859-1?Q?4VQiFgDzZ28+rGqp9CyDR45W2CX2+4lgKdU9PDZ52oCjnQb58xjeTqw2ue?=
 =?iso-8859-1?Q?lqfV9X48s3GvQzj1BWmfMmkah/RN4qYy81gy2WuuDEOQqJ+Z7Oe5Nuf9eR?=
 =?iso-8859-1?Q?e970b3wK0aNRoCMnyl2DUSV3hUpP7yLGDtp0z1H74xiWYdLrM3ckUMNNbw?=
 =?iso-8859-1?Q?CGJo96HKcAWfihv4HjT3haL434hZ7qqSI3mum+xdXSRiSbR3RyNj7hDGLg?=
 =?iso-8859-1?Q?vBunQ/dDBvsXxqHAbMa7xVEevtP3/OW//sOWzbByGllPl8L1D4KXR17UGt?=
 =?iso-8859-1?Q?kv8GuYS78V6ISLgB2NiYN91hyd/H3WYw3Jve+oQolGumbUneV6fR+mTlbh?=
 =?iso-8859-1?Q?NEiefiDS7+6KvqFFcSMm2L1oVs59by2lo6xERKKsU1QzyWdDpX51pu0+V9?=
 =?iso-8859-1?Q?UvRGRlvPHJ8/gXWBrHLCvplABeuPWUaXdZAPqXdz51gq1qAw4P5RwIs7Q9?=
 =?iso-8859-1?Q?AyUL4oazA+mBkBypR8zcETmnBWVLf2p1WY+EKsy6hSyEzc2zZKtUIo6kia?=
 =?iso-8859-1?Q?VE2sq+z/LhPYsNYlmb0nl4lcQeb1w6uuwbxKGLHDOMR3A0B1m1likgYVyl?=
 =?iso-8859-1?Q?6Wb7arzbymHKMBh8l9W1RG9TRx1SQPTXic0UmSzN6WSqbbKjlUnLDkQfzs?=
 =?iso-8859-1?Q?9qzLeXEnish2S494Nvc70Y824LZ+4PmR/o6ixY1JpTS7Z/1F+HatYl5vXL?=
 =?iso-8859-1?Q?DWVeMyC85L/RbwrDZdtxXOYgJFMaX66w+brVI7XKOgcREoHz8gqiePCfF0?=
 =?iso-8859-1?Q?vJGsgIOceGXiV30ubQOkHH5U5ntBsjMvsFn6pIctOYf5luoC29ayAR5Aoe?=
 =?iso-8859-1?Q?d5FDKMGM0gNz8W1rNYJUFkA9j7TMXW56iCXzco/C1f12zN7Nq9s3LHIXj+?=
 =?iso-8859-1?Q?Zb2KMJ/C1dAQ7NKDg4MNk+vKVaTF1frdJ8rTfeEdKpawooqC7cZHecx+SQ?=
 =?iso-8859-1?Q?8ra0jihkMhKX4G+QvaQ/CQFCIbo/M3ggmEguEyPaMn1+CXT3zNufLbGTdq?=
 =?iso-8859-1?Q?dxsTTsENwzxpCr8NzLwg4jXB7Q3YpBDuvAuAuSzN6dRj65ZGLuV45fUtlN?=
 =?iso-8859-1?Q?Tnf+whpWsuFAFZ+S5lefqGBw9Jih1QlNGmowqymuBDd+SCxctPsFeSIeEf?=
 =?iso-8859-1?Q?KyelGzCxaGsOx+UiApWDkPL9qZtunHyk7T+pPaJVZkjUcr/bhONLZ2pR/T?=
 =?iso-8859-1?Q?lFPR6aBSSe5tQ+8wDxIwiNF3vHXYay48DWyE1t5iuFrGX9t5EYUSyfrAv7?=
 =?iso-8859-1?Q?deOgCr4D1RZcW1ufueA5jMw9BrQ46AS8f9Ghyg/rmxmq3dIS8bd2OoxBZA?=
 =?iso-8859-1?Q?X5P4XQkdjhiRVgtke3qE+0bPMf6iPajSKB0KwBFuTgg0iquwZDz1ZS2P0e?=
 =?iso-8859-1?Q?nZEdR9dZ29MEfg1UiknX7LCYl3vAS7wSu9i9sLAjlAb4n/ETX76EAAeRl2?=
 =?iso-8859-1?Q?+W5q7mor+IKD8LcjUmGK8jO22+j7CM1CctwJ3oEBQlFi/Bl6TkWfMRgA?=
 =?iso-8859-1?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dE9t4+a2Z0WjIPIr9nTGNEliWMwFzfbBb55vm4wbKMPmlsUWmFbvyWfu3d?=
 =?iso-8859-1?Q?l7KE2V6I27u6hQFQP+fzR0faNitT3AlwRNEIjoAHOEYPIznRiYA9yje0aE?=
 =?iso-8859-1?Q?H7Y6BwPC0W6GoQ8/fjzcNTnqKXAXprBb3TmxUuh5j8tYsguUm0KYrOe4OF?=
 =?iso-8859-1?Q?3LCaeQf5QWTvlJHYpc+zNhdaZuN08t6MRW+S6qvk1azAFUp+9nJUbgwHWG?=
 =?iso-8859-1?Q?s/n5XyeQE27UOXJWVSzMpemvOt65S/FJylnk5pRpi8EEsoodaGBzEAJGxK?=
 =?iso-8859-1?Q?lJTtSzZt+gAxMHfcEMFAwEOHx2xBex/dYHUrcbW4LTeMPHQfbM3aRFMA7Z?=
 =?iso-8859-1?Q?5qMSO/SUdkpaHkqV5CUOe5kjcsqLtXGBQS40qEaoOt59JeAK1UZVV8K0aa?=
 =?iso-8859-1?Q?8kFE+3QzwGU6YbOOXxd6tnmnINGLKelQoUjFRfvIFtOr0bGgbZuNC4dOer?=
 =?iso-8859-1?Q?AoqrIoyiyRw9ZbzCYi51kv2CPHxXiKYIZfQanooizDOebkoiCoGK2e6R12?=
 =?iso-8859-1?Q?hQsHvSCvq+vzOrl1dywqLc8HF2fC4YXqBZX4HUiWwq6byRhVrPvfkOZ0qC?=
 =?iso-8859-1?Q?7xth/2X1SgH5lMve9SnReT1IGRR4Z6S+QCqCKojrKWSPYRc0vXbp3wa1Vy?=
 =?iso-8859-1?Q?sWhj8urGfqemI87w/fJHAjpu4IctFhmLoBlzAAuQ2tbXXNGW/65B8MV7Lr?=
 =?iso-8859-1?Q?4b/VKwaw0jQyn0pKjpk2sOEmXioeuiZmtm6OqPj7Y4JBM8BZFNFGhDcJja?=
 =?iso-8859-1?Q?XxoqOsTBwcrpHXVenjETDJRrIPiBK0lL2oZMAJqxD/GMgk2vdvOuRwanvW?=
 =?iso-8859-1?Q?rrr7iLIyRXktjbJaxnj3KNHyUWfE4+lYeE5rDHM8R/Y/PWfT065OcZmTxe?=
 =?iso-8859-1?Q?ES78cwgMbFlFWQouQSOsqz4pdPq/hV8fNWvwESe1vZWiJs2V+JSOdwQ/vh?=
 =?iso-8859-1?Q?wxlyLo/PYOuay1HDF8bXEwbsO0yTqVM/tVJvOzQLanYZ3BZKSD6wphienr?=
 =?iso-8859-1?Q?bDnDTOylla0Df9FbG267Vsswtp4WOPKB99CjDfv1b1E6YcA/LNfhdPUldv?=
 =?iso-8859-1?Q?T9FWHYPw0WuFW7YomY2nVwFqEtCSVbGP6nRrmyTQltwWH+N8ftb2rPm5IN?=
 =?iso-8859-1?Q?M/ydSOaThNAC5uBnkEeV/cnoQXxqjaJ0Y30fWKSKoz6vhcCz3FgspevM1E?=
 =?iso-8859-1?Q?P/KPBeYVx3piGiJQhO9FUp36CVYu9z+brVOD8qTDCWsdu/svktxqpj5nAA?=
 =?iso-8859-1?Q?PhUgFE+/1uA1l5snVPM9euaeWj76FGsYe4S95Vc90nHSqvkNpjBHsjjyMt?=
 =?iso-8859-1?Q?5FNugiaNLG3XRgjqCEOnEIvB92LT6szKvTK0+USIDIMuzPOhuZmMl2ehFH?=
 =?iso-8859-1?Q?9r/cMIdJNTNLHlLG4UUn9bKgb8OAshSyTwuJJfchsH+0tqmNXqm3XyJlz0?=
 =?iso-8859-1?Q?gsPs7i+GCLxZkbnxPXypVuGPJF0NE21zhQFjr1VFUD8ttBg4I3a0AciDLu?=
 =?iso-8859-1?Q?PP+e0yGA5Bl+d+i28FOTa9P980Raa+ZBUEEG6qgvyOex5RjExjMQZn89K4?=
 =?iso-8859-1?Q?sERZ0uu/3UDtn6rgZ7ClTPr16kBfZG2+H2OLFlDgzeYPxMInHrQGxR6FdK?=
 =?iso-8859-1?Q?kXh3HR4BW7Muvmf49LgE9JtMHrc80oStIMVy11D5WsUTb/6X7ks+Yw09Qo?=
 =?iso-8859-1?Q?gdjNvek9yA00cUKKT6DLliEkFUZWvEby8UfLL9bcUUP3JQrT/FCFKJrm6g?=
 =?iso-8859-1?Q?VVcoQNSpAJ2t8alFMdPphuwQaqEHDLUczuXZT3cnCh4Bxmzm3AULlTkp7u?=
 =?iso-8859-1?Q?FNVeYLSByw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a7ebec-247d-4e38-3e4b-08de6f231c5d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 19:22:52.8802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcAG0P/pP0Qx4ASTItQwRVC4S9y6VrM6puEFew9CeKsxEHufnyzEVNKT460ikot6cwlAzmywD5uoPFbsdpnosg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8179
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,intel.com:mid,intel.com:dkim,intel.com:email,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FREEMAIL_TO(0.00)[intel.com,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ffwll.ch,gmail.com,oss.qualcomm.com,amd.com,kernel.org,davemloft.net,redhat.com,google.com,vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rodrigo.vivi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 18DCC15905E
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 05:49:03PM +0530, Riana Tauro wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Introduces the DRM RAS infrastructure over generic netlink.
> 
> The new interface allows drivers to expose RAS nodes and their
> associated error counters to userspace in a structured and extensible
> way. Each drm_ras node can register its own set of error counters, which
> are then discoverable and queryable through netlink operations. This
> lays the groundwork for reporting and managing hardware error states
> in a unified manner across different DRM drivers.
> 
> Currently is only supports error-counter nodes. But it can be
> extended later.
> 
> The registration is also no tied to any drm node, so it can be
> used by accel devices as well.
> 
> It uses the new and mandatory YAML description format stored in
> Documentation/netlink/specs/. This forces a single generic netlink
> family namespace for the entire drm: "drm-ras".
> But multiple-endpoints are supported within the single family.
> 
> Any modification to this API needs to be applied to
> Documentation/netlink/specs/drm_ras.yaml before regenerating the
> code:
> 
> $ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
>  Documentation/netlink/specs/drm_ras.yaml --mode uapi --header \
>  > include/uapi/drm/drm_ras.h
> 
> $ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
>  Documentation/netlink/specs/drm_ras.yaml --mode kernel --header \
>  > include/drm/drm_ras_nl.h
> 
> $ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
>  Documentation/netlink/specs/drm_ras.yaml --mode kernel --source \
>  > drivers/gpu/drm/drm_ras_nl.c
> 
> Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
> Cc: Lijo Lazar <lijo.lazar@amd.com>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: netdev@vger.kernel.org
> Co-developed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
> ---
> v2: fix doc and memory leak
>     use xe_for_each_start
>     use standard genlmsg_iput (Jakub Kicinski)
> 
> v3: add documentation to index
>     modify documentation to mention uAPI requirements (Rodrigo)
> 
> v4: fix typo (Zack)
> 
> v5: fix kernel-robot reported htmldocs error
>     fix kernel-robot reported build error on csky arch
> ---
>  Documentation/gpu/drm-ras.rst            | 107 +++++++
>  Documentation/gpu/index.rst              |   1 +
>  Documentation/netlink/specs/drm_ras.yaml | 130 +++++++++

Jakub and/or other networking maintainers, ack to get this merged through drm
branches towards 7.1 cycle (not this, but the next window).

Thanks,
Rodrigo.

>  drivers/gpu/drm/Kconfig                  |  10 +
>  drivers/gpu/drm/Makefile                 |   1 +
>  drivers/gpu/drm/drm_drv.c                |   6 +
>  drivers/gpu/drm/drm_ras.c                | 354 +++++++++++++++++++++++
>  drivers/gpu/drm/drm_ras_genl_family.c    |  42 +++
>  drivers/gpu/drm/drm_ras_nl.c             |  54 ++++
>  include/drm/drm_ras.h                    |  76 +++++
>  include/drm/drm_ras_genl_family.h        |  17 ++
>  include/drm/drm_ras_nl.h                 |  24 ++
>  include/uapi/drm/drm_ras.h               |  49 ++++
>  13 files changed, 871 insertions(+)
>  create mode 100644 Documentation/gpu/drm-ras.rst
>  create mode 100644 Documentation/netlink/specs/drm_ras.yaml
>  create mode 100644 drivers/gpu/drm/drm_ras.c
>  create mode 100644 drivers/gpu/drm/drm_ras_genl_family.c
>  create mode 100644 drivers/gpu/drm/drm_ras_nl.c
>  create mode 100644 include/drm/drm_ras.h
>  create mode 100644 include/drm/drm_ras_genl_family.h
>  create mode 100644 include/drm/drm_ras_nl.h
>  create mode 100644 include/uapi/drm/drm_ras.h
> 
> diff --git a/Documentation/gpu/drm-ras.rst b/Documentation/gpu/drm-ras.rst
> new file mode 100644
> index 000000000000..0b3e1550e378
> --- /dev/null
> +++ b/Documentation/gpu/drm-ras.rst
> @@ -0,0 +1,107 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +============================
> +DRM RAS over Generic Netlink
> +============================
> +
> +The DRM RAS (Reliability, Availability, Serviceability) interface provides a
> +standardized way for GPU/accelerator drivers to expose error counters and
> +other reliability nodes to user space via Generic Netlink. This allows
> +diagnostic tools, monitoring daemons, or test infrastructure to query hardware
> +health in a uniform way across different DRM drivers.
> +
> +Key Goals:
> +
> +* Provide a standardized RAS solution for GPU and accelerator drivers, enabling
> +  data center monitoring and reliability operations.
> +* Implement a single drm-ras Generic Netlink family to meet modern Netlink YAML
> +  specifications and centralize all RAS-related communication in one namespace.
> +* Support a basic error counter interface, addressing the immediate, essential
> +  monitoring needs.
> +* Offer a flexible, future-proof interface that can be extended to support
> +  additional types of RAS data in the future.
> +* Allow multiple nodes per driver, enabling drivers to register separate
> +  nodes for different IP blocks, sub-blocks, or other logical subdivisions
> +  as applicable.
> +
> +Nodes
> +=====
> +
> +Nodes are logical abstractions representing an error source or block within
> +the device. Currently, only error counter nodes is supported.
> +
> +Drivers are responsible for registering and unregistering nodes via the
> +`drm_ras_node_register()` and `drm_ras_node_unregister()` APIs.
> +
> +Node Management
> +-------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_ras.c
> +   :doc: DRM RAS Node Management
> +.. kernel-doc:: drivers/gpu/drm/drm_ras.c
> +   :internal:
> +
> +Generic Netlink Usage
> +=====================
> +
> +The interface is implemented as a Generic Netlink family named ``drm-ras``.
> +User space tools can:
> +
> +* List registered nodes with the ``get-nodes`` command.
> +* List all error counters in an node with the ``get-error-counters`` command.
> +* Query error counters using the ``query-error-counter`` command.
> +
> +YAML-based Interface
> +--------------------
> +
> +The interface is described in a YAML specification ``Documentation/netlink/specs/drm_ras.yaml``
> +
> +This YAML is used to auto-generate user space bindings via
> +``tools/net/ynl/pyynl/ynl_gen_c.py``, and drives the structure of netlink
> +attributes and operations.
> +
> +Usage Notes
> +-----------
> +
> +* User space must first enumerate nodes to obtain their IDs.
> +* Node IDs or Node names can be used for all further queries, such as error counters.
> +* Error counters can be queried by either the Error ID or Error name.
> +* Query Parameters should be defined as part of the uAPI to ensure user interface stability.
> +* The interface supports future extension by adding new node types and
> +  additional attributes.
> +
> +Example: List nodes using ynl
> +
> +.. code-block:: bash
> +
> +    sudo ynl --family drm_ras  --dump list-nodes
> +    [{'device-name': '0000:03:00.0',
> +    'node-id': 0,
> +    'node-name': 'correctable-errors',
> +    'node-type': 'error-counter'},
> +    {'device-name': '0000:03:00.0',
> +     'node-id': 1,
> +    'node-name': 'nonfatal-errors',
> +    'node-type': 'error-counter'},
> +    {'device-name': '0000:03:00.0',
> +    'node-id': 2,
> +    'node-name': 'fatal-errors',
> +    'node-type': 'error-counter'}]
> +
> +Example: List all error counters using ynl
> +
> +.. code-block:: bash
> +
> +
> +   sudo ynl --family drm_ras  --dump get-error-counters --json '{"node-id":1}'
> +   [{'error-id': 1, 'error-name': 'error_name_1', 'error-value': 0},
> +   {'error-id': 2, 'error-name': 'error_name_2', 'error-value': 0}]
> +
> +
> +Example: Query an error counter for a given node
> +
> +.. code-block:: bash
> +
> +   sudo ynl --family drm_ras --do query-error-counter  --json '{"node-id":2, "error-id":1}'
> +   {'error-id': 1, 'error-name': 'error_name_1', 'error-value': 0}
> +
> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> index 7dcb15850afd..60c73fdcfeed 100644
> --- a/Documentation/gpu/index.rst
> +++ b/Documentation/gpu/index.rst
> @@ -9,6 +9,7 @@ GPU Driver Developer's Guide
>     drm-mm
>     drm-kms
>     drm-kms-helpers
> +   drm-ras
>     drm-uapi
>     drm-usage-stats
>     driver-uapi
> diff --git a/Documentation/netlink/specs/drm_ras.yaml b/Documentation/netlink/specs/drm_ras.yaml
> new file mode 100644
> index 000000000000..be0e379c5bc9
> --- /dev/null
> +++ b/Documentation/netlink/specs/drm_ras.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
> +---
> +name: drm-ras
> +protocol: genetlink
> +uapi-header: drm/drm_ras.h
> +
> +doc: >-
> +  DRM RAS (Reliability, Availability, Serviceability) over Generic Netlink.
> +  Provides a standardized mechanism for DRM drivers to register "nodes"
> +  representing hardware/software components capable of reporting error counters.
> +  Userspace tools can query the list of nodes or individual error counters
> +  via the Generic Netlink interface.
> +
> +definitions:
> +  -
> +    type: enum
> +    name: node-type
> +    value-start: 1
> +    entries: [error-counter]
> +    doc: >-
> +         Type of the node. Currently, only error-counter nodes are
> +         supported, which expose reliability counters for a hardware/software
> +         component.
> +
> +attribute-sets:
> +  -
> +    name: node-attrs
> +    attributes:
> +      -
> +        name: node-id
> +        type: u32
> +        doc: >-
> +             Unique identifier for the node.
> +             Assigned dynamically by the DRM RAS core upon registration.
> +      -
> +        name: device-name
> +        type: string
> +        doc: >-
> +             Device name chosen by the driver at registration.
> +             Can be a PCI BDF, UUID, or module name if unique.
> +      -
> +        name: node-name
> +        type: string
> +        doc: >-
> +             Node name chosen by the driver at registration.
> +             Can be an IP block name, or any name that identifies the
> +             RAS node inside the device.
> +      -
> +        name: node-type
> +        type: u32
> +        doc: Type of this node, identifying its function.
> +        enum: node-type
> +  -
> +    name: error-counter-attrs
> +    attributes:
> +      -
> +        name: node-id
> +        type: u32
> +        doc:  Node ID targeted by this error counter operation.
> +      -
> +        name: error-id
> +        type: u32
> +        doc: Unique identifier for a specific error counter within an node.
> +      -
> +        name: error-name
> +        type: string
> +        doc: Name of the error.
> +      -
> +        name: error-value
> +        type: u32
> +        doc: Current value of the requested error counter.
> +
> +operations:
> +  list:
> +    -
> +      name: list-nodes
> +      doc: >-
> +           Retrieve the full list of currently registered DRM RAS nodes.
> +           Each node includes its dynamically assigned ID, name, and type.
> +           **Important:** User space must call this operation first to obtain
> +           the node IDs. These IDs are required for all subsequent
> +           operations on nodes, such as querying error counters.
> +      attribute-set: node-attrs
> +      flags: [admin-perm]
> +      dump:
> +        reply:
> +          attributes:
> +            - node-id
> +            - device-name
> +            - node-name
> +            - node-type
> +    -
> +      name: get-error-counters
> +      doc: >-
> +           Retrieve the full list of error counters for a given node.
> +           The response include the id, the name, and even the current
> +           value of each counter.
> +      attribute-set: error-counter-attrs
> +      flags: [admin-perm]
> +      dump:
> +        request:
> +          attributes:
> +            - node-id
> +        reply:
> +          attributes:
> +            - error-id
> +            - error-name
> +            - error-value
> +    -
> +      name: query-error-counter
> +      doc: >-
> +           Query the information of a specific error counter for a given node.
> +           Users must provide the node ID and the error counter ID.
> +           The response contains the id, the name, and the current value
> +           of the counter.
> +      attribute-set: error-counter-attrs
> +      flags: [admin-perm]
> +      do:
> +        request:
> +          attributes:
> +            - node-id
> +            - error-id
> +        reply:
> +          attributes:
> +            - error-id
> +            - error-name
> +            - error-value
> +
> +kernel-family:
> +  headers: ["drm/drm_ras_nl.h"]
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 0d0657dd1b41..5386248e75b6 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -130,6 +130,16 @@ config DRM_PANIC_SCREEN_QR_VERSION
>  	  Smaller QR code are easier to read, but will contain less debugging
>  	  data. Default is 40.
>  
> +config DRM_RAS
> +	bool "DRM RAS support"
> +	depends on DRM
> +	depends on NET
> +	help
> +	  Enables the DRM RAS (Reliability, Availability and Serviceability)
> +	  support for DRM drivers. This provides a Generic Netlink interface
> +	  for error reporting and queries.
> +	  If in doubt, say "N".
> +
>  config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>          bool "Enable refcount backtrace history in the DP MST helpers"
>  	depends on STACKTRACE_SUPPORT
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 062162d8e179..b2e031b8eaac 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -94,6 +94,7 @@ drm-$(CONFIG_DRM_ACCEL) += ../../accel/drm_accel.o
>  drm-$(CONFIG_DRM_PANIC) += drm_panic.o
>  drm-$(CONFIG_DRM_DRAW) += drm_draw.o
>  drm-$(CONFIG_DRM_PANIC_SCREEN_QR_CODE) += drm_panic_qr.o
> +drm-$(CONFIG_DRM_RAS) += drm_ras.o drm_ras_nl.o drm_ras_genl_family.o
>  obj-$(CONFIG_DRM)	+= drm.o
>  
>  obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 2915118436ce..6b965c3d3307 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -53,6 +53,7 @@
>  #include <drm/drm_panic.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_privacy_screen_machine.h>
> +#include <drm/drm_ras_genl_family.h>
>  
>  #include "drm_crtc_internal.h"
>  #include "drm_internal.h"
> @@ -1223,6 +1224,7 @@ static const struct file_operations drm_stub_fops = {
>  
>  static void drm_core_exit(void)
>  {
> +	drm_ras_genl_family_unregister();
>  	drm_privacy_screen_lookup_exit();
>  	drm_panic_exit();
>  	accel_core_exit();
> @@ -1261,6 +1263,10 @@ static int __init drm_core_init(void)
>  
>  	drm_privacy_screen_lookup_init();
>  
> +	ret = drm_ras_genl_family_register();
> +	if (ret < 0)
> +		goto error;
> +
>  	drm_core_init_complete = true;
>  
>  	DRM_DEBUG("Initialized\n");
> diff --git a/drivers/gpu/drm/drm_ras.c b/drivers/gpu/drm/drm_ras.c
> new file mode 100644
> index 000000000000..eb8a58d84002
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_ras.c
> @@ -0,0 +1,354 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/netdevice.h>
> +#include <linux/xarray.h>
> +#include <net/genetlink.h>
> +
> +#include <drm/drm_ras.h>
> +
> +/**
> + * DOC: DRM RAS Node Management
> + *
> + * This module provides the infrastructure to manage RAS (Reliability,
> + * Availability, and Serviceability) nodes for DRM drivers. Each
> + * DRM driver may register one or more RAS nodes, which represent
> + * logical components capable of reporting error counters and other
> + * reliability metrics.
> + *
> + * The nodes are stored in a global xarray `drm_ras_xa` to allow
> + * efficient lookup by ID. Nodes can be registered or unregistered
> + * dynamically at runtime.
> + *
> + * A Generic Netlink family `drm_ras` exposes three main operations to
> + * userspace:
> + *
> + * 1. LIST_NODES: Dump all currently registered RAS nodes.
> + *    The user receives an array of node IDs, names, and types.
> + *
> + * 2. GET_ERROR_COUNTERS: Dump all error counters of a given node.
> + *    The user receives an array of error IDs, names, and current value.
> + *
> + * 3. QUERY_ERROR_COUNTER: Query a specific error counter for a given node.
> + *    Userspace must provide the node ID and the counter ID, and
> + *    receives the ID, the error name, and its current value.
> + *
> + * Node registration:
> + *
> + * - drm_ras_node_register(): Registers a new node and assigns
> + *   it a unique ID in the xarray.
> + * - drm_ras_node_unregister(): Removes a previously registered
> + *   node from the xarray.
> + *
> + * Node type:
> + *
> + * - ERROR_COUNTER:
> + *     + Currently, only error counters are supported.
> + *     + The driver must implement the query_error_counter() callback to provide
> + *       the name and the value of the error counter.
> + *     + The driver must provide a error_counter_range.last value informing the
> + *       last valid error ID.
> + *     + The driver can provide a error_counter_range.first value informing the
> + *       frst valid error ID.
> + *     + The error counters in the driver doesn't need to be contiguous, but the
> + *       driver must return -ENOENT to the query_error_counter as an indication
> + *       that the ID should be skipped and not listed in the netlink API.
> + *
> + * Netlink handlers:
> + *
> + * - drm_ras_nl_list_nodes_dumpit(): Implements the LIST_NODES
> + *   operation, iterating over the xarray.
> + * - drm_ras_nl_get_error_counters_dumpit(): Implements the GET_ERROR_COUNTERS
> + *   operation, iterating over the know valid error_counter_range.
> + * - drm_ras_nl_query_error_counter_doit(): Implements the QUERY_ERROR_COUNTER
> + *   operation, fetching a counter value from a specific node.
> + */
> +
> +static DEFINE_XARRAY_ALLOC(drm_ras_xa);
> +
> +/*
> + * The netlink callback context carries dump state across multiple dumpit calls
> + */
> +struct drm_ras_ctx {
> +	/* Which xarray id to restart the dump from */
> +	unsigned long restart;
> +};
> +
> +/**
> + * drm_ras_nl_list_nodes_dumpit() - Dump all registered RAS nodes
> + * @skb: Netlink message buffer
> + * @cb: Callback context for multi-part dumps
> + *
> + * Iterates over all registered RAS nodes in the global xarray and appends
> + * their attributes (ID, name, type) to the given netlink message buffer.
> + * Uses @cb->ctx to track progress in case the message buffer fills up, allowing
> + * multi-part dump support. On buffer overflow, updates the context to resume
> + * from the last node on the next invocation.
> + *
> + * Return: 0 if all nodes fit in @skb, number of bytes added to @skb if
> + *          the buffer filled up (requires multi-part continuation), or
> + *          a negative error code on failure.
> + */
> +int drm_ras_nl_list_nodes_dumpit(struct sk_buff *skb,
> +				 struct netlink_callback *cb)
> +{
> +	const struct genl_info *info = genl_info_dump(cb);
> +	struct drm_ras_ctx *ctx = (void *)cb->ctx;
> +	struct drm_ras_node *node;
> +	struct nlattr *hdr;
> +	unsigned long id;
> +	int ret;
> +
> +	xa_for_each_start(&drm_ras_xa, id, node, ctx->restart) {
> +		hdr = genlmsg_iput(skb, info);
> +		if (!hdr) {
> +			ret = -EMSGSIZE;
> +			break;
> +		}
> +
> +		ret = nla_put_u32(skb, DRM_RAS_A_NODE_ATTRS_NODE_ID, node->id);
> +		if (ret) {
> +			genlmsg_cancel(skb, hdr);
> +			break;
> +		}
> +
> +		ret = nla_put_string(skb, DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
> +				     node->device_name);
> +		if (ret) {
> +			genlmsg_cancel(skb, hdr);
> +			break;
> +		}
> +
> +		ret = nla_put_string(skb, DRM_RAS_A_NODE_ATTRS_NODE_NAME,
> +				     node->node_name);
> +		if (ret) {
> +			genlmsg_cancel(skb, hdr);
> +			break;
> +		}
> +
> +		ret = nla_put_u32(skb, DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
> +				  node->type);
> +		if (ret) {
> +			genlmsg_cancel(skb, hdr);
> +			break;
> +		}
> +
> +		genlmsg_end(skb, hdr);
> +	}
> +
> +	if (ret == -EMSGSIZE)
> +		ctx->restart = id;
> +
> +	return ret;
> +}
> +
> +static int get_node_error_counter(u32 node_id, u32 error_id,
> +				  const char **name, u32 *value)
> +{
> +	struct drm_ras_node *node;
> +
> +	node = xa_load(&drm_ras_xa, node_id);
> +	if (!node || !node->query_error_counter)
> +		return -ENOENT;
> +
> +	if (error_id < node->error_counter_range.first ||
> +	    error_id > node->error_counter_range.last)
> +		return -EINVAL;
> +
> +	return node->query_error_counter(node, error_id, name, value);
> +}
> +
> +static int msg_reply_value(struct sk_buff *msg, u32 error_id,
> +			   const char *error_name, u32 value)
> +{
> +	int ret;
> +
> +	ret = nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID, error_id);
> +	if (ret)
> +		return ret;
> +
> +	ret = nla_put_string(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
> +			     error_name);
> +	if (ret)
> +		return ret;
> +
> +	return nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
> +			   value);
> +}
> +
> +static int doit_reply_value(struct genl_info *info, u32 node_id,
> +			    u32 error_id)
> +{
> +	struct sk_buff *msg;
> +	struct nlattr *hdr;
> +	const char *error_name;
> +	u32 value;
> +	int ret;
> +
> +	msg = genlmsg_new(NLMSG_GOODSIZE, GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	hdr = genlmsg_iput(msg, info);
> +	if (!hdr) {
> +		nlmsg_free(msg);
> +		return -EMSGSIZE;
> +	}
> +
> +	ret = get_node_error_counter(node_id, error_id,
> +				     &error_name, &value);
> +	if (ret)
> +		return ret;
> +
> +	ret = msg_reply_value(msg, error_id, error_name, value);
> +	if (ret) {
> +		genlmsg_cancel(msg, hdr);
> +		nlmsg_free(msg);
> +		return ret;
> +	}
> +
> +	genlmsg_end(msg, hdr);
> +
> +	return genlmsg_reply(msg, info);
> +}
> +
> +/**
> + * drm_ras_nl_get_error_counters_dumpit() - Dump all Error Counters
> + * @skb: Netlink message buffer
> + * @cb: Callback context for multi-part dumps
> + *
> + * Iterates over all error counters in a given Node and appends
> + * their attributes (ID, name, value) to the given netlink message buffer.
> + * Uses @cb->ctx to track progress in case the message buffer fills up, allowing
> + * multi-part dump support. On buffer overflow, updates the context to resume
> + * from the last node on the next invocation.
> + *
> + * Return: 0 if all errors fit in @skb, number of bytes added to @skb if
> + *          the buffer filled up (requires multi-part continuation), or
> + *          a negative error code on failure.
> + */
> +int drm_ras_nl_get_error_counters_dumpit(struct sk_buff *skb,
> +					 struct netlink_callback *cb)
> +{
> +	const struct genl_info *info = genl_info_dump(cb);
> +	struct drm_ras_ctx *ctx = (void *)cb->ctx;
> +	struct drm_ras_node *node;
> +	struct nlattr *hdr;
> +	const char *error_name;
> +	u32 node_id, error_id, value;
> +	int ret;
> +
> +	if (!info->attrs || !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID])
> +		return -EINVAL;
> +
> +	node_id = nla_get_u32(info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID]);
> +
> +	node = xa_load(&drm_ras_xa, node_id);
> +	if (!node)
> +		return -ENOENT;
> +
> +	for (error_id = max(node->error_counter_range.first, ctx->restart);
> +	     error_id <= node->error_counter_range.last;
> +	     error_id++) {
> +		ret = get_node_error_counter(node_id, error_id,
> +					     &error_name, &value);
> +		/*
> +		 * For non-contiguous range, driver return -ENOENT as indication
> +		 * to skip this ID when listing all errors.
> +		 */
> +		if (ret == -ENOENT)
> +			continue;
> +		if (ret)
> +			return ret;
> +
> +		hdr = genlmsg_iput(skb, info);
> +
> +		if (!hdr) {
> +			ret = -EMSGSIZE;
> +			break;
> +		}
> +
> +		ret = msg_reply_value(skb, error_id, error_name, value);
> +		if (ret) {
> +			genlmsg_cancel(skb, hdr);
> +			break;
> +		}
> +
> +		genlmsg_end(skb, hdr);
> +	}
> +
> +	if (ret == -EMSGSIZE)
> +		ctx->restart = error_id;
> +
> +	return ret;
> +}
> +
> +/**
> + * drm_ras_nl_query_error_counter_doit() - Query an error counter of an node
> + * @skb: Netlink message buffer
> + * @info: Generic Netlink info containing attributes of the request
> + *
> + * Extracts the node ID and error ID from the netlink attributes and
> + * retrieves the current value of the corresponding error counter. Sends the
> + * result back to the requesting user via the standard Genl reply.
> + *
> + * Return: 0 on success, or negative errno on failure.
> + */
> +int drm_ras_nl_query_error_counter_doit(struct sk_buff *skb,
> +					struct genl_info *info)
> +{
> +	u32 node_id, error_id;
> +
> +	if (!info->attrs ||
> +	    !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] ||
> +	    !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID])
> +		return -EINVAL;
> +
> +	node_id = nla_get_u32(info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID]);
> +	error_id = nla_get_u32(info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID]);
> +
> +	return doit_reply_value(info, node_id, error_id);
> +}
> +
> +/**
> + * drm_ras_node_register() - Register a new RAS node
> + * @node: Node structure to register
> + *
> + * Adds the given RAS node to the global node xarray and assigns it
> + * a unique ID. Both @node->name and @node->type must be valid.
> + *
> + * Return: 0 on success, or negative errno on failure:
> + */
> +int drm_ras_node_register(struct drm_ras_node *node)
> +{
> +	if (!node->device_name || !node->node_name)
> +		return -EINVAL;
> +
> +	/* Currently, only Error Counter Endpoinnts are supported */
> +	if (node->type != DRM_RAS_NODE_TYPE_ERROR_COUNTER)
> +		return -EINVAL;
> +
> +	/* Mandatorty entries for Error Counter Node */
> +	if (node->type == DRM_RAS_NODE_TYPE_ERROR_COUNTER &&
> +	    (!node->error_counter_range.last || !node->query_error_counter))
> +		return -EINVAL;
> +
> +	return xa_alloc(&drm_ras_xa, &node->id, node, xa_limit_32b, GFP_KERNEL);
> +}
> +EXPORT_SYMBOL(drm_ras_node_register);
> +
> +/**
> + * drm_ras_node_unregister() - Unregister a previously registered node
> + * @node: Node structure to unregister
> + *
> + * Removes the given node from the global node xarray using its ID.
> + */
> +void drm_ras_node_unregister(struct drm_ras_node *node)
> +{
> +	xa_erase(&drm_ras_xa, node->id);
> +}
> +EXPORT_SYMBOL(drm_ras_node_unregister);
> diff --git a/drivers/gpu/drm/drm_ras_genl_family.c b/drivers/gpu/drm/drm_ras_genl_family.c
> new file mode 100644
> index 000000000000..2d818b8c3808
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_ras_genl_family.c
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <drm/drm_ras_genl_family.h>
> +#include <drm/drm_ras_nl.h>
> +
> +/* Track family registration so the drm_exit can be called at any time */
> +static bool registered;
> +
> +/**
> + * drm_ras_genl_family_register() - Register drm-ras genl family
> + *
> + * Only to be called one at drm_drv_init()
> + */
> +int drm_ras_genl_family_register(void)
> +{
> +	int ret;
> +
> +	registered = false;
> +
> +	ret = genl_register_family(&drm_ras_nl_family);
> +	if (ret)
> +		return ret;
> +
> +	registered = true;
> +	return 0;
> +}
> +
> +/**
> + * drm_ras_genl_family_unregister() - Unregister drm-ras genl family
> + *
> + * To be called one at drm_drv_exit() at any moment, but only once.
> + */
> +void drm_ras_genl_family_unregister(void)
> +{
> +	if (registered) {
> +		genl_unregister_family(&drm_ras_nl_family);
> +		registered = false;
> +	}
> +}
> diff --git a/drivers/gpu/drm/drm_ras_nl.c b/drivers/gpu/drm/drm_ras_nl.c
> new file mode 100644
> index 000000000000..fcd1392410e4
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_ras_nl.c
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
> +/* Do not edit directly, auto-generated from: */
> +/*	Documentation/netlink/specs/drm_ras.yaml */
> +/* YNL-GEN kernel source */
> +
> +#include <net/netlink.h>
> +#include <net/genetlink.h>
> +
> +#include <uapi/drm/drm_ras.h>
> +#include <drm/drm_ras_nl.h>
> +
> +/* DRM_RAS_CMD_GET_ERROR_COUNTERS - dump */
> +static const struct nla_policy drm_ras_get_error_counters_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID + 1] = {
> +	[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] = { .type = NLA_U32, },
> +};
> +
> +/* DRM_RAS_CMD_QUERY_ERROR_COUNTER - do */
> +static const struct nla_policy drm_ras_query_error_counter_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID + 1] = {
> +	[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] = { .type = NLA_U32, },
> +	[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID] = { .type = NLA_U32, },
> +};
> +
> +/* Ops table for drm_ras */
> +static const struct genl_split_ops drm_ras_nl_ops[] = {
> +	{
> +		.cmd	= DRM_RAS_CMD_LIST_NODES,
> +		.dumpit	= drm_ras_nl_list_nodes_dumpit,
> +		.flags	= GENL_ADMIN_PERM | GENL_CMD_CAP_DUMP,
> +	},
> +	{
> +		.cmd		= DRM_RAS_CMD_GET_ERROR_COUNTERS,
> +		.dumpit		= drm_ras_nl_get_error_counters_dumpit,
> +		.policy		= drm_ras_get_error_counters_nl_policy,
> +		.maxattr	= DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
> +		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DUMP,
> +	},
> +	{
> +		.cmd		= DRM_RAS_CMD_QUERY_ERROR_COUNTER,
> +		.doit		= drm_ras_nl_query_error_counter_doit,
> +		.policy		= drm_ras_query_error_counter_nl_policy,
> +		.maxattr	= DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
> +		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
> +	},
> +};
> +
> +struct genl_family drm_ras_nl_family __ro_after_init = {
> +	.name		= DRM_RAS_FAMILY_NAME,
> +	.version	= DRM_RAS_FAMILY_VERSION,
> +	.netnsok	= true,
> +	.parallel_ops	= true,
> +	.module		= THIS_MODULE,
> +	.split_ops	= drm_ras_nl_ops,
> +	.n_split_ops	= ARRAY_SIZE(drm_ras_nl_ops),
> +};
> diff --git a/include/drm/drm_ras.h b/include/drm/drm_ras.h
> new file mode 100644
> index 000000000000..bba47a282ef8
> --- /dev/null
> +++ b/include/drm/drm_ras.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __DRM_RAS_H__
> +#define __DRM_RAS_H__
> +
> +#include "drm_ras_nl.h"
> +
> +/**
> + * struct drm_ras_node - A DRM RAS Node
> + */
> +struct drm_ras_node {
> +	/** @id: Unique identifier for the node. Dynamically assigned. */
> +	u32 id;
> +	/**
> +	 * @device_name: Human-readable name of the device. Given by the driver.
> +	 */
> +	const char *device_name;
> +	/** @node_name: Human-readable name of the node. Given by the driver. */
> +	const char *node_name;
> +	/** @type: Type of the node (enum drm_ras_node_type). */
> +	enum drm_ras_node_type type;
> +
> +	/* Error-Counter Related Callback and Variables */
> +
> +	/** @error_counter_range: Range of valid Error IDs for this node. */
> +	struct {
> +		/** @first: First valid Error ID. */
> +		u32 first;
> +		/** @last: Last valid Error ID. Mandatory entry. */
> +		u32 last;
> +	} error_counter_range;
> +
> +	/**
> +	 * @query_error_counter:
> +	 *
> +	 * This callback is used by drm-ras to query a specific error counter.
> +	 * counters supported by this node. Used for input check and to
> +	 * iterate in all counters.
> +	 *
> +	 * Driver should expect query_error_counters() to be called with
> +	 * error_id from `error_counter_range.first` to
> +	 * `error_counter_range.last`.
> +	 *
> +	 * The @query_error_counter is a mandatory callback for
> +	 * error_counter_node.
> +	 *
> +	 * Returns: 0 on success,
> +	 *          -ENOENT when error_id is not supported as an indication that
> +	 *                  drm_ras should silently skip this entry. Used for
> +	 *                  supporting non-contiguous error ranges.
> +	 *                  Driver is responsible for maintaining the list of
> +	 *                  supported error IDs in the range of first to last.
> +	 *          Other negative values on errors that should terminate the
> +	 *          netlink query.
> +	 */
> +	int (*query_error_counter)(struct drm_ras_node *ep, u32 error_id,
> +				   const char **name, u32 *val);
> +
> +	/** @priv: Driver private data */
> +	void *priv;
> +};
> +
> +struct drm_device;
> +
> +#if IS_ENABLED(CONFIG_DRM_RAS)
> +int drm_ras_node_register(struct drm_ras_node *ep);
> +void drm_ras_node_unregister(struct drm_ras_node *ep);
> +#else
> +static inline int drm_ras_node_register(struct drm_ras_node *ep) { return 0; }
> +static inline void drm_ras_node_unregister(struct drm_ras_node *ep) { }
> +#endif
> +
> +#endif
> diff --git a/include/drm/drm_ras_genl_family.h b/include/drm/drm_ras_genl_family.h
> new file mode 100644
> index 000000000000..5931b53429f1
> --- /dev/null
> +++ b/include/drm/drm_ras_genl_family.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __DRM_RAS_GENL_FAMILY_H__
> +#define __DRM_RAS_GENL_FAMILY_H__
> +
> +#if IS_ENABLED(CONFIG_DRM_RAS)
> +int drm_ras_genl_family_register(void);
> +void drm_ras_genl_family_unregister(void);
> +#else
> +static inline int drm_ras_genl_family_register(void) { return 0; }
> +static inline void drm_ras_genl_family_unregister(void) { }
> +#endif
> +
> +#endif
> diff --git a/include/drm/drm_ras_nl.h b/include/drm/drm_ras_nl.h
> new file mode 100644
> index 000000000000..9613b7d9ffdb
> --- /dev/null
> +++ b/include/drm/drm_ras_nl.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
> +/* Do not edit directly, auto-generated from: */
> +/*	Documentation/netlink/specs/drm_ras.yaml */
> +/* YNL-GEN kernel header */
> +
> +#ifndef _LINUX_DRM_RAS_GEN_H
> +#define _LINUX_DRM_RAS_GEN_H
> +
> +#include <net/netlink.h>
> +#include <net/genetlink.h>
> +
> +#include <uapi/drm/drm_ras.h>
> +#include <drm/drm_ras_nl.h>
> +
> +int drm_ras_nl_list_nodes_dumpit(struct sk_buff *skb,
> +				 struct netlink_callback *cb);
> +int drm_ras_nl_get_error_counters_dumpit(struct sk_buff *skb,
> +					 struct netlink_callback *cb);
> +int drm_ras_nl_query_error_counter_doit(struct sk_buff *skb,
> +					struct genl_info *info);
> +
> +extern struct genl_family drm_ras_nl_family;
> +
> +#endif /* _LINUX_DRM_RAS_GEN_H */
> diff --git a/include/uapi/drm/drm_ras.h b/include/uapi/drm/drm_ras.h
> new file mode 100644
> index 000000000000..3415ba345ac8
> --- /dev/null
> +++ b/include/uapi/drm/drm_ras.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
> +/* Do not edit directly, auto-generated from: */
> +/*	Documentation/netlink/specs/drm_ras.yaml */
> +/* YNL-GEN uapi header */
> +
> +#ifndef _UAPI_LINUX_DRM_RAS_H
> +#define _UAPI_LINUX_DRM_RAS_H
> +
> +#define DRM_RAS_FAMILY_NAME	"drm-ras"
> +#define DRM_RAS_FAMILY_VERSION	1
> +
> +/*
> + * Type of the node. Currently, only error-counter nodes are supported, which
> + * expose reliability counters for a hardware/software component.
> + */
> +enum drm_ras_node_type {
> +	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
> +};
> +
> +enum {
> +	DRM_RAS_A_NODE_ATTRS_NODE_ID = 1,
> +	DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
> +	DRM_RAS_A_NODE_ATTRS_NODE_NAME,
> +	DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
> +
> +	__DRM_RAS_A_NODE_ATTRS_MAX,
> +	DRM_RAS_A_NODE_ATTRS_MAX = (__DRM_RAS_A_NODE_ATTRS_MAX - 1)
> +};
> +
> +enum {
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID = 1,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
> +
> +	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
> +};
> +
> +enum {
> +	DRM_RAS_CMD_LIST_NODES = 1,
> +	DRM_RAS_CMD_GET_ERROR_COUNTERS,
> +	DRM_RAS_CMD_QUERY_ERROR_COUNTER,
> +
> +	__DRM_RAS_CMD_MAX,
> +	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
> +};
> +
> +#endif /* _UAPI_LINUX_DRM_RAS_H */
> -- 
> 2.47.1
> 

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C79FA6033A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 22:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EE410E1BA;
	Thu, 13 Mar 2025 21:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lGDrwVAd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DB210E1BA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 21:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741900218; x=1773436218;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DgrFpcxtnk79hkhZzOwuhSUsd8sSWyfhwC+GIOPZ77E=;
 b=lGDrwVAd4lhXAOLvh/gjfMmdQm5IhRYZH1RVvbK5hWXSIbfxtgE53/L3
 XOgvNuZQXxk8d41rpT0o0YnKxlMRSX1LmlqD78r2cSkTwv/9gV2s0/CdB
 f9GHSF2YlR6hJIKahTZSC4pQri6pnFlFlFA5F91t8JdA9t1D7wNd2LZJV
 Z2O8WytO16F2KyMW3ssoMFCf7AjzBegYZKsTDt8XAwHYsceiQ4TQ3EP9U
 B1/Ydl5lINji/CPof+3eGepobHcxyFFVnSImZ+xJjIXKwcNVfd3MGfI/A
 zlhESa+ypqI4HDHGxZIkNPBLsRwqpnwEQvVsn+5M15w15xXxzfXNtfSLj w==;
X-CSE-ConnectionGUID: 970A+IuDQ6iM/H5nlq21RA==
X-CSE-MsgGUID: Ara7nlLWRMydjzSMpO4HEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="42766423"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="42766423"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 14:10:05 -0700
X-CSE-ConnectionGUID: 7Jk+EKlTTCud49Jq2CsC/Q==
X-CSE-MsgGUID: lOS3jH3ORRGuIfyct6B2Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="120860987"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 14:10:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Mar 2025 14:10:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Mar 2025 14:10:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 14:10:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/Z1W1z8ZlHGyQDvBnb8vkT/bDs2mr20Jr4z2+zsHsR7OUVF3YHmn5rQsSqQVYml4B+dS1dealJlkTAQ649p32G3ww+hnBzHeQDuJtpF55dh1HiKfsuvt9uu8yE5+UGV+xjWH+jIpVPA7c4uhQkK4ty95RrN3TtYVrDDqiO8Qhbx0k4QhESwDtBV0PxM4x8T2N+8i3+3qfaGmWrQxt7ipbYuph67USqZJpgucUwABg9vffgNwUiGk/utaBf925sfE0Ds/OB3Xeuo6rTT3ip+yNQJP7AP39lyO8ZdsHdqBsEwo9lySlwKyZfQ9VktMyerRhBG/oF+Mf9ArYQ/PD/ZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E45ReUDgJlcJOBMmUBMkjqsOf7Q6u6VUkzeBkCoDTsI=;
 b=YU2aqC8SEyrNocIxqrsRl6uLJKNvf5zuRGIDhW8J91qrNgHOhmV3OXVt2eqcYMv/Yde8RDfjVbHDfIwtdhzsUMMgBuY7NI7icvPvv12LDw5x00kTac6CC9s1mTRkWC98Y1ajqzEk0jAejI/EJYlCngxu6q0DOWmwvgw9xuHPTfrjqOY7s1oufzsFwGVNfUmftGjLUMZCJVfiHtMBqLPDZHDeULq8LtlDerJ52P53+M9sQQM1KZ5Ryq4HApixdJaOa0O9h/u88Qr4wCw0DslrJwXy5BNw48QLaBOpni3WOonLLTOQ7Nlm9a6nbHPCD96cyka4AzI8UJg2q4kPvkPi0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by SJ0PR11MB4992.namprd11.prod.outlook.com (2603:10b6:a03:2d4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 21:09:26 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%4]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 21:09:26 +0000
Message-ID: <b2b632cc-ca69-497f-9cf9-782bd02cac79@intel.com>
Date: Thu, 13 Mar 2025 14:09:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
To: "H. Peter Anvin" <hpa@zytor.com>, Yury Norov <yury.norov@gmail.com>
CC: David Laight <david.laight.linux@gmail.com>, Jiri Slaby
 <jirislaby@kernel.org>, Ingo Molnar <mingo@kernel.org>, Kuan-Wei Chiu
 <visitorckw@gmail.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
 <bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
 <jk@ozlabs.org>, <joel@jms.id.au>, <eajames@linux.ibm.com>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dmitry.torokhov@gmail.com>, <mchehab@kernel.org>, <awalls@md.metrocast.net>, 
 <hverkuil@xs4all.nl>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <louis.peens@corigine.com>, <andrew+netdev@lunn.ch>,
 <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
 <parthiban.veerasooran@microchip.com>, <arend.vanspriel@broadcom.com>,
 <johannes@sipsolutions.net>, <gregkh@linuxfoundation.org>,
 <akpm@linux-foundation.org>, <alistair@popple.id.au>,
 <linux@rasmusvillemoes.dk>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>, <kuba@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsi@lists.ozlabs.org>,
 <dri-devel@lists.freedesktop.org>, <linux-input@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <oss-drivers@corigine.com>, <netdev@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>,
 <brcm80211-dev-list.pdl@broadcom.com>, <linux-serial@vger.kernel.org>,
 <bpf@vger.kernel.org>, <jserv@ccns.ncku.edu.tw>, Yu-Chun Lin
 <eleanor15x@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
 <Z8ra0s9uRoS35brb@gmail.com>
 <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
 <20250307193643.28065d2d@pumpkin>
 <cbb26a91-807b-4227-be81-8114e9ea72cb@intel.com>
 <0F794C6F-32A9-4F34-9516-CEE24EA4BC49@zytor.com> <Z9MGxknjluvbX19w@thinkpad>
 <795281B1-9B8A-477F-8012-DECD14CB53E5@zytor.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <795281B1-9B8A-477F-8012-DECD14CB53E5@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0182.namprd04.prod.outlook.com
 (2603:10b6:303:86::7) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|SJ0PR11MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: 79b10f16-aaa7-4494-8167-08dd6273564e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2xMdC9xZ0lWeDl5dW5sOVZMK1ovSFRPeUpnaUZnd3g2R1c0Wkcza1RjZHQw?=
 =?utf-8?B?WCtSWnhUMldGN21SR1pmc2xDc0lidXpEZnpzRU1JYkNtbFFNYnVwM1V3R1Az?=
 =?utf-8?B?bnVzb0EwdklhaVpwd0k0OVI2MVFCQjlKdGIzbG5zeEhURGFvY2ZmQkk4L3Fu?=
 =?utf-8?B?c2Z4WEdSck4xR04veGdkVFpQNE1NVThaK0Q5WFpwRktFMVJHYmgzYWNQaGRk?=
 =?utf-8?B?akxLTXJJQmFpOEZhRTBRS3BaYnlMRE1PcExwdWwxTjFtZ1VadkZSRVZYZ0FE?=
 =?utf-8?B?NWVnakJJakoybGVJR0doQXZRT0loNnR1TG5kRHdRNGJscklwRXI1dnkrVXBk?=
 =?utf-8?B?bUIrTGFhcCtseEZzQVVtQkYrRTl2bnlqdXF6V2szMVdhQS80M09XeVhTb2Fm?=
 =?utf-8?B?QXhheVZyc1Ywd2ZqVlhKNUhFTjNpNWYwcnBUVHhibFQ2Sk00aTFmV2tRYTg0?=
 =?utf-8?B?YmM4Uk1DVFJlMkhoNm1BOHprcmNXL0FZcEtKbytDT1Bzc1JpU3ZsZGhEb1pP?=
 =?utf-8?B?TENreWpYN0Z4cjNKc2cxRFR5TzBtTHNFVENEK283NnMyMFMzZG9YaHBJL3VH?=
 =?utf-8?B?SWZseUFXZEpkV3NBOE9yV1lncDRLNHpvdE1wWHRPZmZSR25IeCs1di81S1VF?=
 =?utf-8?B?ZGIzMVErVU02TXVEVjNrelNnVnd6NTRlYzVwSU10RmVvaHV2RGlzcFFONjQz?=
 =?utf-8?B?T1EwUzRmTjVYdGdxUTBESnBEaUlzN2tldEViVnM3dW5lcXVkZFNQS3lSdzZa?=
 =?utf-8?B?ZEtUcmY0TzhOaFpmVFk2NERFQmluV1VqSUFPSktmQVc2S0lPbGxwK210Q3pG?=
 =?utf-8?B?cXozQnpacExxZ0pwSUV0SGpablJ3NitCV1Npc0gvazlIV01qSnFHbEVzTHZP?=
 =?utf-8?B?eFRsRUUvM1JJZVBTeHhJRHdiMURJL1hLTTNuVHBFZnd4NE9qWlRES2xNSHZo?=
 =?utf-8?B?UE0xaEpidXRTV0pDc09uNUk3SWxsS1kzNDRGV2h1Um92eUduSGZzbFArOVhT?=
 =?utf-8?B?NTF5emRYVStZL0xFd0JVN0ZiMkhlWEFSWHNOWG9ENmZhNTY1Zm13ZjcrMEJL?=
 =?utf-8?B?enFJNDBVNzAyUkRvTWZ2U1NXNnZWNDFZSENjYWhQZEhuazhNcVJDL2RkaC9V?=
 =?utf-8?B?V2VyNzFBQmQzVy9tUWdiSTBsc2h1M0JISTFlSTArSnFxK0VHcm81R3hNNmxK?=
 =?utf-8?B?VUc1bXlyZ2Foa2YvVlhUYTh1Y05jT01CZHdkR0plQTBHVDNGbjR2LzY1QlVm?=
 =?utf-8?B?dUgzYkYzSGRKNXJFYTRNWmE3cE9VcEFIOFZMNmpnUVhOc2Q1azR5ZlZPOWNJ?=
 =?utf-8?B?dUVuWVJqRUI0dDNOamhqcXN4T2QvMkFDNjRBSXNxbzJsK2NaSjZDVGU3ODZR?=
 =?utf-8?B?eDMxRE8zV2FrU2VqY2h1UXljeU0yUlFBSkQxZjJyNmtiODhXdkFPOGlPTGtq?=
 =?utf-8?B?RE44QTQyeWpZVDFtN3lmSjFsUHdhakxqeDlaL1V0THhmSlVBMjVNb1lIaGtM?=
 =?utf-8?B?QUIwUnFHeDIvYjlIY3V3QUVrdm1DeWloMmdhRXlCcDQxSk5OM2xzanlxWW5C?=
 =?utf-8?B?UFJVYUdrZTlmNjV6REo5ciszZTVHR1ZMc2U0MjM4d2dDWC9WUGdLR3J3Rndm?=
 =?utf-8?B?dE4rRjIzWnFNNWoyM2RCc0dvakVuN2pjQUc3dXVzSm5tOVhzQ0NlTjM1eThu?=
 =?utf-8?B?OTF1dlJ5MjFKMXpveTBvYzFRQnROd1UvZW5zZ3RqZERzU2pHSFRvT0VUT1NX?=
 =?utf-8?B?aXltcE5rWmNkZDNSQ09TT29ncHFtaEt3c1RIZ0R2dTVRc25GcEtlMEFTWWR5?=
 =?utf-8?B?akRCVlgwK1hzaktuK2d4YnJha1h4dzRLdW9JeDlqQ2RiL1hVMGNqdDQxNVZP?=
 =?utf-8?Q?6djIK3dZhi617?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmdhTlR2RzdrbXhDcHArRmdPenZqeEhiV2s2YnY0Y01kS3VuRERPdkYyMzhR?=
 =?utf-8?B?dzd1VlFZYjM1TUVwRGFGcHZmTXF6UkEwWDdSQm1mSGNZQk5NZVhlQWdQRzNI?=
 =?utf-8?B?VXhPa2tQTnIyMk5EbGI4NFUyei90UzBjSVdzNW9mc0NhNU5RQ1JuREk0Zjc5?=
 =?utf-8?B?RjBMU2RNeTlVaGxQQkl2OWhNUXBwRFZ0UGYxVGovRWRyQXFaby9EazFNMFVl?=
 =?utf-8?B?TGRHUFhuUjg5MUJCalJnc2xaMXFBOVJBcGdaQWtWNFBvZGRZOWk1WHpzQWVs?=
 =?utf-8?B?eStYVmhQSDVxSnhyVCtwUXRwb05yRFJkSnNVR0JGd1ZHZTlCL0dFYUJGK3Zv?=
 =?utf-8?B?UmowUm81TVNoZFFSWnFIelRORERuWjU1VnkzL2hmeUZuSCtxYXhkNnphSW9H?=
 =?utf-8?B?VUdUMDdnVTFBeW1WajlVZ2xDR0ttK2FOU1ZQVzQraHNrMlUybHl1VnlTVlh0?=
 =?utf-8?B?cDU5ZlhiM0N0VnZwSUtRMWJJdXduVFJpQnRUa1ROU3F4YXNselIycHM0MGF1?=
 =?utf-8?B?RkNtUmx4aE5SUFNuRW9wcjhqdUdyT3g1T2tFUWhYc1JxK0tyRm5nZmJQYXVm?=
 =?utf-8?B?cEpoamRsZ1hhbCt2Z2ErbnhpdU83L0Jrb2hsMGNGL0RobGlyNzl3UktaWTJT?=
 =?utf-8?B?Wlp6SGdhWit5eW1PZnNqczlubWpVN3pORWllSDVzVDlmbVNneDd5MG9jTGVT?=
 =?utf-8?B?bndWS2NveU9FcGUzY05aNlQyV1k3U2RuQ2xETStNUmY3SnJXWEk4S3p4enhB?=
 =?utf-8?B?b1Z6d0ZLczJPN1NUVmJwZGJDV1ZFWS8xM09xSitPUTdoRklneXU0SHloSkpT?=
 =?utf-8?B?N2wrYVNaTWFSV1l5c1Y3YzVZRC9lYkJ2K0VLa0pldTRPTGgrZlBIY2laQzYr?=
 =?utf-8?B?Yno1UW1acXI5eHJLYW4wTlRsTGVBMnp2OTlOWVdBSVdKbjVvUlZ1NHRzZ0dx?=
 =?utf-8?B?aGh2VzRtY1MvNDNhclhTdXI0ZGdzTXlWbFp3THczdWg2MDl3bFZzQ1I5YkY0?=
 =?utf-8?B?L3U2ODNiYXQ5OGE3aWRhMUxBMVEwaGVXcThOS2JNeFZJTExma2NXK2lvbkQw?=
 =?utf-8?B?YzRBazljenZXdURXL2NVU3YrY3FJWWdpc2ZMNzJTSGJCSzJvOEVqbll5bWJY?=
 =?utf-8?B?WUV3NmNPVThZUWU1SUdxN3hNY01jTnhDV2dMTXoxVGwwL0FCRkk3ZlBmUUhr?=
 =?utf-8?B?QmdRT1RhaFpCa1VaZkFxbVlwbFVnRlF2Qy9pbHJiR0ZYaHVaZERhNi93Mlg1?=
 =?utf-8?B?dlJWZGJQcjY1M1AzakJWUGJrRElWamJCRVdKcyt5c0F1R2dVWGVHRlRiekNy?=
 =?utf-8?B?aXRmMlViUUNMWk4vdGtrQ203d3JaRXd5Q3lkaEI1RFI4aFJLazM5Um5XaFly?=
 =?utf-8?B?dE8xaUhmMVpoS0xIcGpQYkxOU1pjTys5TVVUNEtYRWFiNitkNDNHWkIyc0RF?=
 =?utf-8?B?SkZNakhRdU94RE5EaGp3Y3JaZWE0d29VTmUyUktFUEhHOXg1TUNuVmN4TTAv?=
 =?utf-8?B?UzJBSmY4emFrVkxQUWZpMTNmeHVDV2dWSVk5YUVMN0tENVVQL3grNndwelkr?=
 =?utf-8?B?Z1R3b0hibkJ4V0laNXlXczM5NnQyWko2bU92WkZTaGVBM25wZk9wbFNpc25R?=
 =?utf-8?B?MkZrdWpIbjFDRDNjaSt0clRtR21vSXpHdy85NnAzMUhlWWtncVJ3NjV2UGdT?=
 =?utf-8?B?enBvRnhJYW1hbTRrYUk4YVV3M3lTUmdERDZwRFFxaEg0TW5wdm15ZVIvMnIy?=
 =?utf-8?B?cU5rWDZBUnp0ZHlUcThPdFlZMlN3MWRDVmdYRy9ocVhQeVJRZXhkTFRjcjBa?=
 =?utf-8?B?UzF2TDBRUmF4bHh5Zi9ldS9HT3ZKMldBT0JOTVBKb09yYUJ2T0MrcVhxVE5C?=
 =?utf-8?B?TWp6cjNkd2FvWGVVZTNtdTF6L2tyNC9YZThjWTFQT0pMU1ZscnJCQ0tCQVhV?=
 =?utf-8?B?d2dMQW9YMVFLejBjQjZhNld0U2dlUXBId2F1dkFoTFFYMmRsdEc3M0NiZ3pj?=
 =?utf-8?B?MWh4VTRvWGFYYlg5VUZ2UnNzK29CNHBxdTRrdVN3THkyMjYwaUtPOTVVcjBC?=
 =?utf-8?B?WTdzdGhsOGlFNytwby9keE1XbUdUK2NzVlZDeTlHRGFvSnR5N0NrYk03eHl2?=
 =?utf-8?B?aHRORXpGUVN2ZzNZelA4bFNuaHJOQnYzWU5EVzNoRDRhZzNDQVRxeGpZeWls?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b10f16-aaa7-4494-8167-08dd6273564e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 21:09:26.6569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l05o3X0cy9v7nJGc+IVjRhjuA1RbK8izJdn9E++fY2m/U5w6Dw8hyFeURYozIl3EdMxdxlYgyXDkRfNbnj4ipUCFlhAAyH/1uuo9rOvl8GA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4992
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



On 3/13/2025 9:36 AM, H. Peter Anvin wrote:
> On March 13, 2025 9:24:38 AM PDT, Yury Norov <yury.norov@gmail.com> wrote:
>> On Wed, Mar 12, 2025 at 05:09:16PM -0700, H. Peter Anvin wrote:
>>> On March 12, 2025 4:56:31 PM PDT, Jacob Keller <jacob.e.keller@intel.com> wrote:
>>
>> [...]
>>
>>>> This is really a question of whether you expect odd or even parity as
>>>> the "true" value. I think that would depend on context, and we may not
>>>> reach a good consensus.
>>>>
>>>> I do agree that my brain would jump to "true is even, false is odd".
>>>> However, I also agree returning the value as 0 for even and 1 for odd
>>>> kind of made sense before, and updating this to be a bool and then
>>>> requiring to switch all the callers is a bit obnoxious...
>>>
>>> Odd = 1 = true is the only same definition. It is a bitwise XOR, or sum mod 1.
>>
>> The x86 implementation will be "popcnt(val) & 1", right? So if we
>> choose to go with odd == false, we'll have to add an extra negation.
>> So because it's a purely conventional thing, let's just pick a simpler
>> one?
>>
>> Compiler's builtin parity() returns 1 for odd.
>>
>> Thanks,
>> Yury
> 
> The x86 implementation, no, but there will be plenty of others having that exact definition.

Makes sense to stick with that existing convention then. Enough to
convince me.

Thanks,
Jake

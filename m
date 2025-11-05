Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997E3C36426
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C681E10E79C;
	Wed,  5 Nov 2025 15:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esVvuRuz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1A210E790;
 Wed,  5 Nov 2025 15:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355587; x=1793891587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=asdtQj/+hV2mr/yssYTzEhfVXHR74n/WMiOIztsrQvw=;
 b=esVvuRuzlSKqLIDsPs7d+lcDTDYH7dURO7UkjnTKUA389I/wc4pdgBpq
 QmTonGhuey/d92KE7o71hRIPVJY4aqCw7CWyGnE2qC+VW9M8FbpAUwhrM
 GFRBaWcBeN23hLyBOJv7WGHq37dbJG99Sq6pshFIV/1X2MNRBodzoPUhf
 UlwR4y7U7j3PehzBHDLxYSuRENN133076GkkG1HYqzpHSslCDAa19M1H1
 N4hPXzXKtrvNLGFewHt6LA895nSysqZLDHi7JsnUr12PAFqadzWVVC/IJ
 SJMHqriKxdwIRn9uzADY0WUyRL2J7B0A7VVlqZLv1e/6af7v/gNW6G6XC Q==;
X-CSE-ConnectionGUID: tOMBUFH9SaGlhIAomQBQaQ==
X-CSE-MsgGUID: o4zK7g2sS7WL4AwwZR8tQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="81875936"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="81875936"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:13:07 -0800
X-CSE-ConnectionGUID: sBbGUgqtTUW+uZDZSbdMDg==
X-CSE-MsgGUID: c+Pu6/kCTTG3OULzMJjeMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="186766682"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:13:07 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:13:06 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:13:06 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:13:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXjYmk0UNTKvnczLEhPq5zl1ElXBJB2X57ebnV49VxImBCMPP3bgmkWEKO3jAMYZyuuLbZiR1WquLhSPfXeg4eX5I0i6BdtrG7lVvuFo6mmMaeTQyw5sKM18CP/BSp00ODuftpP2iJX+anZYr4S9O4+av+g7KFk0woKRnLUPK5SMEMzCOd9IjyEicja4BVo4vpvbunq0vWiCSwJ+Ct3xK/pA0irAHXpPIj2sxvZJBaCZ69XawCzlQRmHuRWraGDRX6nY9kFnMVdRHq6AHwQwp5Mjo4UOvKRmjezSm/jXRjdgH4TnMXfKgLS9AghFYDb0Syj6J07EuofQHSQJmmiCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQzEawINTQ9sdmQbZzsXV93fjTXCxLsOZ3g/3sZIVK8=;
 b=Q6VTT7vqJCppJ+/c1thQfN7Xa7lucldzNq1bZTClBuJOKVPd3IjJFMdATWgCEBJaRh5wplXIwMlhmbPVgFmmsBcGEbGsDQfjF9/978m7Edk3Spt0k07Ux4PfCO4VpQzpODHgseYT1UPWmPdOsvtouKEEBCzxQ53MJGsPUZBIl/L7P33AkONAw39EIU+Be4fqLO7JnpDqyUqxX5mnnhxcGflpBiYcMCJbUNk1xlZugXYdBXmYrk83LskIY9bCYzEgu4gHv49KvhDlXj59tfynyNNEIH8LA6yQbeXH40fzLp+kRfaSdzpAcEASZZaacaUCpGuSEvriMM0pfmPow30+mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB8038.namprd11.prod.outlook.com (2603:10b6:510:25e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 15:13:03 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:13:03 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v4 26/28] drm/xe/pf: Export helpers for VFIO
Date: Wed, 5 Nov 2025 16:10:24 +0100
Message-ID: <20251105151027.540712-27-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB8038:EE_
X-MS-Office365-Filtering-Correlation-Id: fd278e5b-3363-4da3-1712-08de1c7dd0df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzNCY0FMaUZ4RnRrOTd6b0REeWRXeTJZc3NIQjhvTjRvRzRJeEpHQkN2UUFy?=
 =?utf-8?B?YzB4bmZ2YnhOSFZmaXF0QW1EL29YUStpMVp2eXM0SmtidDRTbmN0T0tFRWdp?=
 =?utf-8?B?clY3R3BnMlU1NlczZXBkM0JmMkhaVXZLZHJzT1QrSHV0eUwvWWR0dWVkdjZV?=
 =?utf-8?B?YVRCRTZNb1VlNk5qcHlST1U1RHFZRU9qc0VTWkNDMlVnaTZ5alczelZhVlVN?=
 =?utf-8?B?UDVKdWFkdlVTSGx1Ri9NT0VJWndKOGdwbFhIWUJ2bmdOa2lHdlcrT1lQRG01?=
 =?utf-8?B?L3hZcjZEbjhGaXR0WUcyZ3R2M2RCSzgvUUw4YzMwYlloOTBkMks0M1l3TGYz?=
 =?utf-8?B?YmM4L2QvOHZ0bkNjNXFmQ0cveHJib2MveGdGM1NzWU5FaE1qc1F5ejlnOFFU?=
 =?utf-8?B?WEVlR2JqUmMvcDVrYkJsYkx5bVBsR1FKRDNLWUhXanlyUHhkYU9PSTJZUjhi?=
 =?utf-8?B?Vkk1K2FxYVp0d3FkRkNWcGJ5YTlIbjk2LzdxeHI0eWxoTTU4VkM5NEFkMzN0?=
 =?utf-8?B?d1dOM1l0QzRYcUcxY0RLeXo2QTJYd2kva3NoblAwNjNTRkZrT1RTMzdBLy9R?=
 =?utf-8?B?RHJNVEo1NjU2UTlNU3ZtcHBld3FlSldZRjE4QXdsMTBiUFBYaThpZDY2OG01?=
 =?utf-8?B?UXNJVkQ5M0N4a0NxUVQyeTJGeW4zbGVvSVBrZkhkdXBHQlIrOTdCTFVxN2d1?=
 =?utf-8?B?N1REWkVzRm9kVDlrRld3MzZRS2tqSTFVcm1EL2tBME83WFRwUzBCRzFVOVJC?=
 =?utf-8?B?Zm1kNTI5SUNPUFJKcUV6cFZpRTR4OWY0L0lwdDZEV09jME5WY3V1d2Yvbmp6?=
 =?utf-8?B?bGYwK2V1S0dqR2tKSzhpdURQbUNjSytLd1VBbmdKb096M2t0dTF0R1h3b2dz?=
 =?utf-8?B?eUZXZVVzVzBFeWFRdzZ1R3VMa3hSOTR2R0VYZmJKQThySjRBNUhaM1hSd2hK?=
 =?utf-8?B?WXR1aG1YejJjVHNXT3FwclRzQlBydVFqRm9UM09rTVlLMm54SHNrSGNzRVM1?=
 =?utf-8?B?OUQwZWtwaVNha0lTbFdCWDZ6YnFKY0JSZ0wySXpiV0NYVmF1dDFNNElkWWpp?=
 =?utf-8?B?TC9jcXRKSlpaeXRwbEpoNmFQc3NXbW1GMS9HZmliM3FtR1VzREJxMVZxUVdL?=
 =?utf-8?B?bXE3YUtJTjc4aVNxUU9MeGFkbzFoRG5XZDl1clBMZFpDVDFxUjdnSzdEdDZm?=
 =?utf-8?B?YS9PUUttWkx4cUZaVEVxQWhVaC92QmtqZmRTcXZMQ1Y5d3pCNmlYbjhYd2kz?=
 =?utf-8?B?Z1NTUitrcGYvWkxNb2lHZkV3aDJtcWxhMkFzN3RZajltQTBOVVBYZ2ZHMmlY?=
 =?utf-8?B?U0FKaG5vSHFtb3o2MzdDU3lrbWMzbTRQenJJUHdTaTRocFF4SGc3TVhFVW5Z?=
 =?utf-8?B?b0kzenpWWTJoYkRMTmFFVEUxdE1jMnBUZVl1dGxFM1R3aXhDOUM1RU9XOHQx?=
 =?utf-8?B?SnJCdmEwRFA3UzlCdlhLNkw4QUJoY2ZVNUtQSEVDdFJSN2pGM3VNb2NzL3RB?=
 =?utf-8?B?ME01NEI1R3p2aUgvaGQvdlZ0OW1XMTBseERGeTltNHdOcDl4Z244UUZ1SVln?=
 =?utf-8?B?ZklQZGhYYlVMRTUrNkI2dUNqZFdOcnAwb3BkekZWNW01VGNLek0ydE5PSHBy?=
 =?utf-8?B?SlQwMVNYdU5XUjhCWUdDVWhJY0RpRURDcGdoZjhqTXFOQlRhbUJGbU9RVE5B?=
 =?utf-8?B?NmRPb3EwUXM5czRXSXE0V2d3WlpaZzg3c1pPVDVOUnEyc1EwanVoMDFVVVRr?=
 =?utf-8?B?cDFxWlpUSWdrQVhHMUhWN1J6MmErODJEVjlseXA2SU9lTVdrYVp3QldsekpU?=
 =?utf-8?B?cFBzQ01oV203TXEzcDEwbmw1UHZxRlYrbDIvbEtMZVI5UjZyRmRJT3oxaXJq?=
 =?utf-8?B?Q25KU3JGQWlPemJnQ1g3bDNlY2MwMjlZbDFVZ0JFaUZHVGwxUHUwdVBmUCtG?=
 =?utf-8?B?MUxsN05TNTMxRWJuRENNUEwwUnAxTFErOVBUUUNzUDNXblZHYnRHYWRQMnJK?=
 =?utf-8?Q?ndgIVf/Lp2FQN45QHWpiWFepKAi828=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmhFSVhzVGJzMWs0ak1IN0pKejZNdUhJcFMrcHYxME5HNENnSDFYS21kdER6?=
 =?utf-8?B?MXFkRjZRNjdLZ0NrY20xdUg0ZXhMeXAybFJIRUY3UGVjWlI3WUk1YXdXclZL?=
 =?utf-8?B?eHdvSjhNNGFHaFZJMHl6MVlJbnd4VWxyMk5ITmo4QlJFNk4zc29MbTVNMC9D?=
 =?utf-8?B?TW9GazA4ZFhrUnNSZjF0VmozRHAxdHk0YU43RDJ2OHYyWmhGeG1ldElTdXFH?=
 =?utf-8?B?YkxQUDJZUFRSMGxicDlYR3BDUWk0T1N2TWM1cWdtOEx1RytaaHFPcHRnVW9w?=
 =?utf-8?B?QUJUNTBCWGhMdFBNWnpuNDZpVkU3d0VPRm1ON21TMWxId296bzN6WkJuZm1m?=
 =?utf-8?B?d3hTaitockJEbk9pS2s5Y1dmSCtjVHJkQ1NDdTRrWmN3ZDQ0ZGZaZ1RwekdY?=
 =?utf-8?B?c2lPRGd2OVI3Z3F5WHF3RjBORFRQSDBUYnFtOU5BQkU5T29Ea3NTTnN6cU01?=
 =?utf-8?B?N1pKMlNzVlJwQmg0NkdoQ2dFVm1xTlZ4aUNZNjE0TXNYY0IwOEN1clJ6ZDM5?=
 =?utf-8?B?L0x2VlR3b3daT0YvZ3M4ZWdZWG9LMXZQanF0WFpZNDhJTkg1THB3WlV5RlBx?=
 =?utf-8?B?Rlp0VXRzc09EWC9ucUJYNXMwVDR4R044LzNrOExwdmpYb2lUREplNnJrcnRJ?=
 =?utf-8?B?WDh1QVloVTZKUE5sSStyNWN4WkdWSE4wQzhnR1J4cVJwVE14V0Rra0Zzajdt?=
 =?utf-8?B?alJobXl0SmMrYjNoQlNTVkZiZC9QR2V3ajJ2OU9IaXBTcjFVemN0eWhKM1Z0?=
 =?utf-8?B?bjc1aEdpMituZXZ3aDcyVFVidFhTcWlkYlN2SkJpRENkQWdZSDlLNWNFMU9F?=
 =?utf-8?B?NFFnNWhBNWZTV2NGbVlTaTBZMXZWeXNENzV6WjlpSWtSMy9DNDE4eGppZlJN?=
 =?utf-8?B?RTB0Zkk4dlovZXdYR0xSWFl2RzhoZEZaMzI0cjIwZDhSNlJtSGFtb2pyazJV?=
 =?utf-8?B?OFMvMGZrclhNbENxZE5oS2NTQTFiY0ZkWEFpaHliS1prcXF4cUorR3N1OFlU?=
 =?utf-8?B?dkFRMlp3dUdUVXBMR3N4WWNBbERGSFJuQXVPZ1pKK0dDRmticnFRZ3Z4clgz?=
 =?utf-8?B?YWk1Z0lQam5CdTFNSklicVF4Z2NJR1Z3VTJZVndHQ3lNUGROODgxcnYvY0hO?=
 =?utf-8?B?eTJjWmxiTGJsNHhPdkVQUWZaVTBEZDUwYXhBU3lxMjFDQjljaFhNVjlJbUU1?=
 =?utf-8?B?cjNzbDNpZjBjbmxkblBvR1JyZU1JMHVBRFY1Mm1BbThEQ3JOekRSbG5XWFNV?=
 =?utf-8?B?L0pBR3JFTUVuV2tZSGMwT0pXUmNPcktXK1ZMenZ2cjFreGExMC9aY2ZodEJy?=
 =?utf-8?B?OVhqa0hjdWxIc2RiN1VReFV5bXh4Zm1oQ1lPcW0wVEdvTUc5MFVHZUdrUnRM?=
 =?utf-8?B?NFQzSW1wSDRqTTJjQk9TbjQzcDVSZHVISkNNQ3J2WlIyQStCNVp1MW5oUUtT?=
 =?utf-8?B?dGFUcStYVGZoVUhURmpVMlVsYW9FUGJOMzlKMUFGR1ZxdVFFNVhqYkhmYVhy?=
 =?utf-8?B?QUNVOHVtRDBCd0hIY3ZjZjRtbWdOdno2NFFlbTNuWFI4NU9FNG0vTzQ2Zjha?=
 =?utf-8?B?VTJZTHlTMHhGK2ZORTU2S0hQSlE1REMvMndybGZubWFRVmowNzBHT09Ka2dp?=
 =?utf-8?B?Vk9rL09vT2EvOVEyYnRsSmplYk8ybktnM1hmUU0yUURhVm4relRnaHdHanUw?=
 =?utf-8?B?Y1B6SGVFdmNkb284eVVlS1VkYTFCY29kZUZ2eXRxaVZ4cng3UVFvWmVQTGF0?=
 =?utf-8?B?NmRPcHZDUmYzeGNMVHppZ2RoQTh0eldvT2tHb1cyc25jbVlaK3VqSkJYL0xs?=
 =?utf-8?B?UTQzMnVnNzRnN3pCNldGK3VhbG9Hd0cybGZ6THBKWnhpNENYSHV2U2VGOWhR?=
 =?utf-8?B?emY1Z1NCMzVQUy9kRE1YbklaQ0J5UWlrbWlSUVd5ZUQrMjNILytRL2RLc2Zw?=
 =?utf-8?B?WE5oZFlqOVhXcjFIWTF1ZitKZU8zL0taUkRjUFpDbGE2ZEZLTmZYT2NrL3I4?=
 =?utf-8?B?WUFCYmRCN1lic0pNYVFDSy9kQXlvQ1VnMjJDaU50Z1BOeERwWFYvUTF0SEhU?=
 =?utf-8?B?SE80OHk1b0dJcmhpeFhpZnJodngySzNEWVpxcHdyZHFYdFBtOUo4TWgwRk9j?=
 =?utf-8?B?QTBpZWwzQXlRTm80UmpmZmc0K1NuY0xMbmJkZzFQb1crUnRpL3FJMDZhNm5H?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd278e5b-3363-4da3-1712-08de1c7dd0df
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:13:03.5349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgULaGbEwRjWOV9JShGQz1J4BBY+rJ3t4ZrN68aXoDThD+JsKaqwwootU8yaoUEFAfTWDix61NDYsYTSUs+4E3C4gOqOBaSSZj1ZCbSQLHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8038
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

Vendor-specific VFIO driver for Xe will implement VF migration.
Export everything that's needed for migration ops.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |   2 +
 drivers/gpu/drm/xe/xe_sriov_vfio.c | 247 +++++++++++++++++++++++++++++
 include/drm/intel/xe_sriov_vfio.h  |  30 ++++
 3 files changed, 279 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
 create mode 100644 include/drm/intel/xe_sriov_vfio.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e4b273b025d2a..eef09c44fbde6 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -184,6 +184,8 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_sriov_pf_sysfs.o \
 	xe_tile_sriov_pf_debugfs.o
 
+xe-$(CONFIG_XE_VFIO_PCI) += xe_sriov_vfio.o
+
 # include helpers for tests even when XE is built-in
 ifdef CONFIG_DRM_XE_KUNIT_TEST
 xe-y += tests/xe_kunit_helpers.o
diff --git a/drivers/gpu/drm/xe/xe_sriov_vfio.c b/drivers/gpu/drm/xe/xe_sriov_vfio.c
new file mode 100644
index 0000000000000..5aed2efbf6502
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_vfio.c
@@ -0,0 +1,247 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <drm/intel/xe_sriov_vfio.h>
+
+#include "xe_assert.h"
+#include "xe_pci.h"
+#include "xe_pm.h"
+#include "xe_sriov_pf_control.h"
+#include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
+
+/**
+ * xe_sriov_vfio_get_pf() - Get PF &xe_device.
+ * @pdev: the VF &pci_dev device
+ *
+ * Return: pointer to PF &xe_device, NULL otherwise.
+ */
+struct xe_device *xe_sriov_vfio_get_pf(struct pci_dev *pdev)
+{
+	return xe_pci_get_pf(pdev);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_get_pf, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_migration_supported() - Check if migration is supported.
+ * @xe: the PF &xe_device
+ *
+ * Return: true if migration is supported, false otherwise.
+ */
+bool xe_sriov_vfio_migration_supported(struct xe_device *xe)
+{
+	return xe_sriov_pf_migration_supported(xe);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_migration_supported, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_wait_flr_done() - Wait for VF FLR completion.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function will wait until VF FLR is processed by PF on all tiles (or
+ * until timeout occurs).
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_wait_flr_done(struct xe_device *xe, unsigned int vfid)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_wait_flr(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_wait_flr_done, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_suspend_device() - Suspend VF.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function will pause VF on all tiles/GTs.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_suspend_device(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	return xe_sriov_pf_control_pause_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_suspend_device, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_resume_device() - Resume VF.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function will resume VF on all tiles.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_resume_device(struct xe_device *xe, unsigned int vfid)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_resume_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_device, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_stop_copy_enter() - Initiate a VF device migration data save.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_stop_copy_enter(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	return xe_sriov_pf_control_trigger_save_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_enter, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_stop_copy_exit() - Finish a VF device migration data save.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_stop_copy_exit(struct xe_device *xe, unsigned int vfid)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_finish_save_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_exit, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_resume_data_enter() - Initiate a VF device migration data restore.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_resume_data_enter(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	return xe_sriov_pf_control_trigger_restore_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_data_enter, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_resume_data_exit() - Finish a VF device migration data restore.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_resume_data_exit(struct xe_device *xe, unsigned int vfid)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_finish_restore_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_data_exit, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_error() - Move VF device to error state.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Reset is needed to move it out of error state.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_error(struct xe_device *xe, unsigned int vfid)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_stop_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_error, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_data_read() - Read migration data from the VF device.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ * @buf: start address of userspace buffer
+ * @len: requested read size from userspace
+ *
+ * Return: number of bytes that has been successfully read,
+ *	   0 if no more migration data is available, -errno on failure.
+ */
+ssize_t xe_sriov_vfio_data_read(struct xe_device *xe, unsigned int vfid,
+				char __user *buf, size_t len)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	return xe_sriov_pf_migration_read(xe, vfid, buf, len);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_read, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_data_write() - Write migration data to the VF device.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ * @buf: start address of userspace buffer
+ * @len: requested write size from userspace
+ *
+ * Return: number of bytes that has been successfully written, -errno on failure.
+ */
+ssize_t xe_sriov_vfio_data_write(struct xe_device *xe, unsigned int vfid,
+				 const char __user *buf, size_t len)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	return xe_sriov_pf_migration_write(xe, vfid, buf, len);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_write, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_stop_copy_size() - Get a size estimate of VF device migration data.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: migration data size in bytes or a negative error code on failure.
+ */
+ssize_t xe_sriov_vfio_stop_copy_size(struct xe_device *xe, unsigned int vfid)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_migration_size(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_size, "xe-vfio-pci");
diff --git a/include/drm/intel/xe_sriov_vfio.h b/include/drm/intel/xe_sriov_vfio.h
new file mode 100644
index 0000000000000..bcd7085a81c55
--- /dev/null
+++ b/include/drm/intel/xe_sriov_vfio.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_VFIO_H_
+#define _XE_SRIOV_VFIO_H_
+
+#include <linux/types.h>
+
+struct pci_dev;
+struct xe_device;
+
+struct xe_device *xe_sriov_vfio_get_pf(struct pci_dev *pdev);
+bool xe_sriov_vfio_migration_supported(struct xe_device *xe);
+int xe_sriov_vfio_wait_flr_done(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_suspend_device(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_resume_device(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_stop_copy_enter(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_stop_copy_exit(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_resume_data_enter(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_resume_data_exit(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_error(struct xe_device *xe, unsigned int vfid);
+ssize_t xe_sriov_vfio_data_read(struct xe_device *xe, unsigned int vfid,
+				char __user *buf, size_t len);
+ssize_t xe_sriov_vfio_data_write(struct xe_device *xe, unsigned int vfid,
+				 const char __user *buf, size_t len);
+ssize_t xe_sriov_vfio_stop_copy_size(struct xe_device *xe, unsigned int vfid);
+
+#endif
-- 
2.51.2


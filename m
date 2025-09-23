Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAD5B95CD6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 14:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A3F10E5F3;
	Tue, 23 Sep 2025 12:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WF0D+1wh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012041.outbound.protection.outlook.com
 [40.93.195.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C259B10E5F3;
 Tue, 23 Sep 2025 12:15:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CpxxhRqx59AVGMcXAC9ybuegbp4J78O4GABoLNoRQfa0vD4DJC3NUb+gbtRH8PrKsTWEHTnUepSSSUfdrsg/xzqNeD2uFC3AheBGHjj/HbnpT5uwIqW3EAphUjia4CmX87qWLaIZzu702RwWrhUB7qCCSGOrvQsyEekJG4LCOBPmLX/wp7HctakoGaF0xgTNUTmr5XEHbm3VnwRVSe9BkkafM/9i/szAVSHgiDqVlMdgMtUGxaIbLBwjC1Gz0JF4FNoUnhxn+G6/DPbvn9CZ15A6ApwAnMlUec37U7gD/LMeWfiM1aQH39x5PyDw7swnsNcDZvdmBNZmrcQM1IoSMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4Xh2Fc0V9XXx3HejaqwN+kmwlwz2RdUe+5wrT1YUeo=;
 b=MzGsY61QLO/nOktdzmiM1zdeGcQr81j6pAAi0xHp6NVLCknA9cOw/rymYPcBYxVP8kiyohkloeD5YiyrVGmSsfw7GwsX6U83CyQbIB9esgRUAKQA3dqNpOeGiz6AGdChDJP4XHXIKFVFyp6rQfpZ+pyeNnUAbPkUbZT+zYJgF/mXWCDvrtiwp7P3X9y5HMXK/BUtRV5oiOXzwLwNG1F1ieVUQeqiZTp7reOWunMudzCF83DVeJW7aJXgZtE2d9eaABiWSVNQXUdIXc9THsZTiqiZJon8IHt5wPtomt1guW4OBfG/p9meTZkjzv4rOTyZI4CUulfqW4F2fX2NGUHJGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4Xh2Fc0V9XXx3HejaqwN+kmwlwz2RdUe+5wrT1YUeo=;
 b=WF0D+1wh6VVANN6JlkUHZplJ08o1r3tYra32FtqxVqh43R1csn99/uKpzw12xuN21h7jMCCdrXKwMcuZbG66fAt6xOsL7AP+TDW7UBGFGwwjrOQfUWL531b90ZtVUb9XrDvBtFzGicy5bHJvOhVo/66GGEmziFrPTsxRulLvIGnYKZaH665+honUOpGFe22ny1BP68FwLza/3Oj1UTn2EQcLuLgjhoLSvSa3mFvzdk8yDuw/FkmsUDYfmGf+Dj4vzSczOZfK86gwa/lGn663CLVvuwn8WxqCmYTbeJOWD9fi+QzKqIhxcKjA5XaDVjoI9zl2ADk8fhka2U6iYAHZ3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by CY5PR12MB6646.namprd12.prod.outlook.com (2603:10b6:930:41::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 12:15:30 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 12:15:30 +0000
Date: Tue, 23 Sep 2025 09:15:28 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Message-ID: <20250923121528.GH1391379@nvidia.com>
References: <20250918120431.GL1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <IA0PR11MB718580B723FA2BEDCFAB71E9F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <aNI9a6o0RtQmDYPp@lstrano-desk.jf.intel.com>
 <aNJB1r51eC2v2rXh@lstrano-desk.jf.intel.com>
 <80d2d0d1-db44-4f0a-8481-c81058d47196@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80d2d0d1-db44-4f0a-8481-c81058d47196@amd.com>
X-ClientProxiedBy: SJ0PR05CA0166.namprd05.prod.outlook.com
 (2603:10b6:a03:339::21) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|CY5PR12MB6646:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a1c98d5-4dac-4335-c5b6-08ddfa9ae330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3ZNUzhQMzJFWDNsc2dmbDN2NkJ4TFhiNVRVSGZmRVdieERMM21VNWdmZXFo?=
 =?utf-8?B?eGJxdmlRdDFrQjZkM0hvOHgybEI4ZTV1eWRlRUxhTHdhNC81SGZjVmFxMFRI?=
 =?utf-8?B?eit6cXlKSjNRUDhDalJXSzNTaTBwZ29GYU9Ya1FhUkhvRG8xYVJrOFhaRnhF?=
 =?utf-8?B?aHlMMUdoU0R2cWRiMXI4Vks4U0lEUDNtMk13Sk1pbUszZUhCUTMvQWNUSEdv?=
 =?utf-8?B?Sk9CajFpckVYZmVGK2tnSjZPUmFCaTh2ZDQ1c25VZEcvTVJza2RUWUw0cDcx?=
 =?utf-8?B?VDQydlJhL2R2U0FERjZwRitkOXIveVo5QkdUQ0Z0T0xoVlBFbjMrV3lLRmh3?=
 =?utf-8?B?QXY0amxPZStMYktuU3p4b3BKZHFlMWE4QUpYZHRGS0dPa1NKK0NYVWxFdkFR?=
 =?utf-8?B?eXlTUng2SXk5bWNPTDR5L3VITDlPcUpJeGxKdFF5T09KTE43VnZFSHU2Qk1Z?=
 =?utf-8?B?RmJCMm1DRGFDek1sWndHdHIxR0VFeTVJWGorZkRqcFJ5UWxYNlRzMUVJM2g4?=
 =?utf-8?B?RTBvMUw4bFZ3N1pMUEd1UUJsUmkzT1VBNTRqUmN5Zy9sdkFmMHZCWldESU0w?=
 =?utf-8?B?aHJIU210bnA4d3FIU09FWU9rVXNJUzloUlBWTEIwN3M1WjRlQk0zeDV2cFIy?=
 =?utf-8?B?dExMNFdlRzB3RmdrdXI5bWJldDFjTkg5MWFxQmpzSEU0YkJZbmdUMUdzK0Mx?=
 =?utf-8?B?UGw1aFVPZlh0YXl5S0VrYW1LeEhzcUZUemxEM0ZNUDdSQVNrSWE5bzUxdmRn?=
 =?utf-8?B?UlNob0FKd1hYVWpPamxvRFJkeHUxbFR4Qm9OR3JCN2p6dGRXd3hsWm9KQ3Zh?=
 =?utf-8?B?S2tLNk03MHhIck15TVRQSGVxdFV0MU0xU2RhWVdxTmxoYWlWWTh3S1dILzZP?=
 =?utf-8?B?OFY5K1Z3d3d1V1NPUFhweFNVWEVEWGFKY1hHV1dCamRXdnNVT0E4MGV0KzAx?=
 =?utf-8?B?d0RqcXgwYkpyOFVCeVhrRjk3NHg1V0NWWDhGSmhCQ3hqNGdoaWpTWDg1WUNu?=
 =?utf-8?B?U241c3g2bjJGOHZiT2lsMk5IY3JjNGpnVlBXVVd5cEhySU5PTklNQ3k5dXM1?=
 =?utf-8?B?SC93MWJVRFpTU1N1TnR0eE4xZjVmT1YvcnBMdDVmeGl0UVBScXUvV3ExOUJi?=
 =?utf-8?B?aUpyaWZqdHdaSEdpMGwyQ2dZUWZDT3JZUU9sWWZYbXJnMy8xRy8wRm4wZUp3?=
 =?utf-8?B?aWV5bzB3S1ZqTlIvZTRCYmNvbmlHQ3h0RTd1YlN3TU5mbmZzUUkzOFJZMnIv?=
 =?utf-8?B?Y1hsbGYxRkdxcmduSGNmVWFiZldBUHROR2dlV011OEQwUlFMMFVzY2RFbE9w?=
 =?utf-8?B?L1BVaE9DeW1wZHl5Q25WbWJBVHJRMG5acHkrQitaVFFzMGRESHhOSXlBSms2?=
 =?utf-8?B?UDQ5dXF6WERocFZmYnlpbXllVVZYa2IvVHhES3B3Z3pWZjdmWVpkcU1SUktO?=
 =?utf-8?B?ZVlmMnE3NTMzSnBGUzdpRjhYSDBIZmRRbm9selJYQ3lSNWRIWm5PdFNaTkU0?=
 =?utf-8?B?NkR0T09razRKanlWdWs5T2ZJbmE3K0ZUalJUdjk1by9kQm1NUTVmYWIvVFZq?=
 =?utf-8?B?K25DVTBHQnVZUTZZM0hheTJIVnY3TE9hcmN3SnpkejJJYjF6c1JyQkVOQUZL?=
 =?utf-8?B?ZXZidUFRUC9QZVo4MG9aQndhRVpkYlduMGlMT0FEU3hsMFhRZ2tkendHak02?=
 =?utf-8?B?N0p2SzlqS3AxTG1HcUxmTTA2YXR3Rmt0WEd5VEg1WWFlWVFIbEpYWWZjMzNr?=
 =?utf-8?B?ZVNOMVVPNGFrNytOUHZuTTB3MVU0c1RQVGxUZllQY01rVzlOWTQ0NEJldmlw?=
 =?utf-8?B?dDhjSGZvdktmVXFFUFNjVFZVWE5nMGJwSU5JODdjRVpuVWdKOWtQSEhqWG1q?=
 =?utf-8?B?c3NEakQzVThGd1NXdUhOSFlPVDl2OWJBMXR3THA3YXBIcGFvb3BGL1ZhbWtx?=
 =?utf-8?Q?I44eHkCz+lU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5757.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVJTQVpxQ09GeGZVWmIvTkJIdDNXeWV5djg3eDNWMmRzenB0UGcxeDdLTVNv?=
 =?utf-8?B?RjBUVmhDbVlPZFVIUUlwcHhTR0xOU1Y5UzJpcm5JeHNkZzhSUXVCam5YeTNQ?=
 =?utf-8?B?dDNic1V2Mitlby8yc3dOSzRQZ25lSHI2Z0RXdXJhWE9PQm1jbDlpT3NPTUtJ?=
 =?utf-8?B?NmFLRTZZYlpzM1NJczZTaERVMncxNjJkL0FsQzIxakZLcGJSTjBrVm1UQXF6?=
 =?utf-8?B?Yi9pK0w0eTNhK0hhTmFLN3VHT0VYMThhZ1k2OWEyblhuUEtscEQ1MjBwZHcv?=
 =?utf-8?B?M2hHK2VEWVpiajNONWEyeGM2TUtjem10akJ3dWZwZWJmWlN5SjhoZkhPSTVU?=
 =?utf-8?B?WXh1SExHbElwWk5CdGdvcncxNkp1clJueVJmZERLTWwrYkwzNlZ1RkNSRFgx?=
 =?utf-8?B?b2FGTmtIOUtBek5la29IUjljdXU1eFFsc1JHTXJrMGpwVmlMdDJ2WGxHSWx0?=
 =?utf-8?B?YzdZWG5WZklCTDFlUllBSzFKZkNqbE44UVdseWVlbTB1bWxuM1pHdHRZMzB2?=
 =?utf-8?B?QVlXT1NJQjRSRHc2b29IWGlCQWxsSWdvZUpHdXF0Y1NOZko2R2t5MkFXZTZH?=
 =?utf-8?B?dWxWTC8rb2Npc0t5UEE4SUFwR09nZWp0NWNQWFZJM0pZOEp2OTRQb3l6bWJL?=
 =?utf-8?B?NVNlLzRaQllpQjJBa2xoVVdjN1JxWUJoZytJRTg2cUthMFNLcnBjRHNZRlQ1?=
 =?utf-8?B?RnlXc2JrdG9iN1F6MzdLcXd2REdTeVZZSDM5ZDZPeTBua0NNY1B0aWhKSTBH?=
 =?utf-8?B?NzI4d2hZZk1kazNHRWo1aGxtSUwvbHdmU3NkcHp3VTVLcjE0Y0IzUjVPTDdX?=
 =?utf-8?B?TFE0anh4dVJOYXBMcXdpdVZzMUhEN0JxeXhvemgycXFWbFFUUzRlQzg0S2dJ?=
 =?utf-8?B?QUN3NUxFNFYyK3I2VHYrUDI5TXM0ODJ3ckpCWFArcFdwWGNYNXFoWFN6bHZK?=
 =?utf-8?B?TkJqQUdCLzB6QThaS09vWGVYSml3Q0RnV21pTzY3blJTZmpsVkoyZ3BQVXlu?=
 =?utf-8?B?aWd5NUFFcVFhdlJOZGFDVTQ2VFJmRnpraWFJNm5nZWdsRFQvMmM2QkdMT243?=
 =?utf-8?B?MmFMN0dzWkJMNTQzZ2hTWC9EU0RYZTY0ajk4M1lJS1ZwenNQd1pLdE04Y0Fa?=
 =?utf-8?B?OU5hTUZDcStiSW00VmpjMWZxbkZrNGdrRHp5TnVicVZ3bTlzd0luL3JXTytB?=
 =?utf-8?B?dmFJVklOa0ZWU2RJek9UeWRPYWlDQ1JnMVZBamlwdUhqWFk1YnRsdkFzbEc0?=
 =?utf-8?B?anhnM0ZpRS9BTVFYKzNNWmlobUpJK2ZNM3pCNEdFSHI5Sm5LM2t2Z1R5NVpz?=
 =?utf-8?B?YW85ajNwRFdTTXZyck5Cc3BQZC9zSWdCbXFqWHM4alNDYnFIaW1hanNDS0p0?=
 =?utf-8?B?TW90dEpKMVRGY1pZSkNabURNbFdZcGszSE5ZNjJpMnNCRm1HNW9Pc1JKVWxR?=
 =?utf-8?B?RVY3WjRkUVZhdkJ6NmFmUTAweFQzbXh5ejJpUzdtNGVyN2NCSTZJU1VTVUY2?=
 =?utf-8?B?R1owajRWUXN5UjdBdzlsd0FxdkdsOW5sSTdUcU1IZ3RwcUJsMTdTMkNXVDBi?=
 =?utf-8?B?eWp4SnlpSmRwek5WOC9mNWJkUWxvaFg4QnJzNm1rblRnMytjUVFiRmhSL1JE?=
 =?utf-8?B?M2NqYzVHWFpQODUwc0Z2SmVWQUhPc1VkdVcwdHN5dGlBQTF3RFh5bTg2VlB0?=
 =?utf-8?B?YnJpc2tBU2kzNGMxMFZXMHBudVVVQVhDWU5oYWp4ZDljSHBhNGZQWFNYNk1R?=
 =?utf-8?B?eVB2bjVsKzFHaUE5a2lrSVdkTnlCWm85Y3FMVlFMZFI5eVlpam5sWkF2NGFl?=
 =?utf-8?B?V1AycFBHNU1sc0MwR0I3T0haWFgwQ3RoSkQwNnU4QVQvU1hNS1dVSTRORERH?=
 =?utf-8?B?T0o1ZTV1dTQ2SHQxdmoySk1nWHBMelB4bEt3elRUdlRIYnZIdVlwYnZzSkdl?=
 =?utf-8?B?S0N1a2FTTDd0R0t2bFhmdlBCK2NqRUs1MmpnR1gzd2tRY2ZoR2c4UFk2NGhK?=
 =?utf-8?B?cTBPUkpSWFV2L2NIZDRWcmo2ZWgvUDRINDBPY0l3VUpTbHIvUDd2UjhkbXpT?=
 =?utf-8?B?MzdqanJvaStNK2dvRkU4NmdsMitwT1M3SzVxeHNWK3NqdzQ0TGZZb3RRenl0?=
 =?utf-8?Q?dyDfgBWYrFqgIxryW0q4vyEUg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1c98d5-4dac-4335-c5b6-08ddfa9ae330
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 12:15:30.3716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWjrIdhVnJ7LsVwv+b2UIopF47Yu6IK/y1sAltsi1k1cX5lUejicuizufJZxPazj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6646
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

On Tue, Sep 23, 2025 at 09:52:04AM +0200, Christian König wrote:
> For example the ISP driver part of amdgpu provides the V4L2
> interface and when we interchange a DMA-buf with it we recognize that
> it is actually the same device we work with.

One of the issues here is the mis-use of dma_map_resource() to create
dma_addr_t for PCI devices. This was never correct.

VFIO is using a new correct ACS aware DMA mapping API that I would
expect all the DMABUF world to slowly migrate to. This API prevents
mappings in cases that don't work in HW.

So a design where you have to DMA map something then throw away the
DMA map after doing some "shortcut" check isn't going to work.

We need some way for the importer/exporter to negotiate what kind of
address they want to exchange without forcing a dma mapping.

> >> I've read through this thread—Jason, correct me if I'm wrong—but I
> >> believe what you're suggesting is that instead of using PCIe P2P
> >> (dma_map_resource) to communicate the VF's VRAM offset to the PF, we
> >> should teach dma-buf to natively understand a VF's VRAM offset. I don't
> >> think this is currently built into dma-buf, but it probably should be,
> >> as it could benefit other use cases as well (e.g., UALink, NVLink,
> >> etc.).
> >>
> >> In both examples above, the PCIe P2P fabric is used for communication,
> >> whereas in the VF→PF case, it's only using the PCIe P2P address to
> >> extract the VF's VRAM offset, rather than serving as a communication
> >> path. I believe that's Jason's objection. Again, Jason, correct me if
> >> I'm misunderstanding here.

Yes, this is my point.

We have many cases now where a dma_addr_t is not the appropriate way
to exchange addressing information from importer/exporter and we need
more flexibility.

I also consider the KVM and iommufd use cases that must have a
phys_addr_t in this statement.

> What you can do is to either export the DMA-buf from the driver who
> feels responsible for the PF directly (that's what we do in amdgpu
> because the VRAM is actually not fully accessible through the BAR).

Again, considering security somehow as there should not be uAPI to
just give uncontrolled access to VRAM.

From a security side having the VF create the DMABUF is better as you
get that security proof that it is permitted to access the VRAM.

From this thread I think if VFIO had the negotiated option to export a
CPU phys_addr_t then the Xe PF driver can reliably convert that to a
VRAM offset.

We need to add a CPU phys_addr_t option for VFIO to iommufd and KVM
anyhow, those cases can't use dma_addr_t.

> >> I'd prefer to leave the provisioning data to the PF if possible. I
> >> haven't fully wrapped my head around the flow yet, but it should be
> >> feasible for the VF → VFIO → PF path to pass along the initial VF
> >> scatter-gather (SG) list in the dma-buf, which includes VF-specific
> >> PFNs. The PF can then use this, along with its provisioning information,
> >> to resolve the physical address.
> 
> Well don't put that into the sg_table but rather into an xarray or
> similar, but in general that's the correct idea.

Yes, please lets move away from re-using dma_addr_t to represent
things that are not created by the DMA API.

Jason

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3853B9118B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 14:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFAE10E1A7;
	Mon, 22 Sep 2025 12:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="asytvnGL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010061.outbound.protection.outlook.com [52.101.46.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9941810E1A7;
 Mon, 22 Sep 2025 12:20:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1e8L0NhpQAvb6l0621/pUUSgRf6wi2k62KvVkSK6tg1NlKucQwUBHF4c4IVcF9ax3A3k+U+gMZpwwVfO6yE7usFBsXF5fPMd9FFGRRBoBWffE/6Qjqm6HE41DRBcB0C5mxrKH04thFyMf/DaMEc0DiN2QFLf/nXQ8+bB0hN+3zRrC5GXD5/EWdnkdSN2JP3Gr7skD2kNrME8ELqOYOt8ZbByqxS18R/UMhcinCxcotvuaMAAukGC0xIe8jYwzvZ/MLd1l8jW4yY4sK9T9GuoJKp1kQu8tn2qY9kAHNytLqc4KX2MOU9DTtqV42EwwcMm+h7mQZ/buokmmysgkU/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PriCuTcT16uMtpZlSCeO+rYcQXlJ7GF453vdGIHHbRc=;
 b=EgSS1Xiyp7um229V3rMJka1xJQQuEeZu021EabOgjH534Rsqe7hz7bfUb6pfCOEg4IR1289Yw9hDkJGWVOWF7H2DpILz9bDz+sbnFK+W3xRVv1aAAf08LhBM6Kx2uQAVdJy3+mGTXf4TPFX2Lf3a4xWXphaMHkdIW8MGpRysYnbBpuKiC+RG2b6x/TtUxcVj3watyRfJP0JazqiL91kun7CtelRldUb4gmoQsB7HfUGKaJKXTmiHTMb+E/Ee7oz1UMVyuBblEfcBda/LJtcwLhXZVH/A1HVnTLJVH4+VBkLtYB2pAmqNEiqJZqVKvvsXafAkt/hDHiFjVtYKpNBdoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PriCuTcT16uMtpZlSCeO+rYcQXlJ7GF453vdGIHHbRc=;
 b=asytvnGLvjAHsn9MHOoXBJLeDNO4RykD94VOo/st2tKYYvhVAk/JVeDSiyfoCw93KpOXvIM3xy1II4uzDi+cmAeYJUhadYEx7SIBvDlfuP7lMH/qkBmdRDBygMZblWQ94iHeZbkEzYyATmmbhp7ZgrmpkSkjRijpDZBqc3qmpGKTFdBEHqsw1TgwxsLSmAl1pF35FwdeAZVmGkRtV/Tq7Ah5RPxSofjzsrRHxTbdeXP08MKED4PyzxcuteJcM7HFxJ0aU7b2HTbP5+5ZhSTGi1oe2SsGJzQ5qd0IaYQ93K5QsG0pF/MG3ki2sK1dcp3wLCJVbhXUx/d4yu5Jr9J+IQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by SJ2PR12MB7964.namprd12.prod.outlook.com (2603:10b6:a03:4cf::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Mon, 22 Sep
 2025 12:20:20 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 12:20:19 +0000
Date: Mon, 22 Sep 2025 09:20:18 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Message-ID: <20250922122018.GU1391379@nvidia.com>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
 <20250915072428.1712837-2-vivek.kasireddy@intel.com>
 <20250916175709.GA1324871@nvidia.com>
 <IA0PR11MB7185186F6AB160AA7F8F0FF3F816A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250918120431.GL1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
X-ClientProxiedBy: BYAPR06CA0054.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::31) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|SJ2PR12MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d49540c-cefa-4c37-429a-08ddf9d2656e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWlQUDZ5Z1lmVWVlemtDTUZPMEg2NDZoQWtHbnZNcGZ4NTk5YnVQT0FwVE9D?=
 =?utf-8?B?K1BMaUtrNVFTWmYyYXFEYjgwdWFsUFpRSHBTYmdvNHNjTmNuOVdoVmZRVHFW?=
 =?utf-8?B?TlA0WGljbHROcGFIQ3VEYU1uYTZhKzZaL0U1ZUhidE5LUlJ2SWZENThGZ3NJ?=
 =?utf-8?B?T3NBZWdiQkpia2txelpoYlJpeFh6VStseTBjL0Y2TllXeHMyM2paTlY2NnFo?=
 =?utf-8?B?ZFFXZWpVSG1EU0Q5eUtWRkNEdU9IcldsR041bkJoVkxJYjdabnNEcXBHVHdn?=
 =?utf-8?B?V3FLYmFWNVl3K2ZGTVc1RDd5VUg5cU5XTGljaEVzVTdwbldIVVlVTnFUZjdo?=
 =?utf-8?B?NW9FcEFhZ2VBdk56M1kwdW5xdE1YRHl6UEEzQmNZVEhDbWlqQ0NVcDZCR0sy?=
 =?utf-8?B?NFQ4ZGR5anN6OXdBZnZlS3A0Mks2dWxGYmJHKzkzUitIQ25GaWxveDZZZXQr?=
 =?utf-8?B?Tk04YUdWcElWVU14dng5T2JkcEtCR1pKaW5LbjMzUWVOb3F5VkZ1ZktQY00r?=
 =?utf-8?B?MWV6RHpWdnZsZElpV1NWajNIZ3puSm01UjVRSlp2eTcxaEEwTmhVclVzeHNR?=
 =?utf-8?B?RVkrbzIyLzJPSWI1SWM1Wi9xYUthS0RlWmRrUzd5eVVBSHJxbkhvZzFrS3VF?=
 =?utf-8?B?TmxFUFJ2b1Rxak9odWhDZWQyd1RWM2lkMUtydEtzcmpZOVlzcEswaE5KcFk0?=
 =?utf-8?B?TGtXUUlHZ3VhWmE0NEkvWVhjR241dmFQK1piY2ZPc3FmcGVNNHFmTXRXcHp4?=
 =?utf-8?B?ZThCc3kwZVlFZWJ4VG1xakZ6TWVOUGhuRHN3VGJ3RGdGaTl4RkRTcVJZWmpi?=
 =?utf-8?B?VWJsYk9iQkJ1SnNBNGdXOWErc29PWitleFlIdmlNbjdSdXFmMHNxWnN5Z2NE?=
 =?utf-8?B?V3FaSXArQ05oQ0dDeVpxRGtJOEF2c0ROU2NGZDUrUFpML2tDeGtYRlU2anB1?=
 =?utf-8?B?UzBXWGVFMmN5MnRlTmZMVnhGVE41U3pweUdJN2YrbXBsdGQvMHV4ekdGM1pp?=
 =?utf-8?B?Z1J2MHZaYk84YXh6OFdPdjFDSmlST29hOGtQb1JxZi8wdHN2Z2ZlZFRQcVJy?=
 =?utf-8?B?aGFkVFRGc01sZ2ZNN3BvK05CYmxHbjhUb0RLYmxLZnR1Y2ZEcjNsTk51RlNs?=
 =?utf-8?B?NUFpb1gwSXovaDl4dXl5b1lObXFtazFWNkFnalVPTVVZc3lSTmJYblk5Wldh?=
 =?utf-8?B?TUJuczkwZ0NYa05aTlZQN01BQmwraEVVcWtMVFo0dW5WaXhXZVNiVlNuamJq?=
 =?utf-8?B?V2FEbHhjdHg0OWYyWjdIcDVQZFQ5UHczOUVvWFZseWhNMUFBWm82MkdOeGFv?=
 =?utf-8?B?eU50dGxkYUFYU2tjSEZOSVNGY1ZkWnRFY0JiWWRHR0RtQmtERFEvRy92c21p?=
 =?utf-8?B?R0FoVElSVjJ6UDNPUHVteDdPYlFTTXJlRWdyMU40MU85c3hBSVZUM2dPalBR?=
 =?utf-8?B?T2lkeXNDNDJ5aHZuenluOWhWWGF5K2UrNnBuN1pXbmtkQjA1QU9IZGxJSDVW?=
 =?utf-8?B?ZUc5eW1iVFcveCtnZ29tQjFhZTZJMzVnZzZjcElXNExSQm1Zdzd2ckRSdTM4?=
 =?utf-8?B?M29UbUtmTExmMUZORllSSFBIbXc2eUlBbzU3SEtydk5jSVFhcElVZStkOFdX?=
 =?utf-8?B?Y3hLWlBSSGZkdTdTbDkycElVcDVTZjZMQ0d6cnBIdTg4SXBGUU5RYmZtbjNx?=
 =?utf-8?B?ejRITUhxZStYVzU3NDhibVlvWk90bVBFWi9HaHBycXVBQVdDc25YUkllN0Zk?=
 =?utf-8?B?VHJ6c2F4SXBzM3U1MHlwK0tQMEg0YzNOZVVnMGR0bnlPb2wzVHp3WnVCQ2pH?=
 =?utf-8?B?bUI3UGx1MWNWMlFYeXRHK3hBczVZOVVXQ1lwTnNkdlh5eHdPaXNUK2IzWUwx?=
 =?utf-8?B?WFRIcytPT1JRZFNUblBiNmtlcUQ1TG9wekpONnpCWGFWMUpnRm85aHB5K3ZX?=
 =?utf-8?Q?deqaT+0fLgI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5757.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDZDUjhxUUVRSlpYVlhNT2E4UXBYd1lxeThEVHF5bEYzdkFKcDZzaHNWYmxR?=
 =?utf-8?B?a1l1SkUxUnBWaDk2SWlyWmJFRlBraEV3N3J1VHBmamJueEFwOU5ieHFLZCsz?=
 =?utf-8?B?VkUxdmxPaktpR3dOcEF3NTg3bkhEQ21JQUJrUTBXL3M2THdySi9lNTNVTGhY?=
 =?utf-8?B?c1VtMGVHeVdGaWNWRlJsdkVUYU5wM2tjcVNiSlM2OVBBY1h1MWhLaEJtL1VV?=
 =?utf-8?B?QXRMano5RUJlcC94VThzZG9pc2pzVTJKR0tkQytNMjVCMzMyZE9OMFozUzZB?=
 =?utf-8?B?N3BDYnpzTXF1bDFCU3hSdmgwaVBBbzFydUZyYnhwY0xKaU5oN0FOelA2UG9J?=
 =?utf-8?B?TVdXNjdyQTdaOHdrNUZXWmZGWU5tZHhVWGNRY2NmdnM4RGNWcFJGdWJlQTUv?=
 =?utf-8?B?WEkrZVFBL2dsUExnTnIvdEZuMFVSZlp2Y0UybmJLdklJN1NtR0orL3JrbERn?=
 =?utf-8?B?RXBiZkF0ZmE0U0hrbGh0WC8xdGxYb0NqUkI2Ulh3M3VwU1hhU2l4bnZNNkVG?=
 =?utf-8?B?Sk5yZjFRTkg1NEVVZGJCdlcwenl2anV1aCtNaWQyZVNyVHMxZlZFOEtXM3dj?=
 =?utf-8?B?Sml1a2htTnZ5T01UUjVRNnVheFp2enowTTd4VWJyZ0lSdlFZNk5FWG5hcTU5?=
 =?utf-8?B?Q0RWQzhGZkZJNVdPT2pLQUNiRzRZWkJGcUhuSm1zYVBiZkYza1hpK25ldWo0?=
 =?utf-8?B?NlNkZHRjYjBrcGh0US8zVEc0aEs2NGNwbTl6UmgxV2lNdWFCOURuc0N4dWhZ?=
 =?utf-8?B?WCt4RU16cG55SXRpTDVkRDc2NG1ZVkI2MEFLOXFNdnRvU3ZlLzFCOXFuMUxF?=
 =?utf-8?B?SFMwR3dTcUV3aU5jUVFkOVltem8zallKd0RoODFlME02MDA4RGIrbVIxZHVL?=
 =?utf-8?B?V2hiSTNCeXJlb1laL05lMEtlQW5DVXIrWmgyUEtBTlZVVUx4VWNrZnFxL001?=
 =?utf-8?B?RTZ3TFFMaE00VmswZ015cFA0WkwwaERSb1AvYnp6VktuQVlXQmZxTEFxL3Q5?=
 =?utf-8?B?Vlhpem0wQno3OXZzbDJ5TlR4OGZKZnN0VDVOS2VOQnpJUzd1bVN1VWFBZ3Nu?=
 =?utf-8?B?R1ZoL1RyVUtzTG4xbWRqRDFNaFFHZy9MZlJSbWhodHpvbDRQWDZVbHIzNzFW?=
 =?utf-8?B?eDlnTDNNWVh6dUt0TlptOEZ5RXhOWlFkblV2MnhOY0hVb3lZUGJCTmxVQUp1?=
 =?utf-8?B?Y21NcDlPejIrZE1RWUp3d0pFYmN5WnEyVmZaODVtVUtrZkZWcTRmWGl1R29r?=
 =?utf-8?B?UnRSS3pIbWN3SGpNbEdkVUphRmpoaWY5MHFDejZ0a1pLdUFFdHBLRGlBcVls?=
 =?utf-8?B?eVd3MnFxOFgxeExhQXJmNWpLanlRaEN2bUUwUDFwK1JPWUk3VmNnYjBGOXFD?=
 =?utf-8?B?MGVCSVVLVVc4bjJIMjRCc0QyNGFPYnF0NFpMQmdVQ1o4NjNETHpoSUpDRHlo?=
 =?utf-8?B?RDJVeXFnSWh1d2xIK1Q4K0MvL0w1QnE5MXQ4VDMxbEU2ZFBaeWJTRDBjRWJT?=
 =?utf-8?B?dDZoNzBJdDJlRjlMSktCWWRGYnovRXBqelo4aGU3WFdMNHlBc3M3dXdTd3RJ?=
 =?utf-8?B?eklmR3d3eTUxVGdxYWcyVmRnZFpDd1NIYjRGQTlpSWlNbFYrQTNMUlhnOEtu?=
 =?utf-8?B?ZmhGajhUZHgvVmc1UWx2RVVOZ1lJdEorTE0xYitCdkhab1Z6c1hWd0FNeS91?=
 =?utf-8?B?NER3NXUyeHcyYmhBTU9GSkdvNHlXRmFjc0t5RHYrc2Nib2FYd080a2pNYklh?=
 =?utf-8?B?V1BoWVhMNlBCbkZldG9VUEp3aGtxNE1GWnk3TkdBR29LVVlnTjlIbnBmV2l4?=
 =?utf-8?B?RHRvUi9aU1pWVXFZSm9hc2x1bTNPWnNraW14cVFlWEFCSENOUnBzQlR3ZlpS?=
 =?utf-8?B?TW1zWml5MGFuamR5SmZRVFJHd1M3Q2NqaWk0aTJybWhzaElsRm1wSHZPdnI3?=
 =?utf-8?B?T0ZRYjJlNlV1MVRSNlpEeXFWdUxac2x1eVNlQmV0Kyt0S1JEQUNlNU5GbGdX?=
 =?utf-8?B?NXhIbkgxTEFCcjZ2b051Z3RTanBDTGM4TkRVZ1VQVnk1WUFxeHBOQWhGaGdm?=
 =?utf-8?B?c1VvMldtSnRNVkY2aS9oN0lrdFI2TEQvQWZlUDgycEZQdHpldHUwSUplZkk5?=
 =?utf-8?Q?/Jdw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d49540c-cefa-4c37-429a-08ddf9d2656e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 12:20:19.8178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fpVC45fKB2githgHTMP69LSiSRYpLMEw3oJS8laip4ayCW9OUUU1YsKYSTC+GXi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7964
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

On Mon, Sep 22, 2025 at 01:22:49PM +0200, Christian König wrote:

> Well what exactly is happening here? You have a PF assigned to the
> host and a VF passed through to a guest, correct?
>
> And now the PF (from the host side) wants to access a BAR of the VF?

Not quite.

It is a GPU so it has a pool of VRAM. The PF can access all VRAM and
the VF can access some VRAM.

They want to get a DMABUF handle for a bit of the VF's reachable VRAM
that the PF can import and use through it's own funciton.

The use of the VF's BAR in this series is an ugly hack. The PF never
actually uses the VF BAR, it just hackily converts the dma_addr_t back
to CPU physical and figures out where it is in the VRAM pool and then
uses a PF centric address for it.

All they want is either the actual VRAM address or the CPU physical.

Jason

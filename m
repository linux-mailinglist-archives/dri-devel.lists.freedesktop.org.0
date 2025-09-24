Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A41B98DF5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 10:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128D110E10B;
	Wed, 24 Sep 2025 08:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dFGbH/xI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012005.outbound.protection.outlook.com
 [40.107.200.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99BC10E10B;
 Wed, 24 Sep 2025 08:29:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cf7FKdykaB+bSSJb3sYXWwaQg0dL6yUjyw+wFHuM8DoIL+Au/IxMVeDv2sn0pNaamRQ2PrcxdSG04TNMPUXG9x9f559tWYj58pESf2rUnvRV+8E3rpWR9WrAcw40MhwkKqkCoBNnx9YYpc/OXBfNFRn2CQc6hXgC+G6qG7M+ZZGvCUxVZZZOMaCdoyOjd3foDVynzcR+hZUUpJl4YkED29R+SMoHAHrwXJtbi1rvt2n2x0Swy0+wN9Z3Daq8cVwKq4hrqiHiaHTrXlEv/j/jMNBKMMSZYTSA/dQoQrRGfboNA0tkgGfHmeW+BNroZWRI+xq4yKjjJan1dt3vTL95bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNKnK2w3aTzboXd/hZxnLh75yLm1kQe8BI1tK0f3XVE=;
 b=oe6LM1HSZy0ufdiI0wuCTqBArPmTY0Yfu582U/osz+CjtDyyG9VLAY6ToKh04w/yl7QRu6M7ydX1i06vWSp8Zq7F9S7EWKc4c/JmwQd2fpKN5P+iUwGKusYyfxZ0KT7NPJ63Nveumw0Hjx+Oru8tTjiCcEWJ4GihtHuExYvAioKR42KoJuEq4UXBiry4VKPc+trLVZ1nfo/Ei2DjRSDxweHKrkI2x9U1F+eFN6m/NpPGZ4QzOzehTmilOcgETH7Xrt0LBS5y45smGXjWe6vwXgkjJBZMA8TJOGM7gNii8C6HQLFQwOsKq1M/624QBuvhu2HbYU8nd1ur93A4KIlCeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNKnK2w3aTzboXd/hZxnLh75yLm1kQe8BI1tK0f3XVE=;
 b=dFGbH/xIbJ5H9+Ovnvua6m56NUyD4UO7m5uH8tv6FUZO2bmfC4WhVGi7/s1DqlNYhBtbEdisRa06OYoyvPKYncH1HwrfmVmBxxuYcC+pOPjK35LbACFbBAZoaAJO7KkQ6vdW22/q8YNiMAkw52sr/x1w7sxe1/K8lOJv8W2J8DM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7200.namprd12.prod.outlook.com (2603:10b6:806:2bb::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 08:29:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 08:29:15 +0000
Message-ID: <863cb79a-36d1-4db5-bc76-e46812c85601@amd.com>
Date: Wed, 24 Sep 2025 10:29:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
To: Matthew Brost <matthew.brost@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <IA0PR11MB718580B723FA2BEDCFAB71E9F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <aNI9a6o0RtQmDYPp@lstrano-desk.jf.intel.com>
 <aNJB1r51eC2v2rXh@lstrano-desk.jf.intel.com>
 <80d2d0d1-db44-4f0a-8481-c81058d47196@amd.com>
 <20250923121528.GH1391379@nvidia.com>
 <522d3d83-78b5-4682-bb02-d2ae2468d30a@amd.com>
 <20250923131247.GK1391379@nvidia.com>
 <8da25244-be1e-4d88-86bc-5a6f377bdbc1@amd.com>
 <20250923133839.GL1391379@nvidia.com>
 <5f9f8cb6-2279-4692-b83d-570cf81886ab@amd.com>
 <aNMnHJwWfFPgGYbW@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aNMnHJwWfFPgGYbW@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7200:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d78ad4a-236c-4195-e5f8-08ddfb447239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czErOTN3c1VoVkc2endQZk1EN1h0Q2hJemtDeWVOOWw3QU9EWS8wQnBIZXZ2?=
 =?utf-8?B?aWVLeWp1SFJRQ1I5ZTRVQVFtejZVUW1YMGpteWh4Z0E3OUYyWnlFbnBmZU9U?=
 =?utf-8?B?ZEQ3Mjl4RGN2c0VyZkY0RVE0cWI3UWJWNGVTYnBYeW5uUXRsTE00ZkFGZWE5?=
 =?utf-8?B?WitPK3g1MDBNT3lkYkZZTEdtNFdmUzkraS9uZHZsSTJuZ3dQMVloNHhZUldU?=
 =?utf-8?B?cGwzU2FweFl3ZU1uRnFVSnNSQXUyOWcxVzBRbEIzOXV3K1RUVDdqY1RjRE9u?=
 =?utf-8?B?VnZsVVNMTEVBcUFDbmZtQlBrVnlwNUpvK1dDYkhId3FXai9rWEJqa1R2UTBJ?=
 =?utf-8?B?WlJYV0JSZHJiNW42SXFzMTUvc29LWllBWWRWalNKMUViVkN0bWRoVzhiS1hB?=
 =?utf-8?B?dkpaaUdmUGh4ay91VFQ3WEdKU2x4NTZRUU8xMVZpVnkrR0dWNW1vejUyU0t1?=
 =?utf-8?B?MkNscmdCQkpGUzY4WlVTNzhWdTVSRWh4cWJwbjVkM09NOE5NWE5JSjZHTzV2?=
 =?utf-8?B?TGVLSEpiYVVobEJ6d3J0Y0c2dmlPWFRFdmdpd3dOakd3Rzd5eDBsT0kwMC9m?=
 =?utf-8?B?cWNLRDA0cCtoengybmtobWlEUEhQcTFVcFZoK3ZzRWNDVDZuMDZZMm1aTmNl?=
 =?utf-8?B?MENvOUx5eUdwWGw4TVpEL3ZnaGJKZm82aWlBMmdQWTdoSEdISysxdWs3Vk9s?=
 =?utf-8?B?ZHBlQTlLM25UbzNVQWN4R3JmTWJFZkxlUXFDVEsyVnRvcFRwMy9JTGNVZHB4?=
 =?utf-8?B?RTI1SVIwaXJkK0M3dDJ2eDJ5cVNwTHpsRUlwYmYwSm13UWdVRXFtRytQZzlN?=
 =?utf-8?B?TVRVelZxeGpsRDlvdjRsRVdJRStnYXdGWTBMcFFKR3RwZHRyYlFROTU3R29I?=
 =?utf-8?B?VW5aYlptK0ppUTFpMm9BRWVVQm9Gd3pNNjdIVCsxUlpxbGRCQWZuZTBoWDM2?=
 =?utf-8?B?UzI0cmdocFN0Y0o4aGd0aDdXUXIrb3p2T3ZlalZ6cTJjUzF5Mm45OHA5WFhr?=
 =?utf-8?B?NER6OGM3UGFRSXF1b2FQaE9MdnhKbnd4aXVnbUdBOGZzUHBwQThNaHEwOE5h?=
 =?utf-8?B?SVovVTFkNnJLRkdLK1AzcVJWYmt1bW5CTTNyZTgrL1RqdkJEM2pPakFzeElm?=
 =?utf-8?B?QmQwOXV3QnI5UzBRKzBDc2cweXRvVjJkWWNmQ1VZbXlSMnNLT0tCT2dVVkhW?=
 =?utf-8?B?UHF2SmRoK3dFZ3cyWXk3ZlNDMUcyL3hyUC9ycjFteGZiVUdTUDBjem5hYzFy?=
 =?utf-8?B?M1g0RkM1VTI5bkM5U1lDV0ZpVkh0anVEQmlaSUNrTWN4WVJlSDROK1Q2RFRw?=
 =?utf-8?B?VURNYmp0aVZJYlMyNWQ3UjgwWEJ4YW1JRGhhR2JLdUJwMmZXcGlTcnJnKzIr?=
 =?utf-8?B?ZW9OVWtiSmVkOW54TnFLelhtS2xDNkhWSzF2WE9WajJRWjNaOWNlR3ZsMTBp?=
 =?utf-8?B?a3FjQUJJTVJVRzFLVFA1em1nakdhZC9UVXRWYmNSTk1HekdEZnpIenVickRX?=
 =?utf-8?B?TFpFTmdZdFJqb1NrMm5ZM0dZYitHVldqd1NzWUYyRXFCT3B0UmIyRXF4SlhI?=
 =?utf-8?B?N3cvRVBsWjVlRjNlMVBtTjlzNlRkTHg3YS9uQmIyVEd6YjhZeVpJYlFOb2VU?=
 =?utf-8?B?Q2FjZzFNTldVYlA5aDRTOUZpVDRUMUk1ZEgzbmFNWlhMTTJNbjhieWhROXdt?=
 =?utf-8?B?STh3ZGc4eEpvU0F6ZzNMNldtc0VLN3hzQ2FoSlJRY2dHQ2lDWlI1Nzg2WEZU?=
 =?utf-8?B?T2hMMDNkN2VHa0FaWlpBT3hWZHpDYjdCSytSc2U5THRpY2pwSmR1VGF5ZXJa?=
 =?utf-8?B?V2tRUTNLcDdFVzdCaTFFZWpxVEZNRlIzWjRDczJ6SVdNamp5WkF1OHRJUTJx?=
 =?utf-8?B?c25tajdFT2prZnJUM0cyS25jcE5PdGZnUXFKVmJhY3o4M0E5UnFoTXNKTHhl?=
 =?utf-8?Q?F4B7YbYBCfo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVZITEVCVGpNVUx3bU5SRXRVM0FSSDdqcUZDM3FSN0VldDlMVEYzcnQvcGxY?=
 =?utf-8?B?M1N3bjRTTnJxVkZ3SUhzZVZwNEYyR3lJY29OMURmaks1S0Z5b2pOSysrMkls?=
 =?utf-8?B?bHhlR0s1SXFqSS95aHp2eEhHQlVyNnU4RHVrNnArWmZ4bE9yb2hXN043YmpC?=
 =?utf-8?B?Rm0yMFpveE9XLzdKeEpob0o3cmZTZ1hLd2ljdWNDeC95VW4rZnd2NmJYci9Z?=
 =?utf-8?B?VzlYK1NLaW1TRStvb3hqT0lMNEN0Z2ladll6WERDVW9tckJUOU1Wa0Z3eE8z?=
 =?utf-8?B?NmFNNDdWVWpFZS95L2hmd29PQUdMQXNUd2ZucmswZ3UzRkVDTFZQdGZFL2lF?=
 =?utf-8?B?M2tLSXpHc2RrcCtvQVRIM3g4a0w3aUs0U0VGTkdoejB5Z1dhWVhUZWlENlVF?=
 =?utf-8?B?ZmY2SFNRVkdlc1pEUkNuY2Z4SkJ2R0hadlEwSXNzUDdVYVFaVDUyaE1nUWcv?=
 =?utf-8?B?MzhWY0gvTUU5dVJONVhQS2swN1R5YXpZdzlzb29OcWx2aUhYUWZ2c1FBZWVN?=
 =?utf-8?B?QTFXcmhUcmJ4ZEtPTW5XY2RQMkQrejVPV2ZXb1lzbC85eGJWNDMyRWRlUm9Z?=
 =?utf-8?B?TmVtU0kxeVhWc3lzUHRuYkR5ZkZZYXM4ZnhyYXZuTGh0MFpWMDA0VkYxLzUz?=
 =?utf-8?B?SnVkWDk2MzdqbERnSG11S3Z4OElCaGVaMEV4RC9senN1YzBWdVYvTXJmekhm?=
 =?utf-8?B?WW5HbTFWNUM1c2dEdHRwdDdHOThFRzJad0hVZHRaaHFGODBzY2FsVnRXYUVH?=
 =?utf-8?B?cDNzR2tnbnZqMkpwUzhXTUpnbDAwT3hjZjlWd1NndlFqVnc2bXBtVThQNlJN?=
 =?utf-8?B?ZnhSSnNYekkvU0taVHlqd2hQSExQcUJoUmVFM2hqZlowc0ZBUVRrbHB3cXNK?=
 =?utf-8?B?cHJuRDU0MDBGamFaeThiS1hwQVZualg4VlJUQktCQ2szRVpOTXpXVklsWFVo?=
 =?utf-8?B?bmVJSnl0OWx3SDBaTnh6WFltSkMrTmk5dmtvdEt4d1EwVjkyNU9CM3JyYnVV?=
 =?utf-8?B?NzdoZlVXRGN3ajNyNlJQMHdtbGZuai9pYThWd3c3YUVkemdhSXZ4SDdVeWcr?=
 =?utf-8?B?cTBLVVMwYmxGbXI0YkF1NzNxbVF2Vi9CcVczblVzT1AvanQvUHJiQ09XcFZK?=
 =?utf-8?B?aEREYnVNejQzTDRYcmhGdEZmQW8ybGRiT3VkZVpTMFkxLzBFMEswV1phZlR2?=
 =?utf-8?B?NksxU1RuUVlFTm9URi9Oc1o2UG1QMnJIMjZyV2wvbTNaQXJoSGdJbEw4VTZ0?=
 =?utf-8?B?S3ZwSXVIM2VxQlhDSUpEKzBFQ0tGMEZYUmVkbTl6TldRRXk3dkxtcjhIaG9y?=
 =?utf-8?B?WnczeGdhR0xvU09wOVREM29XZ1lmY0xPRktJc0IxdXRuOHJlRlcxSTZYYVVN?=
 =?utf-8?B?djNuS0tnUHQ2K3ZtWnVqa0dpcTlkcTNSMmZWL0gwZXppKy9PbitWNjFOWG1m?=
 =?utf-8?B?bDROdm9ISS9yZlR1aGpWb2dnNk9Pb3p6emN2L0ZpRVBnaDE4U2g1U09iUTZU?=
 =?utf-8?B?RmRRL3V2L0doSFkvdnk4aHdDcDJnUloyVE5NT0ZBWHV1MU4yQXFFanRMbjh4?=
 =?utf-8?B?VlBLN3hjMURSdnhPUmJHNFNMYm5BcEFoSHhDczV5ekpFOUkva0IwcHp4QXNL?=
 =?utf-8?B?eWc2MlZzZ2hWS3J4cjlLOC9kVHBEZ1FnS3UxZDJORUIrY09BSEpUbEdUZG5s?=
 =?utf-8?B?eXp2a2JNS29HODIybzFUWXVqNUNwbEpMOGlWNjdJWFdKTXZYekRWdk9jcVRC?=
 =?utf-8?B?Qm9JdGkxK3AyZkVkN1F0UzlNdGpXWmRocUJ1VGJRYzVPSGMrdmF2Vi9SVGVh?=
 =?utf-8?B?TWFVSlBib2hWT080REVqQnBDaFVqNmRBTzlNaytvQUxPR2phRnozODNGcTBx?=
 =?utf-8?B?Y0FMNGNsRXhNTkU2Z05POHo2WmdQbUtLYm9Ma0NXNjdVT21hak81S0JrSnMv?=
 =?utf-8?B?K2VSVWZpZjhVVS9GOUZNT1drblM4b05pZWJqMVlPTXRjSVpWSUZuWGJmV2Fp?=
 =?utf-8?B?a1BtRzBncEF6MjJtUDFqMDR2dW1NdHFQWEUyOU1uREtmbFgwdk1BWWw3TWNv?=
 =?utf-8?B?QWVDUEtuZHUzSHd6MG8rSElucEZtVjJwNk8yTEltY0hsRjVzZUtrL1NLOGh3?=
 =?utf-8?Q?Vk+JGzBm+DMK46IRnkDIQwoSl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d78ad4a-236c-4195-e5f8-08ddfb447239
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 08:29:15.0506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEof1FFqJMBjuNVRSSG4HG4GDjEgjNW71FjG83WY+YocEgsa/ht7TPVS8YFe1O51
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7200
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

On 24.09.25 01:02, Matthew Brost wrote:
>>>> What Simona agreed on is exactly what I proposed as well, that you
>>>> get a private interface for exactly that use case.
> 
> Do you have a link to the conversation with Simona? I'd lean towards a
> kernel-wide generic interface if possible.

Oh, finding that exactly mail is tricky.

IIRC she wrote something along the lines of "this should be done in a vfio/iommufd interface", but maybe my memory is a bit selective.

We can of course still leverage the DMA-buf lifetime, synchronization and other functionalities.

But this is so vfio specific that this is not going to fly as general DMA-buf interface I think.

> Regarding phys_addr_t vs. dma_addr_t, I don't have a strong opinion. But
> what about using an array of unsigned long with the order encoded
> similarly to HMM PFNs? Drivers can interpret the address portion of the
> data based on their individual use cases.

That's basically what I had in mind for replacing the sg_table.

> Also, to make this complete—do you think we'd need to teach TTM to
> understand this new type of dma-buf, like we do for SG list dma-bufs? It
> would seem a bit pointless if we just had to convert this new dma-buf
> back into an SG list to pass it along to TTM.

Using an sg_table / SG list in DMA-buf and TTM was a bad idea to begin with. At least for amdgpu we have switched over to just have that around temporary for most use cases.

What we need is a container for efficient dma_addr_t storage (e.g. using low bits for the size/order of the area). Then iterators/cursors to go over that container.

Switching between an sg_table and that new container is then just switching out the iterators.

> The scope of this seems considerably larger than the original series. It
> would be good for all stakeholders to reach an agreement so Vivek can
> move forward.

Yeah, agree.

Regards,
Christian.

> 
> Matt
> 
>>>
>>> A "private" interface to exchange phys_addr_t between at least
>>> VFIO/KVM/iommufd - sure no complaint with that.
>>>
>>> Jason
>>


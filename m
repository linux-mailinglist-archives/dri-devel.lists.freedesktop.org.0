Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E49CB987D7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 09:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4809F10E0E6;
	Wed, 24 Sep 2025 07:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GirZ7nQC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012000.outbound.protection.outlook.com
 [40.107.200.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2594410E0E6;
 Wed, 24 Sep 2025 07:21:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhzO9XJWNYH4isfNCRoHsGYFdgy0+R6j3ZyawujPWCM44T5dXLi2SsHIhxRFbWwrba5qGQOtKboKurZUx4DQ8aHfIFFptfOkqbqcocuWTL5N4Eo+dGst92r+nSbW62clOdWabFfGIDwI8yhluQyNgf5yo75HIc6jBVxfPxFPO6G59dpMxTFhwEweCgDzKimm5M7sb5zKU5f/AVHhDrQPLuL4mpPAnIKFkpPQ9y/6w6KXxya0N3MNUbuCxCnVi4Wx4x7+khWuOzAXSuo4HpZC5WVN/VJOgExCX/zc+sEpj0h3ISlg/Mq1lDL29kVufELF05SIsYjisqaj2qQ0PCXtBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tR5Vd/loExJsGDuUzhtcrsoFQr1+56e78PB+62aDEXk=;
 b=Lw7M1EDdKz6TUcqQMPtz4b2aBOy8H6Kzv8NCeOGTime8JBv0fTSFJ+QjZKVUVBIWjYBuRHMKDpF/ydmDl8cW/FDofjuI42OpX1myfpbpqIY6nmjgP+dkcW9RNktT4+KFkECENuJFiUCSdOCsqy0f/1C4EfgrMQlOy1kCXRggBqI07F7UjAZmvJb0WJnO6s2bMUpzC86pKjn59A9zPJlQv8L/Mx6m3KicHev0ZfXMgPxDL2U5cGcHY7KEJeFZowYj/WEoFmr3cPmXNfeoF/PqxPnJ3A2Em0RABUTAESoQeZN/Aw5DkT+O2J18adYIheKwYF7olu7XTjoG573p7NYZYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tR5Vd/loExJsGDuUzhtcrsoFQr1+56e78PB+62aDEXk=;
 b=GirZ7nQCillUtXg2ozzlElQ8lwkhS9dpP61BVHg44aJcWm5HFZ9v62nVi3ptERdiRMAq91Swk+5VBxFBoa006NSWI3fYIb0ToQoGyIFuKWQ17T4ICv5o5s62SVIxTZY54D4/quzpTFZp4bmz++kOoj8wHzepiABvfNus/K22NOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV5PR12MB9756.namprd12.prod.outlook.com (2603:10b6:408:2fd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 07:21:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 07:21:25 +0000
Message-ID: <1d9065f3-8784-4497-b92c-001ae0e78b63@amd.com>
Date: Wed, 24 Sep 2025 09:21:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <IA0PR11MB718580B723FA2BEDCFAB71E9F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <aNI9a6o0RtQmDYPp@lstrano-desk.jf.intel.com>
 <aNJB1r51eC2v2rXh@lstrano-desk.jf.intel.com>
 <80d2d0d1-db44-4f0a-8481-c81058d47196@amd.com>
 <20250923121528.GH1391379@nvidia.com>
 <522d3d83-78b5-4682-bb02-d2ae2468d30a@amd.com>
 <20250923131247.GK1391379@nvidia.com>
 <8da25244-be1e-4d88-86bc-5a6f377bdbc1@amd.com>
 <20250923133839.GL1391379@nvidia.com>
 <5f9f8cb6-2279-4692-b83d-570cf81886ab@amd.com>
 <IA0PR11MB71855457D1061D0A2344A5CFF81CA@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <IA0PR11MB71855457D1061D0A2344A5CFF81CA@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0242.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV5PR12MB9756:EE_
X-MS-Office365-Filtering-Correlation-Id: 737f67ab-7f48-488f-4c10-08ddfb3af82c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXhpbHdzVkRmT1ZaSXZKTEZwWDFxYjEwR044b0pwZVpGQmlXaTdCQ3lqckJk?=
 =?utf-8?B?UWlEVUZyeENQaU1wOTI4dmZSd3p1LzNabVlkZFBraFBkOUwvNG1GTGtKcHB1?=
 =?utf-8?B?Y1RacVBteUV6c0FCd09UdkViUU5HSERFb0pLNE5PejBpODVwT096LzVQUGc4?=
 =?utf-8?B?TXh0eDQ1dmhoSHpFVzlDRHkwSUJsMllyb1IyVHY0cG44VzNFWThoczlaMUEw?=
 =?utf-8?B?NnIxRkFxcTZwVlhUT0lNNGM5NGl0b3RHQ1grMUpxYVZRYVRld0dDdGZaek9X?=
 =?utf-8?B?cjBRelVZQU5iZ1crcDFDSEJscUpCcHYxYUtQSzVjM3Vadmc4ckxnRmlPU0xs?=
 =?utf-8?B?Y3ZLSmpLUjNabGRHdDhHa1B1WHNsUHFnazBvK0xqSEhrY2wzWUFLTXZNdTNS?=
 =?utf-8?B?ZUpXaHZLNm1TNzRlZ01mYmtDVDZjUGI1KzJiR3MwOFRiVC8wVXVtZ1BBWDA2?=
 =?utf-8?B?bDB3Q1hMMkg0ODVNamNyZjMrUXBXMWVZQm1pcWFCa3loZnY0L2VLdFBtNVJr?=
 =?utf-8?B?ZU5leVBOM3hmVDdGZ2Z6VVpGN2pDUWVETHNLaUo0OGJNbWZYaGtWMHFZVWVs?=
 =?utf-8?B?WVhWaU0rd0tXRG94SXUySUlyVktXUXNxS3VxV21SYmFVaHhFR1dnb0YzelBy?=
 =?utf-8?B?UzY3SUNEeUhoZjNINU8yVGt6WGZpODlHZEFMVzVDTkJpaDcxc0xuY0ZmYnZ0?=
 =?utf-8?B?aWtzNFRJa0NRbGhWUElXa0NQY0M1NGYrMXIzd21YUzZSV0NqRnNqWG45eVpX?=
 =?utf-8?B?UWxBRFpSdThIekpJTmNyVHZjMDBVZ2ZoQlJxYVdDTGh6QUhTMytuWnplaUZK?=
 =?utf-8?B?SVpwOHY2RSt2N3RXWTk0TXc1K1RxMnZnbHJJRk84eEhHMUQrczRscEQ2a3JT?=
 =?utf-8?B?VEtJMUpaaVE2UVZwZ2JSN3hUdHp6cVRsRlUrYnlJTkhKSXpEUnl5c1hQVlMw?=
 =?utf-8?B?RVJxbyswRVNwNHJrSW9EZmRVcVhENXlTV3czcHFxRHlBTVU4OWl0MFZDVHFE?=
 =?utf-8?B?Smc3enF5c2JtYzNzRkpxZWlQUXRrck0xREswQ1RRaWxCaXdNK1phOGpSWWlU?=
 =?utf-8?B?OVVLR2Z5eXBkdXE1NjNYcjU4NkpPakNYRGV4QmJWOGJEaHl0WlNudnp0YVFM?=
 =?utf-8?B?c2h4ZGM4U2ZnVytCMmdydVoza0hkZzdRY1dPMk5HRmN1N0tzTWs4N2NsdEQw?=
 =?utf-8?B?eWo3YlRyU1d3UHNBMlV6L1Z5ajRSRU80S0tnallIMGRpNVU3RnltODVkVm9r?=
 =?utf-8?B?UmpybHFKTmxnN1R4a3U0MGVLQTU5a2R5bm9tZ1VhSGI5dGNiZmg1UkxmblAw?=
 =?utf-8?B?S0xmc3h0L2h5MkpsMS9ad2tTZ0lrazFTNHo0ZGlkaS9sNHhLRFU0aXZvYSsz?=
 =?utf-8?B?VTZDd3BIZkhnTXR6TEhjN0hWVHlRRmZsMm9xRDR1OXJlOEo5Q3NoY0gwSXRP?=
 =?utf-8?B?MVR3aWd5c3E2M0M1SVY1T2d0blJFOUl2MzcvZ2FzWGZXVEswOWl0QUlzN09j?=
 =?utf-8?B?bVZET25YNzdBaWcxcHJjN2tWenprQW8wRDFPaUN1ck8yRVRXMzQwdmxGR0pU?=
 =?utf-8?B?TU1SSjZ3RjdFelpkeXEzQWYrWGlQeFF5ejJOR3VWbzJwTFl2Sjc3WU9ZSWdq?=
 =?utf-8?B?UHhpQWlWQ01sUC9HMmVJT202Y0s0RXZVSmxkdUk4ZUNDQm44aFBTK2ZlWUdw?=
 =?utf-8?B?U0YzbUZJUGFoNHBES1docGxFd0VSd0hYMFdKbkdWS3AxOEl2QXRyYy8rTklY?=
 =?utf-8?B?bzJiV2srOTVSOXZVcEd3TVJXYWR2K1JJN1haNi92bVRPWmk2ejR1dzAwL2FI?=
 =?utf-8?B?SHpqa1MvTnNMdUF2QS84c2thdkFEczdkbkx4dnlBZFRwclVxajlrY0JuNkZB?=
 =?utf-8?B?RTNXUnozdEdiNFRZRysrUEpTUzZhMEoyRVhUM01WUWt1Y0YwMVRHTDFBZlpz?=
 =?utf-8?Q?ViJ/lcJFz0g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjU1bzZORGhUdytMWG5jODhsYVEvMjBqU3NubnFTeDJQVTJWMGdJNXpCOU1Z?=
 =?utf-8?B?MDk1SFl4ZVpUTzRrdVQ5M1lIaDlOaEJwemlsYlBVaDlCOTJEajI0aW5pTU5p?=
 =?utf-8?B?QmsreUVjdDBqRWg0QzhwRVVWQkxFcHhSKzJlZ1pPVFZSTTY5dU5FRTZNTjVP?=
 =?utf-8?B?UUlocVVOeFVvRTdESGEwYUdocHBMTERNTW1sTC9GMlUrOFB6dWFUak4vcmgy?=
 =?utf-8?B?cFprRC9OSFlKbjVOOEpBMEJVa044WWdyYldkVEpWcGJUcHRWcTJEOUhzRmxi?=
 =?utf-8?B?RlkwaW9NRVh6dlRkaGJKM3dlYVZtVGpJV3VXRVNYQnJIWThpd1ZHTXlOZDhX?=
 =?utf-8?B?aXpTbFhSUUZBQ3UzRmtOTFZUQkZiMUdZQkZVR1NJL1lNOXZQTUNmcU1xMVY1?=
 =?utf-8?B?TGRnNzhqWDFYMVVpRHVweFlHMndSKzl5ZmwvWnNOci8rSkN3eXMvNGdUTFVD?=
 =?utf-8?B?M0lSUm1GY3d0L3lsanRmUS9rMFZiem8xMjB6UExBQmZzZFc4dmdwbysybUNE?=
 =?utf-8?B?aWF2N3ZUbDMxZDN5RDdOM1JoQ2x2YlpWUFhmTVVqM0RFeVByeE1kMUJwUmRS?=
 =?utf-8?B?d0dqeDhHYXlDaFpqeEd1RnlXUzg2SExvRmhFUE1iMm5ZM2JJbmNLclpFRzhj?=
 =?utf-8?B?dTlyaVdzUHd1K3BIWUhnek1YNXBPWStXdmRQLzJwc2pWU2NyVGJBNnVMcmlR?=
 =?utf-8?B?WFpwTmFiVlZ4U2s1aDB5SEZPbStxSmpRKzI1QUxsYS9yM2QwY0NXQnlIbGgy?=
 =?utf-8?B?bXlKZHp0cG9DYldFcmxJM1NIeVU4SkErUzR4N1NGVEZydUM2eCtpTUN6UWNu?=
 =?utf-8?B?bFBsUlpKa1BURUtFUlZaSXNNY1FSQ0Jqem50VlhPc3lXTml2bDE4SHpkMUpa?=
 =?utf-8?B?S2VNdjExSkZOR1NFeHpXYVFNV0IwZWw0N2w3L1M2TDBudnRnWmViWlArVE4w?=
 =?utf-8?B?cE1NMnRFUDhQYjdET2dZejhaUHVBV2RWVjVuKzh2SndKWHJ4ZS9mbHVuZURt?=
 =?utf-8?B?bldGYWFxVFNVZy9nWGoxdFBvN0pFdmh3UHNSSlBLL0dTU0c3ellMUUxkOVlu?=
 =?utf-8?B?VlNDQUx0bklzc1N0L25WZ1l1YWlNRW40VGVMV054TCtEYUVqV2F0Y1p1SE42?=
 =?utf-8?B?bHNvOWZEQnViU1NzYnd6Sy9NekRWZTlscGZIYnVtSVhJVWtUZGdNVFJtMHJz?=
 =?utf-8?B?SW9wRDJYRWZLSEpZRVViQWNBL2ZZWkRFVlJCWHQycFRsbVdwMUNQZHkyOU8x?=
 =?utf-8?B?Y09ndkREdHpjbXZwOWFlTGd3U1cyYWZxdi9pVmNhdTlYdWo5ZkZyY2R5V2hp?=
 =?utf-8?B?eXcyR2RkNVZEcWF5a1EyTHlWdWc4WXU3RldqdzRDa3JLbEMyeGllemplY3FG?=
 =?utf-8?B?MUJ1T3VrU0V4eldVRmRlYTRYcmZkM2V5eTEzNGVzcVpscWYzTVpML3VuL3gx?=
 =?utf-8?B?T2J1Ky9aZklCcDVYYzdzU1U1NGNOSlVpRStWT0N1TG53QzAvL3VRTFZzeUNS?=
 =?utf-8?B?dGoxcFlFS0JPR0xlUk1Id013Tmo3bEtTWHNQa2lQaGttQjd0M2lrU1NNUmhZ?=
 =?utf-8?B?aFZjbkQ4dE80ZzQyYmE0UmV3REtud2hDdm9DdjhGQS9ud1BXRDRlenpPMEpB?=
 =?utf-8?B?MUp3Q3UrMVFNTFFUVG1SM2orOFE3Y1FjMHQ2aFFzQUJGaERlR2U3MXVOYk01?=
 =?utf-8?B?SWY1cnZnWmYrS1FYQ2hnR0pjeUlvUFJhS0pzemYycEQ4dDJEc2ZwaFB5WndG?=
 =?utf-8?B?cHNVYWFPK0NGTkM5VzJMb0VWVjhJdEhsNlZ0WWxEZlNRZGw1QXRkTHJzalVW?=
 =?utf-8?B?WEZWeTlkS0R1bTFOWXVwR1JWWFNOT1prclp6MFVhVGZwWVI1L0xidEpnZlc2?=
 =?utf-8?B?UDA4cTBsSkRMN0w1RGVVZ3JGNVAyNDdLQnlEeG5TcHhBYWFiM0JzNHpnV25z?=
 =?utf-8?B?Mm5CN1R4bktDNFhrVFJYNnlqUnQrdnk2RzRmeG5nUWpKQU81U2JyVUloMzFD?=
 =?utf-8?B?UVN4VzhCNWpVNGNtaURGaGQ1emRRaVZYaXR4b0N4WnNvLy9BY01XeTVVSGlF?=
 =?utf-8?B?UnJOaTYrVUVCWGNtdEE3eDZSQ0ZZeW5VMTJLb1VxZ1h2ekxqd1F0aStaa0FU?=
 =?utf-8?Q?4Dn3O3QmocugpIwaQulcLwrJV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 737f67ab-7f48-488f-4c10-08ddfb3af82c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 07:21:24.9420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+H9iwBM31xOVvrEoZCkgh7Yd+nQ8dPC6XeDo98NgXtbgiQ5Yk8FBnhY/qnywYvP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9756
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

On 24.09.25 08:50, Kasireddy, Vivek wrote:
> Hi Christian,
> 
>> Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
>> functions of Intel GPUs
>>
>> On 23.09.25 15:38, Jason Gunthorpe wrote:
>>> On Tue, Sep 23, 2025 at 03:28:53PM +0200, Christian König wrote:
>>>> On 23.09.25 15:12, Jason Gunthorpe wrote:
>>>>>> When you want to communicate addresses in a device specific address
>>>>>> space you need a device specific type for that and not abuse
>>>>>> phys_addr_t.
>>>>>
>>>>> I'm not talking about abusing phys_addr_t, I'm talking about putting a
>>>>> legitimate CPU address in there.
>>>>>
>>>>> You can argue it is hack in Xe to reverse engineer the VRAM offset
>>>>> from a CPU physical, and I would be sympathetic, but it does allow
>>>>> VFIO to be general not specialized to Xe.
>>>>
>>>> No, exactly that doesn't work for all use cases. That's why I'm
>>>> pushing back so hard on using phys_addr_t or CPU addresses.
>>>>
>>>> See the CPU address is only valid temporary because the VF BAR is
>>>> only a window into the device memory.
>>>
>>> I know, generally yes.
>>>
>>> But there should be no way that a VFIO VF driver in the hypervisor
>>> knows what is currently mapped to the VF's BAR. The only way I can
>>> make sense of what Xe is doing here is if the VF BAR is a static
>>> aperture of the VRAM..
>>>
>>> Would be nice to know the details.
>>
>> Yeah, that's why i asked how VFIO gets the information which parts of the
>> it's BAR should be part of the DMA-buf?
>>
>> That would be really interesting to know.
> As Jason guessed, we are relying on the GPU VF being a Large BAR
> device here. In other words, as you suggested, this will not work if the
> VF BAR size is not as big as its actual VRAM portion. We can certainly add
> this check but we have not seen either the GPU PF or VF getting detected
> as Small BAR devices in various test environments.
> 
> So, given the above, once a VF device is bound to vfio-pci driver and
> assigned to a Guest VM (launched via Qemu), Qemu's vfio layer maps
> all the VF's resources including the BARs. This mapping info (specifically HVA)
> is leveraged (by Qemu) to identity the offset at which the Guest VM's buffer
> is located (in the BAR) and this info is then provided to vfio-pci kernel driver
> which finally creates the dmabuf (with BAR Addresses).

In that case I strongly suggest to add a private DMA-buf interface for the DMA-bufs exported by vfio-pci which returns which BAR and offset the DMA-buf represents.

Ideally using the same structure Qemu used to provide the offset to the vfio-pci driver, but not a must have.

This way the driver for the GPU PF (XE) can leverage this interface, validates that the DMA-buf comes from a VF it feels responsible for and do the math to figure out in which parts of the VRAM needs to be accessed to scanout the picture.

This way this private vfio-pci interface can also be used by iommufd for example.

Regards,
Christian.

> 
> Thanks,
> Vivek
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>>> What Simona agreed on is exactly what I proposed as well, that you
>>>> get a private interface for exactly that use case.
>>>
>>> A "private" interface to exchange phys_addr_t between at least
>>> VFIO/KVM/iommufd - sure no complaint with that.
>>>
>>> Jason
> 


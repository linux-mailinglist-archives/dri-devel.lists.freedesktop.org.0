Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHKkLVemgmmVXQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 02:52:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D49E0901
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 02:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8CA10E2D4;
	Wed,  4 Feb 2026 01:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NAzAAYUm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010046.outbound.protection.outlook.com
 [40.93.198.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DC410E130;
 Wed,  4 Feb 2026 01:52:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3vSp7hXozQrFXYCacU6RtSn0FmHjWYpn4IJh4QN4RUdPt+0077nirnr7z4x28m4GOVmySeVq41w6L4tntmZPh1jybOk3xDNj3TTHhgubcf/Abwg0epK3M1wC/B3YkfKne43Q7IpfDh4E7jZZBplmlPCT5M4b7X68zdY/RWuvmnjKye5j3IJEAeC1hosoZMVcpwUvDceKvjOx4Iv09Amj4+NjS8v1wYAG3r7Qa9Lli1i1081AJvnlpNF5unm99Se+2AiotcoCyIdBfR9lC/wKFaVA28Sp75sMkEYz26b0EgkiIBJ47q888bmMUZ7/pEgHDXHIf6j9GuwpeSXI+wQHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZIFeCCHV7++AHNMfjs96GoG87ulZzPyhMha2bHwFEY=;
 b=yr8+1c72RKrCy40D0T57yNxvJHc1Ex0LBNfvgGdfdJOpwUdy/idtHMZpc69jXgYSyyG0HZBV35WXomvfM34Pv78O9MzruxnjQK8BjqwHWIt+8ocAkQ/kJ5qQaKu4rxqxJWtRwmjPnBDNGRcbPRX5jcv0TsRaEl2Pf0Acq7BzfH8J0L0erhEoRpJ68R1j1nCwtVk+G6viV8mzsk2wQtHxCb+fhw9lPLDwHIBrxvlPsyUXncSAZjcs3k/7WNBymM1ApeOy4QhsakwG5Q9gd5FFs6EAu5woEkAfA8ceLfoUcM1Q4ay82BSYlH9HOKnrFZWDn+695ibNtcnW8o9zGOLh1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZIFeCCHV7++AHNMfjs96GoG87ulZzPyhMha2bHwFEY=;
 b=NAzAAYUmyefKE6xFd0cjVoUgZUONo0ON3d9kDRw57+3VBXle+jf88nuQI6dSZJ4tCALSzVzFHf6F7J1gbQgjqHnR+rUDMsX6e+gytj1OCbk2Jqn1rqef9RSkUf9ftgi9IFdgnmeuFAVFwrSYstElth2GxhkFYzocRQuAk85IVCjyl5aejJfaosarvcaNp0QAIiIsf8H5UGtUVyotwAsvL4Z05j2Db0i4FuTvexKi9vxyPAUOi/0mFmrXhvEaV046XLdr/szH/W+8h+8El6ewGI5xKD2PHrQKljsC4rdBs9MaZnOV03LiAotSPw0glfY6+TCLx6JnNb65AZpgMYm/KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CYYPR12MB8732.namprd12.prod.outlook.com (2603:10b6:930:c8::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Wed, 4 Feb 2026 01:52:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 01:52:14 +0000
Message-ID: <cd38c301-5bfa-4c7a-bb7b-a4e2239b0477@nvidia.com>
Date: Tue, 3 Feb 2026 17:52:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm: Fix a hmm_range_fault() livelock / starvation
 problem
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Alistair Popple <apopple@nvidia.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Jason Gunthorpe <jgg@mellanox.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Matthew Brost <matthew.brost@intel.com>,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org, stable@vger.kernel.org
References: <20260203143434.16349-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260203143434.16349-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CYYPR12MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: 10366b4a-958d-46de-7bd1-08de639004e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHR5S25DbGxBVDhQU0UwSzJRTHBUd3FSZ1orWk1XV3R0eGxXRnZJS3BhQTU3?=
 =?utf-8?B?bnlUUkZwbzJCWmI4Zy9xckdtaUd1U0JycGZTbk1tcGVrbklQc0JXZ1l4a0ZU?=
 =?utf-8?B?M2VYcWZldlBqbDlhS1hNSmd2VVE3NkFidkJaZTlYRE5ySnlEY2plZ2JPVWQx?=
 =?utf-8?B?bEg5OTdaRzN5NUwvS05ObDI0R0ZWSGcwZ2RueEpmT3BnSDQ4aWJFSVRaWGFW?=
 =?utf-8?B?ZGZXekxlS2ZjZC9FdHZDRnU5VDkxTEV1SlEvcCtDT2ZzTkJBbU1ic3BhZ21I?=
 =?utf-8?B?LzhwK1I0NkFhTExseEdNWUZnOFBOMFhZaTBqZjZLQnFwR01meDNoaCs2SURa?=
 =?utf-8?B?b05LclNKUjhhcGJYZ2M3OCtNQmU4WDNXdHRzYjlCOFBsTGl6ODZDSWRsVk1Q?=
 =?utf-8?B?VnJsTGJ6dkFodHNOam1hUFMwMS9rYWE4aXA2QnFKdTJtMzlHNWpmK1l0MmZD?=
 =?utf-8?B?cHFMQktqeWhORkVMNTFuSjBTZytzSkpVOU1TSEFqNzBqT0VZNlBoK09sZ2hx?=
 =?utf-8?B?TUQ2V2NNbEVDL2FaL1Jhb0wxemJhTVRaVEROZFVRVHRNQnQzRjJZdVZ2WU9N?=
 =?utf-8?B?RzRKYnAzL0JHcGxZNlI0Sm9LV05LU3ROdnRvaVZxdVlBeHF3VkM3VlRnVjFJ?=
 =?utf-8?B?Ny9aWFVzYk13ckdDUjZrcy9FRnVtZHJTazM4dEV1cnI0YWhwdU53M3ZtUUJ2?=
 =?utf-8?B?cUZrV05YRGlHR0NsVEVtWUt2THFMOUJ3aGU5dUdqUjJYRlkrU29uVVovZ3lP?=
 =?utf-8?B?YlRzT1MwdlBDdXpIVFlwZEJTM3pOSzNBM1JvTWtkL2xPRndpeTNQSjVraG1y?=
 =?utf-8?B?dm5Wbk0vVjBGd1F5ZWNvb2dMSUg5Zmcyb0tMOS81S3hlMGplY0J3QjlGOVNr?=
 =?utf-8?B?NThYSERsT0V6RmVsaWoyV3NkT1ZuVmE3M2h3ZitRcGNsb1A4bXBJazlvSjZS?=
 =?utf-8?B?b1FZMUVmQ0htY29Rbm9UT3dNZkl1azBzRlRCajN5M0ZDRnBMMHFUTEZidkkw?=
 =?utf-8?B?ajYzMHZiL0dEU1JTSjZKOHd6L1F1UEhwaFBSdE02ZjdCYlo5L1JIQXZtWmc2?=
 =?utf-8?B?Z1gwWXhIb2RicDdNL2tDS2IvZzB0YUE0Q2JZcGI4TlZqazhCODNzdmp4bktZ?=
 =?utf-8?B?M0trYnp4Wi9nK1ZKd0s4SkYyVXh6MDFLYWlYbjR0OVNmcXRHVmdlczNGV1Vw?=
 =?utf-8?B?eGlYMTFEYXM2dy9JWURoSlF3Y0VUMXlsTWJpM09MOWJ5b08yd2VBVmhnWm5a?=
 =?utf-8?B?ZTRYN2NJY0hTZEhSNFhFYTJ4TXFPSDAzMmNRWnUrT1NlbGJBUGZHaVJjVCtM?=
 =?utf-8?B?cXVvMHl5T0R2bnhIb2YzUDlZMHNkcEd2b0FvUGp1aWVKRXcvWHJiSWY2MEtY?=
 =?utf-8?B?clVUenNwLzR4V3BHN29GbVQ4WWNYdU93K0VLYlZya0lZNTZabFNqUmZiTXZ4?=
 =?utf-8?B?WGdXVWx6WEJJeEo5UGZOM1ZkWHRYbis1TERBbElNWVVxL1VTN05BSkM4Sk9N?=
 =?utf-8?B?ZEMreXZ4US9BYmlBd0x4UlgrUHJXR2Z0ZUl5YXZ4VjFYUmJneEpVellwTDd0?=
 =?utf-8?B?RlhyenhUaGp4M1ZNOFBkRFptcmg1VzVEcXR6T1hRRnhzZGVBRTR2VkRCbW8r?=
 =?utf-8?B?alVpdlV6T2xac3NJUjE2eWlaYXpySlZqb29XYmpMRmROdEpWR25INmkvUjNy?=
 =?utf-8?B?Tm03WEdPSndoTEdhWW9TcTVNZERIMlAvRllnOENENjM2Y3BFdWFkNW9ubkFx?=
 =?utf-8?B?T25uOUtMcHhwZGlHSGkySXp0dnNWUVljM0J3ZXhqSmErNEZrdkR5K1pneXpi?=
 =?utf-8?B?OFdUR1I3aHZaaS9LUThaTGc2Skp5WDA5N0VRZVZwUUxjMzk5aU5VblBlMjRl?=
 =?utf-8?B?a1FScHczV081RFY0aVM4NVNkbmhNaVJGQk5HMVc2RFVNV25ZWkI2NUlEMlB4?=
 =?utf-8?B?S2NBbUNudm1pR1dOSThYYnk3VVZWV0xIenNpUi9XWkZuWG50ZUdpUXAzdkxS?=
 =?utf-8?B?aEwrVTlhaU43b21Rd2hUZjBFWTF6SEM1dnhJMHpXR2xyaWNUcGJnUHhISElr?=
 =?utf-8?B?ckozbkhZVVVWdHd0MzVhLytUVW1waHN2ekQxUW5XRkdWcDV1SHYwMkdTR0lH?=
 =?utf-8?Q?H7bI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmEvMVp5VVJtcmM0ckNtRFk1QmxoZi96elFxWThKdjA3UVp3dSs3NHZhTDFD?=
 =?utf-8?B?bTJoTjBwNlZpbStFODNEL2QvZDE2ZE54VFlQVTlEQm9hNzJ2U3JRVUtTeHd2?=
 =?utf-8?B?UWsyQ3p6VXpONzN0RFFhTHVCWnJxdXFybUlRTHZqekR0WmdMdHhiYjVtV2cv?=
 =?utf-8?B?VDBlWllqQlZiZHZjeDJFLzQ1Q1pETm1ORDRZNTNGSlRTZ3dMWFhiUWpwQ2ZM?=
 =?utf-8?B?WjcrQzQzb1dnamNJbkllczBNdStGUmpGUm5OSC9TbnFBZGdDMEdpUXh6dGU1?=
 =?utf-8?B?aDRwUnRJSi9Pd1NRektWVFpXdkdMMFR5Z252bkJtRFdVTUptQmsvRVlsU1hR?=
 =?utf-8?B?RTBtQkJJd3UxS3hDakdIRWpTNnhEbDBKZGR0c1N2SDhxNXBjK0U4UDMwRE54?=
 =?utf-8?B?MUM3YVZhV1Z0eHZGVXpLZW50SDR3M1FvcXJOb2NCanVnSEorNm1RejhjeUwy?=
 =?utf-8?B?OXZNT0luaXB1OXpoa3IrTDN4MkxQOGQzKzliK1FJU1ZqTDZWNG4xUDlpeTJI?=
 =?utf-8?B?bWhCNHNZaUJrMVQvVkp6K09iZTFKbWdpU3ZGQnEvOFg2OGxTZ3NkNEp0ZFFL?=
 =?utf-8?B?UVhHWEtoN3pGa2xBU0h6T2FmZHBwazh2eWp2RlBkcVNaWFhnazkzYjJNb3Jw?=
 =?utf-8?B?Z3p0VWVEWDBjajM0SVh1MFZOZmYyTnRzUWVjUG53b3J5dlp0Wi81Wno1RlZo?=
 =?utf-8?B?TUo0YXplc2hxZHNjcFpwM09FczhLSC9aZi9xSS9ZZ3ZGZzh1TU1UYkluUVhn?=
 =?utf-8?B?TUZhOHZIeXZlZzBGQ25oemQ1eDdTMEJ3Rjk2NkdhU1huU3JwblBaSGxvN1Rs?=
 =?utf-8?B?UUtjdFZLMjREaENzbnUrcUIzc2YzV2xYOHJEb0pIZXdCd2FrSStBMDNyK2t6?=
 =?utf-8?B?ai9SLzNXTUZ0TmVidzY5bFZ5Q29yT3F6djUvcjNWUXRSZWZJZnF0V2gwcW5F?=
 =?utf-8?B?QnZ1TmRCZWJORXFKenc3MFRUUm4yMUQ0akVmSjZsekpzRFJMcnErSlJZeXZa?=
 =?utf-8?B?WEtSYURjeXR2azFHamt5U2FSdG9nODJXdmt5MWZ5TkV6L1pPZWc5WXJ6NWVQ?=
 =?utf-8?B?WGtrZUpFMDMrR2tZNGpDMlEwckFUdldaU24xZWwvVGhaSDRRNnMwbUluQ25z?=
 =?utf-8?B?c0x6Z1J5UmNVUnhMc093M2tlUHJUdzlWWk40bFJkL0M5UmRkYmVURWtsbWxH?=
 =?utf-8?B?R2RHTDJXakEyaVh6WWdKd3dtdkNzYXdMbFVrNUJQY3hNQkJmWklUNDBMaFp1?=
 =?utf-8?B?NjgxMlJVK0p1WG83RU40QXA1TFovK3ZTYUZ0YWdFa2xjK2ZxejA2N2dOdjEy?=
 =?utf-8?B?bEZtWmZmZWQxVWNSWmJ6U1dLTC9TS2RHUnk0YkQ1WVBHSXFXTWExZ0MwRkda?=
 =?utf-8?B?SVF1aFQwTFVLcWRYbGowU1d5UXFpMW9GSkwzeWVjZ1J1M2xHWkdKdUpxTTVX?=
 =?utf-8?B?aHRvbDlyRjZTWDlQQ2NUd3c2SlNWRFE4TVMrb1FyaEJCNlkxUkR5YTNUVFdh?=
 =?utf-8?B?QTVZWUgxREI2ZkNVa2tKMXlQcWR6LzhIWE9VWkRhdUtBL1NkejR3ZUdjQVY2?=
 =?utf-8?B?VzhnZzc4OFhPb2hybzlOUXg1TExsYVlzUnRad2w5WVV0R0JlUW83Zi96b2cz?=
 =?utf-8?B?ZmlZdjgyb3VPUVM4WEhNalgvL296SERnY0F2ZGlONG9FL1J0ZjhiMWhqWFhw?=
 =?utf-8?B?dGlhRERnMUJFSGZ5bEdtWTZ5NVpwaHNpTmNVWmc0T3dMRm9YYnFTQ2xoSmN1?=
 =?utf-8?B?RTlRcTc2aGRuQmY3Q2VLZGdPNHVHWVkrN0NURytkeUZaYUhwU3lxVmo4M0pT?=
 =?utf-8?B?VTdodnVNcXg3cFM3MnMrNjBXcE4xVlg4Y3oraDlQZ0FJU0RMbmgwTXNITlBi?=
 =?utf-8?B?NWZoSEpDTzRhVXEzdFh0K3prWVRtc1BrTUlZZm5TK0RGMjNHVS9tSTQ0eEg3?=
 =?utf-8?B?Rm53L3V3RHIyeVV6RHNvSWNTWnhLbDIrRE81QVFsZ1M0cUVPcmVJN2UrZ1U0?=
 =?utf-8?B?V2RPRVVMMHVleUtNSXNHZWZxejN4MFBzdEFNNERJU1lTMjBHV1ZST0Roa3h6?=
 =?utf-8?B?elBjdW9weDVOYUpMU0ZvQW05dXlrUnVWY1RZUVpZSGloY3FjQW51WFhWOVFM?=
 =?utf-8?B?dXdSaWFsODczRi9PenI4L1hBWXhCWjVrSmYydE81YmVNVkNpMTk3SzFRalVE?=
 =?utf-8?B?TWNUb1hseTBoSzR3Y3pIeWoyMEk5ZHBKWmdjODI5bHlibUxRUkszcU93eXU1?=
 =?utf-8?B?eEVjai81alJMMHYwTFhhMkpxRnlVVnorMDFDRkdyZ29sTnEzQjBCMDFBQWJa?=
 =?utf-8?B?SG5taHhhb2RJeU9xekVPbEdZbUtmNUVYNDZOOFpvYjVmZldSTkY2dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10366b4a-958d-46de-7bd1-08de639004e1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 01:52:14.3762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsqNCDKw39mKNNcXoNCsNg2Vhn6NRIC/GgNDR/3zEwitMT6fanDBnV6H4ntz+lP+oUiFpCKTRjkIYUojcY8NNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8732
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,intel.com:email,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:email,lst.de:email,linux-foundation.org:email];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 13D49E0901
X-Rspamd-Action: no action

On 2/3/26 6:34 AM, Thomas Hellström wrote:
> If hmm_range_fault() fails a folio_trylock() in do_swap_page,
> trying to acquire the lock of a device-private folio for migration,
> to ram, the function will spin until it succeeds grabbing the lock.
> 
> However, if the process holding the lock is depending on a work
> item to be completed, which is scheduled on the same CPU as the
> spinning hmm_range_fault(), that work item might be starved and
> we end up in a livelock / starvation situation which is never
> resolved.
> 
> This can happen, for example if the process holding the
> device-private folio lock is stuck in
>    migrate_device_unmap()->lru_add_drain_all()
> The lru_add_drain_all() function requires a short work-item
> to be run on all online cpus to complete.
> 
> A prerequisite for this to happen is:
> a) Both zone device and system memory folios are considered in
>    migrate_device_unmap(), so that there is a reason to call
>    lru_add_drain_all() for a system memory folio while a
>    folio lock is held on a zone device folio.
> b) The zone device folio has an initial mapcount > 1 which causes
>    at least one migration PTE entry insertion to be deferred to
>    try_to_migrate(), which can happen after the call to
>    lru_add_drain_all().
> c) No or voluntary only preemption.
> 
> This all seems pretty unlikely to happen, but indeed is hit by
> the "xe_exec_system_allocator" igt test.
> 
> Resolve this by waiting for the folio to be unlocked if the
> folio_trylock() fails in the do_swap_page() function.
> 
> Future code improvements might consider moving
> the lru_add_drain_all() call in migrate_device_unmap() to be
> called *after* all pages have migration entries inserted.
> That would eliminate also b) above.
> 
> v2:
> - Instead of a cond_resched() in the hmm_range_fault() function,
>   eliminate the problem by waiting for the folio to be unlocked
>   in do_swap_page() (Alistair Popple, Andrew Morton)
> v3:
> - Add a stub migration_entry_wait_on_locked() for the
>   !CONFIG_MIGRATION case. (Kernel Test Robot)
> 
> Suggested-by: Alistair Popple <apopple@nvidia.com>
> Fixes: 1afaeb8293c9 ("mm/migrate: Trylock device page in do_swap_page")
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Jason Gunthorpe <jgg@mellanox.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: linux-mm@kvack.org
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v6.15+
> ---
>  include/linux/migrate.h | 6 ++++++
>  mm/memory.c             | 3 ++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 26ca00c325d9..800ec174b601 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -97,6 +97,12 @@ static inline int set_movable_ops(const struct movable_operations *ops, enum pag
>  	return -ENOSYS;
>  }
>  
> +static inline void migration_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
> +	__releases(ptl)
> +{
> +	spin_unlock(ptl);
> +}
> +
>  #endif /* CONFIG_MIGRATION */
>  
>  #ifdef CONFIG_NUMA_BALANCING
> diff --git a/mm/memory.c b/mm/memory.c
> index da360a6eb8a4..ed20da5570d5 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4684,7 +4684,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>  				unlock_page(vmf->page);
>  				put_page(vmf->page);
>  			} else {
> -				pte_unmap_unlock(vmf->pte, vmf->ptl);
> +				pte_unmap(vmf->pte);
> +				migration_entry_wait_on_locked(entry, vmf->ptl);

This is neatly done.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard

>  			}
>  		} else if (softleaf_is_hwpoison(entry)) {
>  			ret = VM_FAULT_HWPOISON;




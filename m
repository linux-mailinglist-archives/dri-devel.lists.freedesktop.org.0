Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F17EED00D29
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 04:14:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BA910E66B;
	Thu,  8 Jan 2026 03:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JT/WxD0i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011027.outbound.protection.outlook.com [40.107.208.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF78910E2E1;
 Thu,  8 Jan 2026 03:14:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2I//5WXbRDYqB3KHy3+T5H7mlTP05h4hMgvhe1me0uTf9Tldz9muEMVKnSq9HJH7aCKVZzNfcTuSIe30SoXT19WUpvhlfGn7q9SiRY2qCJ9bx0tK3St9sgwnauC+SaWZw2RDjNTA8G2cZ2RCJ/2OCIWeE9q0ipuKOOeTUNJfuSq1AibePbnJAxF2NNoKyVMxSrU/rsw9lfGQZ70pgJKigFmC66XLtUSGwgB27q5VrS98TY7kRft9E9G1kPbaCmG9xDqaOOEHNUJ1/Wj/Tajcmyc6GN6uq16ZqqfY/DICszUTVRp9puY+LxjoK6yFzFt81f5aHNIPqrW4v9PKDzOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWwK2N/ILgDZzvR6ioykMMwgPhOFUWUrqqUhN4/Q09k=;
 b=k877bFbkG6KxoJ69eto5wTzsIPzk1HOF2O/NwNK3VXOqfBmoSIDc5mwgpQawfxxkB3ghbG0bOZzuI4VJ2lFPFKvo55raC98lrh/Iiio1WNin9HTI0fPVsMJBw+TxzA18x+UgSUkmHnu27iKlpNny96Qjy+QFOSmN+2AL7qCcG8ZcHhoXKi0UVw2RxpOcJoIqpy8PTkGekECgkNCn6plHE8HLa+CseL2kRiEUxs+AXSD+Z5SNVSe+X1GW/dQFRAedSmrn8DLex4FgJ6AQzKdVPh9pFginy8P/gDriNeYlWB6kVzknrdl7rovd+tPyMG+MhjBbzCDVhm2hmRmKhYLLBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWwK2N/ILgDZzvR6ioykMMwgPhOFUWUrqqUhN4/Q09k=;
 b=JT/WxD0ijnc+bSBTWgpFmZ74GffEwDhXcxLKiUZeWu0Us5c+icPehojNDmu3947WzxkLvrPrlnrJKUhs66rmrWizP+P7La1iWFLIFfUqiVR8tmNyj91YM9xxNR+7Mu1/oqZyzt5QMVpVHO/IJOtVOo+sQUNXYJgXi/UcNvJbxcB8qcdhDiWFV7UxzCtcnQRmxjEEegD5KVw5hhlDN6vXbwe4Gb26Ey2MzbcauYq7s12FUtKjGumRDZOkBjJti/Fd8A77DxAckgWoFAKaCyaYRrQrzF0IjSB4pg3kF2wnqXu27QwibFu/6ja6Yshjrb9FpoVTC035gOB52jWAiVhYvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 LV2PR12MB5725.namprd12.prod.outlook.com (2603:10b6:408:14c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 03:14:33 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9499.001; Thu, 8 Jan 2026
 03:14:33 +0000
Date: Thu, 8 Jan 2026 14:14:28 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
 Balbir Singh <balbirs@nvidia.com>, Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 1/4] mm/migrate: Add migrate_device_split_page
Message-ID: <w22y7ioppcgcqikwko5v6zf4c42pdv345d6vt2kvk3dcmtmi6e@mn6undehc6xb>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
 <20251216201206.1660899-2-francois.dugast@intel.com>
 <F4EAA470-C922-4066-A115-13D6D055C73A@nvidia.com>
 <95BD5D5B-C8EB-4EFA-A895-CFD660504485@nvidia.com>
 <aV7NBE3NS1wdsXBo@lstrano-desk.jf.intel.com>
 <541B31AD-1472-4D32-A968-B92895CC6890@nvidia.com>
 <b39d13b2-cc10-4803-b6b8-0a0447aa3349@nvidia.com>
 <aV8TuK5255NXd2PS@lstrano-desk.jf.intel.com>
 <0419825F-D627-41E9-887D-51E18A2D54E7@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0419825F-D627-41E9-887D-51E18A2D54E7@nvidia.com>
X-ClientProxiedBy: SY5PR01CA0091.ausprd01.prod.outlook.com
 (2603:10c6:10:207::8) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|LV2PR12MB5725:EE_
X-MS-Office365-Filtering-Correlation-Id: 026c8f48-f51b-4127-07a8-08de4e640b76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1VXc1VqRWZVT2xtcmFoeDFrZlJRajBSN250VFR2ZUpuU00yVjNSaGlJSXNU?=
 =?utf-8?B?UVFBc0VFdUNlRktUbHJQaU14RS95aC9NSmZ0Z0pad2tIQUVYK2FJWFFNUnhD?=
 =?utf-8?B?OFlEbk80bTBndGxYZUUwcFR0VTJXZnhIQU5ySVE2S2x3cC9PQUdiYmY3MStv?=
 =?utf-8?B?eEFPQWtkU1JtK2dRUXg1THJ4NXA3VUpHYXBoZDg4R1hlZDErNmlMRHNWbFZS?=
 =?utf-8?B?RkFuOUg3T0trQnlQWWdoSVE4MTRHbnRIYXJjL08xZVlaTGtvNW9mQUJqK1pu?=
 =?utf-8?B?cDRxV3NhWVE3bXRXS09YK1pEdXVQV0lBaHpJNDd0OVVpTzBaUXRkcGx6STRC?=
 =?utf-8?B?RmVWVC9mZVdwVk92eVVsNnVua3I3QVE4bHBqSjBpeUV3RTNnOC9GQk54QW84?=
 =?utf-8?B?cCttMXR3NC8vdGh0eVdzbUVQekY0ZGtjWVdSN0RHMi9Tb3p2ZkdIcDBreGFk?=
 =?utf-8?B?YWc1SFVjVUpDakZGRDU1K1lzTXFuOXVFcng4N1dpVnQ5UnRSdXN2cjEwN1F4?=
 =?utf-8?B?dGxHNmJuQTVBTHR4eWcrWFVhQXpuYituTmwrTnZSeVZzWjl3MHluemtqeE41?=
 =?utf-8?B?cjR1aFhWRk1hdkliLzZjbHF2dmFzQ0lVNFBMMmVVblF6UC85ZVJCcW5MWS9W?=
 =?utf-8?B?ZnVyS0daK2hqM1E2VWtjVlkrZUdIandNUFdxWkZ3bEFYaDRLUnh4UCtFTTNQ?=
 =?utf-8?B?SHkzelNhRjE3RDArU1FDNFBVdnowQ0c3ZDY3MERsSnBpeERBUyt3TEYzbURQ?=
 =?utf-8?B?bktETFpPYStyZCtUMzVhTFNaR0RsaW1xWThCTTBqbEhpYTRiTW9UdjdHY0lP?=
 =?utf-8?B?UWxZN0Y5Z3ZQbUxxUys5b1FKeUltRS85UFBYNUtyYlE4VFdnT3grajRiUUdZ?=
 =?utf-8?B?bFlkaDJvMmk3d0xxM25aWTE3c080cEFhaFdlSzFIRkMvSkRZdUJHUE5XZkkz?=
 =?utf-8?B?aGJ0NDE0OUxHZXBta0JLalRKWENmRDFLb3FLNnA0bXlpTzJ6V2xib1VoYlhJ?=
 =?utf-8?B?YzRTZ0tid0FpeU5JZFNxTy9PLy8ra1huZ2xqdUU4YnV1OFArckhLeFpUUWs5?=
 =?utf-8?B?TEozRWI3N0g0dWpQQk1qUVI3RFBqT040S1RhWUErODdHYndlR1hFMWNKdzVE?=
 =?utf-8?B?SDFRQnJtaHFxUkZ3aW54SVVGTWhlOGNvcm1QbXoxUXVVTEEwMmVmU0I4M1RI?=
 =?utf-8?B?NEdVWS9pdmJmZXRmV0N4TVJkcm90ZHpWd09TMnFBenMvK3dHaWlDQXZHcFBC?=
 =?utf-8?B?blU1NVRDenRLWjJDQmFBWGkvZUpTQ0lTZVR3WXJTT2xHMGNpbGNzTDZRL3NF?=
 =?utf-8?B?dG5JMEp3SDZZMDlXUGVmOHRNbkNNMmcxOE5VYitLS21BVHBHeEdTRmJLUHZz?=
 =?utf-8?B?TGNSNnBOdjYwK3FwSlk1blZQSWNEK2ZUcnBCYTJTZXBiVFpJcjdUY2ZsdnhQ?=
 =?utf-8?B?bUFibUU4eThUTXQyUDh3U2gvRWtZYkRtc3dhY3VTTE10S0grd2c1SmN6c3l0?=
 =?utf-8?B?Rmx4YUJMRTBmc01oV050VWE2T21MYUM1VHJwQ2ZBVVdSOWVzend5TldDZXlw?=
 =?utf-8?B?TXI4N3pyMXlEVEttWkR3NWtBeVNKQzlkWlAwNnZod0MrUmFuMHZKQ01Rd01R?=
 =?utf-8?B?ZWxiNk45RTJSKzdGUzdwZks0TFduNy9wYzZ3eCt6Y3Jlc2wzTnk1Z3VxY2t0?=
 =?utf-8?B?MDlsZDhnNGpmT2N1eGw3Ti9lY3h5N2hyUnJLeSt0c3VBOWdDN3V1NmJmNTUy?=
 =?utf-8?B?V05jYitrR05CQ1JOVHU4TkxIZXhWOU4ra21CbnRlYVBad3puWUNoNGNGc2Zl?=
 =?utf-8?B?M09jRXAwT1p5TGQyVEd4UDF6K0E5SjhocWdiMlVFZUkwMWhEdElManVvTm1s?=
 =?utf-8?B?SEp3NU1LYjl2QmJiQjk3dnBJNVdBYW13TGwyTGxUZzFESnpyV1BLa2dXNXpm?=
 =?utf-8?Q?PCx8zgMSzHt8S071zFqYYqs0zv2mR9ta?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aS9xSzFTQmFSMWh2R3V1cnJvVkltelRQWUlQMFBaeUtGYWdMUk5Ydy8xekpL?=
 =?utf-8?B?aktQZm5kWHduMWQ2cGFmc0FMclVQbzZreGs2b1h2OTk1RHI3a29XUU9DK2wx?=
 =?utf-8?B?OThlM01rUDZRYjI5ZEJqUFhHenJuWXY5Z001VFF4L3BmNGVZU254UjVGaHpV?=
 =?utf-8?B?RndXVEEzd3hxL1NJam9TSHFZTGJlOTRqNk1sWHJROEd0UmNnZWEreEtpWlhJ?=
 =?utf-8?B?amV1NGx0MDc4blkwRlUvVEZlcTF4a2pvanRQYlcyd3VOMEkxa3RaeVExWWc2?=
 =?utf-8?B?Q0swaHNQVHM5WVJxM0lkNHd4ZHkyV2pnQW9YNHdhNGtkTzdJNU8zakdNOWor?=
 =?utf-8?B?VkswMC9LTDk5ckZPaVlJZ1Zwem1mOTA5ZitrSlJtb3ZvaGJLbGNNcVhQRTd1?=
 =?utf-8?B?NW5oa3hNYVlCMkJBVHp3anc5L3hRK0dLekR6L2JncEtOVEZvTDU0eWhhZENp?=
 =?utf-8?B?ZXV6N2FuanlJRU13U3BTRjlzUldSclEzU2RubUVyUVpEODNWWTZJelJKSWlQ?=
 =?utf-8?B?TDRWZ0hvRHVjR2hPdUo4bDhGM1N5YVVRM1NNbVJVMFdKb1QrK1RDM0xCVWpJ?=
 =?utf-8?B?QW11Zyt6eW5WNGhPa1ZUYThRSFRVZklrdWlHSFlpT0FDeHNaZW9CRHJRSmJJ?=
 =?utf-8?B?Qng5QWZtY2RHeFByNXlEbi9GRUtpalFrbDFiVCtrVGM2dGtGOHhESkRLUTNF?=
 =?utf-8?B?QU9SK0xtMm1qUmJwK0themMxUjFlMWNZeEV6b1lwbE9zSC9GUld6cEptUVRV?=
 =?utf-8?B?WWdhVno0eS9EbmVIb2hocVhmdUw4c1BYRnpBMzl4Yk9tUHd4M2xrU29tYkI3?=
 =?utf-8?B?bElKNGVVejlTTEljZmdzeWEyMW1PRnNiRzJia3pKbWVXUjhLZWNwcU1TN2hN?=
 =?utf-8?B?RE9rSm41bW5TMVlVaWZGcm5FMTYxKzdSbnRycEtyVUNPYnpCUEJrd095Y2Rh?=
 =?utf-8?B?dEE1WWk5MTNPSldpb2Y0Tyt4NklTME82SUtmbG9Odmc5LzBZRkZ1bkw4WTBF?=
 =?utf-8?B?N1AvcE9hU0Q2WldKYnJLZHFTaytjdnhCcUZMWnFhWHFPSTlGUGJ3R2doMXRa?=
 =?utf-8?B?and1SWNxdTlHTlRsNHpsa2xHellMM3hHNHhmVm5aRDBSdFJ1ZHVFTWVSa0tx?=
 =?utf-8?B?aVpSMTNkT1VDK1Z1QlBCQ04xamRESE5TblZGS3YyTTlURnlycGFWVGlkOEw2?=
 =?utf-8?B?dDRwQ2lla1lOMHJSZ0h2Z2tLbXFsQkxYSmoya2VUSXY0VE5uaDc3YlRuQ2dC?=
 =?utf-8?B?ZVRIbTF2SkxzV3UxbTVnWDhGeUZ1elhlZTNmQWV0Ri81bi9aVDlBb3crZ0Nu?=
 =?utf-8?B?N2wrQUwwTmo4Sno0SXNDUzZGeWNVK0tFRTVMb0RXNzlzS3BsT1FtOHBBaGMz?=
 =?utf-8?B?UDFFZ0cvdzduTkh1YjM0eUxFM1N0eGVBNkxOb0VTV1FrbnF0blNTWXp3eVBq?=
 =?utf-8?B?UEFZck9LTEtxYXVXSEw2bjlQZkZIendKK1FnaG9ENzNzV2JVRGxtaFhXOWEw?=
 =?utf-8?B?NDR6N0ZsNnpWVVZreFJOVFNXSmtqQXVSZUhhQjRrY01TQTY4T3ZHckNMUjdM?=
 =?utf-8?B?bFpTVXkvOVZaSjhubDBnTTMwa1VlNmVCcWNGMG40Ni9kZHVzbmJtY28vamxY?=
 =?utf-8?B?RWVMbEkyQVAvd0pRWUp5MGMyb2pZb1p5VWprTENmM28xNE9NMTBiRGlFSkRS?=
 =?utf-8?B?OG5PR0J0VklUQXNWUVFmVGVWTElYSXpsZ2h1bmh0cVc5VWFxYlVPT0dQK2JK?=
 =?utf-8?B?akdWa2c1UXJkeEVGYmRTbFJudytOZzdVZWtXNGI4VW1VQjEwNURNeVlGSncr?=
 =?utf-8?B?Q1NJMGtyR3dYQk5Na25iUmFSejZhVU5tY1FLVjJXL3ZMVmYxS1AzeGJGMWRo?=
 =?utf-8?B?TXJZUXM1MDNiZGVJbkZrT3NZaDBDWW5CZnVMaDUzUDMybzliOGNWVDBZV21w?=
 =?utf-8?B?enNIMXl4K3AvWVFMYTlwVjFGdUtPVXNTVHl6bVp1NkY1dXd0VW52Mk9GSEY2?=
 =?utf-8?B?NVphZzFMTDRWN0EvTXhZY081dGhRRG13SU5xSEJXRFVzMU9jTExTVFZ1UjNG?=
 =?utf-8?B?L0VjY0JHREdmWnl2ck5yNEQ0Qy9rYkE4Y3pxRE00NlJHeVROSHZtK2tQcUU5?=
 =?utf-8?B?clFvVnZPZTFJM25uN29uN0s3aDFHdkdpUjJoZ09ITFU3YUo4YktkQUtVY1Z1?=
 =?utf-8?B?OFIxWFlXdGtTbTlDcXQzQ3VWSDd0czNJdmdxMStJZi8wVGtZKzE4ZGxOcmlW?=
 =?utf-8?B?TlFEUVdTTlBpa1VTT1VUR3o4dEJiMlk5M0xkSzRwempzV1lyU094YmQxcHph?=
 =?utf-8?B?UEZVY2FiUDljdjUxVWRBLzlMQ0RJUzBVdmlxblFEL05SSjBsNm5kZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 026c8f48-f51b-4127-07a8-08de4e640b76
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 03:14:33.1881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfIaFTuPWGnQJTUy4Vc3GRh9LORkB5JmVXXwyQn7h31a05dwWYRCWiA3AwokLFzgQhv22f2PemJB9GWLv0GeBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5725
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

On 2026-01-08 at 13:53 +1100, Zi Yan <ziy@nvidia.com> wrote...
> On 7 Jan 2026, at 21:17, Matthew Brost wrote:
> 
> > On Thu, Jan 08, 2026 at 11:56:03AM +1100, Balbir Singh wrote:
> >> On 1/8/26 08:03, Zi Yan wrote:
> >>> On 7 Jan 2026, at 16:15, Matthew Brost wrote:
> >>>
> >>>> On Wed, Jan 07, 2026 at 03:38:35PM -0500, Zi Yan wrote:
> >>>>> On 7 Jan 2026, at 15:20, Zi Yan wrote:
> >>>>>
> >>>>>> +THP folks
> >>>>>
> >>>>> +willy, since he commented in another thread.
> >>>>>
> >>>>>>
> >>>>>> On 16 Dec 2025, at 15:10, Francois Dugast wrote:
> >>>>>>
> >>>>>>> From: Matthew Brost <matthew.brost@intel.com>
> >>>>>>>
> >>>>>>> Introduce migrate_device_split_page() to split a device page into
> >>>>>>> lower-order pages. Used when a folio allocated as higher-order is freed
> >>>>>>> and later reallocated at a smaller order by the driver memory manager.
> >>>>>>>
> >>>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
> >>>>>>> Cc: Balbir Singh <balbirs@nvidia.com>
> >>>>>>> Cc: dri-devel@lists.freedesktop.org
> >>>>>>> Cc: linux-mm@kvack.org
> >>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>>>>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> >>>>>>> ---
> >>>>>>>  include/linux/huge_mm.h |  3 +++
> >>>>>>>  include/linux/migrate.h |  1 +
> >>>>>>>  mm/huge_memory.c        |  6 ++---
> >>>>>>>  mm/migrate_device.c     | 49 +++++++++++++++++++++++++++++++++++++++++
> >>>>>>>  4 files changed, 56 insertions(+), 3 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> >>>>>>> index a4d9f964dfde..6ad8f359bc0d 100644
> >>>>>>> --- a/include/linux/huge_mm.h
> >>>>>>> +++ b/include/linux/huge_mm.h
> >>>>>>> @@ -374,6 +374,9 @@ int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list
> >>>>>>>  int folio_split_unmapped(struct folio *folio, unsigned int new_order);
> >>>>>>>  unsigned int min_order_for_split(struct folio *folio);
> >>>>>>>  int split_folio_to_list(struct folio *folio, struct list_head *list);
> >>>>>>> +int __split_unmapped_folio(struct folio *folio, int new_order,
> >>>>>>> +			   struct page *split_at, struct xa_state *xas,
> >>>>>>> +			   struct address_space *mapping, enum split_type split_type);
> >>>>>>>  int folio_check_splittable(struct folio *folio, unsigned int new_order,
> >>>>>>>  			   enum split_type split_type);
> >>>>>>>  int folio_split(struct folio *folio, unsigned int new_order, struct page *page,
> >>>>>>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> >>>>>>> index 26ca00c325d9..ec65e4fd5f88 100644
> >>>>>>> --- a/include/linux/migrate.h
> >>>>>>> +++ b/include/linux/migrate.h
> >>>>>>> @@ -192,6 +192,7 @@ void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
> >>>>>>>  			unsigned long npages);
> >>>>>>>  void migrate_device_finalize(unsigned long *src_pfns,
> >>>>>>>  			unsigned long *dst_pfns, unsigned long npages);
> >>>>>>> +int migrate_device_split_page(struct page *page);
> >>>>>>>
> >>>>>>>  #endif /* CONFIG_MIGRATION */
> >>>>>>>
> >>>>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> >>>>>>> index 40cf59301c21..7ded35a3ecec 100644
> >>>>>>> --- a/mm/huge_memory.c
> >>>>>>> +++ b/mm/huge_memory.c
> >>>>>>> @@ -3621,9 +3621,9 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
> >>>>>>>   * Return: 0 - successful, <0 - failed (if -ENOMEM is returned, @folio might be
> >>>>>>>   * split but not to @new_order, the caller needs to check)
> >>>>>>>   */
> >>>>>>> -static int __split_unmapped_folio(struct folio *folio, int new_order,
> >>>>>>> -		struct page *split_at, struct xa_state *xas,
> >>>>>>> -		struct address_space *mapping, enum split_type split_type)
> >>>>>>> +int __split_unmapped_folio(struct folio *folio, int new_order,
> >>>>>>> +			   struct page *split_at, struct xa_state *xas,
> >>>>>>> +			   struct address_space *mapping, enum split_type split_type)
> >>>>>>>  {
> >>>>>>>  	const bool is_anon = folio_test_anon(folio);
> >>>>>>>  	int old_order = folio_order(folio);
> >>>>>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> >>>>>>> index 23379663b1e1..eb0f0e938947 100644
> >>>>>>> --- a/mm/migrate_device.c
> >>>>>>> +++ b/mm/migrate_device.c
> >>>>>>> @@ -775,6 +775,49 @@ int migrate_vma_setup(struct migrate_vma *args)
> >>>>>>>  EXPORT_SYMBOL(migrate_vma_setup);
> >>>>>>>
> >>>>>>>  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> >>>>>>> +/**
> >>>>>>> + * migrate_device_split_page() - Split device page
> >>>>>>> + * @page: Device page to split
> >>>>>>> + *
> >>>>>>> + * Splits a device page into smaller pages. Typically called when reallocating a
> >>>>>>> + * folio to a smaller size. Inherently racy—only safe if the caller ensures
> >>>>>>> + * mutual exclusion within the page's folio (i.e., no other threads are using
> >>>>>>> + * pages within the folio). Expected to be called a free device page and
> >>>>>>> + * restores all split out pages to a free state.
> >>>>>>> + */
> >>>>>
> >>>>> Do you mind explaining why __split_unmapped_folio() is needed for a free device
> >>>>> page? A free page is not supposed to be a large folio, at least from a core
> >>>>> MM point of view. __split_unmapped_folio() is intended to work on large folios
> >>>>> (or compound pages), even if the input folio has refcount == 0 (because it is
> >>>>> frozen).
> >>>>>
> >>>>
> >>>> Well, then maybe this is a bug in core MM where the freed page is still
> >>>> a THP. Let me explain the scenario and why this is needed from my POV.
> >>>>
> >>>> Our VRAM allocator in Xe (and several other DRM drivers) is DRM buddy.
> >>>> This is a shared pool between traditional DRM GEMs (buffer objects) and
> >>>> SVM allocations (pages). It doesn’t have any view of the page backing—it
> >>>> basically just hands back a pointer to VRAM space that we allocate from.
> >>>> From that, if it’s an SVM allocation, we can derive the device pages.
> >>>>
> >>>> What I see happening is: a 2M buddy allocation occurs, we make the
> >>>> backing device pages a large folio, and sometime later the folio
> >>>> refcount goes to zero and we free the buddy allocation. Later, the buddy
> >>>> allocation is reused for a smaller allocation (e.g., 4K or 64K), but the
> >>>> backing pages are still a large folio. Here is where we need to split
> >>>
> >>> I agree with you that it might be a bug in free_zone_device_folio() based
> >>> on my understanding. Since zone_device_page_init() calls prep_compound_page()
> >>> for >0 orders, but free_zone_device_folio() never reverse the process.
> >>>
> >>> Balbir and Alistair might be able to help here.

Just catching up after the Christmas break.

> >>
> >> I agree it's an API limitation
> 
> I am not sure. If free_zone_device_folio() does not get rid of large folio
> metadata, there is no guarantee that a freed large device private folio will
> be reallocated as a large device private folio. And when mTHP support is
> added, the folio order might change too. That can cause issues when
> compound_head() is called on a tail page of a previously large folio, since
> compound_head() will return the old head page instead of the tail page itself.

I agree that freeing the device folio should get rid of the large folio. That
would also keep it consistent with what we do for FS DAX for example.

> >>
> >>>
> >>> I cherry picked the code from __free_frozen_pages() to reverse the process.
> >>> Can you give it a try to see if it solve the above issue? Thanks.

It would be nice if this could be a common helper for freeing compound
ZONE_DEVICE pages. FS DAX already has this for example:

static inline unsigned long dax_folio_put(struct folio *folio)
{
	unsigned long ref;
	int order, i;

	if (!dax_folio_is_shared(folio))
		ref = 0;
	else
		ref = --folio->share;

	if (ref)
		return ref;

	folio->mapping = NULL;
	order = folio_order(folio);
	if (!order)
		return 0;
	folio_reset_order(folio);

	for (i = 0; i < (1UL << order); i++) {
		struct dev_pagemap *pgmap = page_pgmap(&folio->page);
		struct page *page = folio_page(folio, i);
		struct folio *new_folio = (struct folio *)page;

		ClearPageHead(page);
		clear_compound_head(page);

		new_folio->mapping = NULL;
		/*
		 * Reset pgmap which was over-written by
		 * prep_compound_page().
		 */
		new_folio->pgmap = pgmap;
		new_folio->share = 0;
		WARN_ON_ONCE(folio_ref_count(new_folio));
	}

	return ref;
}

Aside from the weird refcount checks that FS DAX needs to at the start of this
function I don't think there is anything specific to DEVICE_PRIVATE pages there.

> >>>
> >>> From 3aa03baa39b7e62ea079e826de6ed5aab3061e46 Mon Sep 17 00:00:00 2001
> >>> From: Zi Yan <ziy@nvidia.com>
> >>> Date: Wed, 7 Jan 2026 16:49:52 -0500
> >>> Subject: [PATCH] mm/memremap: free device private folio fix
> >>> Content-Type: text/plain; charset="utf-8"
> >>>
> >>> Signed-off-by: Zi Yan <ziy@nvidia.com>
> >>> ---
> >>>  mm/memremap.c | 15 +++++++++++++++
> >>>  1 file changed, 15 insertions(+)
> >>>
> >>> diff --git a/mm/memremap.c b/mm/memremap.c
> >>> index 63c6ab4fdf08..483666ff7271 100644
> >>> --- a/mm/memremap.c
> >>> +++ b/mm/memremap.c
> >>> @@ -475,6 +475,21 @@ void free_zone_device_folio(struct folio *folio)
> >>>  		pgmap->ops->folio_free(folio);
> >>>  		break;
> >>>  	}
> >>> +
> >>> +	if (nr > 1) {
> >>> +		struct page *head = folio_page(folio, 0);
> >>> +
> >>> +		head[1].flags.f &= ~PAGE_FLAGS_SECOND;
> >>> +#ifdef NR_PAGES_IN_LARGE_FOLIO
> >>> +		folio->_nr_pages = 0;
> >>> +#endif
> >>> +		for (i = 1; i < nr; i++) {
> >>> +			(head + i)->mapping = NULL;
> >>> +			clear_compound_head(head + i);
> >>
> >> I see that your skipping the checks in free_page_tail_prepare()? IIUC, we should be able
> >> to invoke it even for zone device private pages
> 
> I am not sure about what part of compound page is also used in device private folio.
> Yes, it is better to add right checks.
> 
> >>
> >>> +		}
> >>> +		folio->mapping = NULL;
> >>
> >> This is already done in free_zone_device_folio()
> >>
> >>> +		head->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;
> >>
> >> I don't think this is required for zone device private folios, but I suppose it
> >> keeps the code generic
> >>
> >
> > Well, the above code doesn’t work, but I think it’s the right idea.
> > clear_compound_head aliases to pgmap, which we don’t want to be NULL. I
> 
> Thank you for pointing it out. I am not familiar with device private page code.
> 
> > believe the individual pages likely need their flags cleared (?), and
> 
> Yes, I missed the tail page flag clearing part.
> 
> > this step must be done before calling folio_free and include a barrier,
> > as the page can be immediately reallocated.
> >
> > So here’s what I came up with, and it seems to work (for Xe, GPU SVM):
> >
> >  mm/memremap.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/mm/memremap.c b/mm/memremap.c
> > index 63c6ab4fdf08..ac20abb6a441 100644
> > --- a/mm/memremap.c
> > +++ b/mm/memremap.c
> > @@ -448,6 +448,27 @@ void free_zone_device_folio(struct folio *folio)
> >             pgmap->type != MEMORY_DEVICE_GENERIC)
> >                 folio->mapping = NULL;
> >
> > +       if (nr > 1) {
> > +               struct page *head = folio_page(folio, 0);
> > +
> > +               head[1].flags.f &= ~PAGE_FLAGS_SECOND;
> > +#ifdef NR_PAGES_IN_LARGE_FOLIO
> > +               folio->_nr_pages = 0;
> > +#endif
> > +               for (i = 1; i < nr; i++) {
> > +                       struct folio *new_folio = (struct folio *)(head + i);
> > +
> > +                       (head + i)->mapping = NULL;
> > +                       (head + i)->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;
> > +
> > +                       /* Overwrite compound_head with pgmap */
> > +                       new_folio->pgmap = pgmap;
> > +               }
> > +
> > +               head->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;
> > +               smp_wmb();	/* Changes but be visable before freeing folio */
> > +       }
> > +
> >         switch (pgmap->type) {
> >         case MEMORY_DEVICE_PRIVATE:
> >         case MEMORY_DEVICE_COHERENT:
> >
> 
> It looks good to me, but I am very likely missing the detail on device private
> pages. Like Balbir pointed out above, for tail pages, calling
> free_tail_page_prepare() might be better to get sanity checks like normal
> large folio, although you will need to set ->pgmap after it.
> 
> It is better to send it as a proper patch and get reviews from other
> MM folks.
> 
> >>> +	}
> >>>  }
> >>>
> >>>  void zone_device_page_init(struct page *page, unsigned int order)
> >>
> >>
> >> Otherwise, it seems like the right way to solve the issue.
> >>
> >
> > My question is: why isn’t Nouveau hitting this issue, or your Nvidia
> > out-of-tree driver (lack of testing, Xe's test suite coverage is quite
> > good at finding corners).
> >
> > Also, will this change in behavior break either ofthose drivers?
> >
> > Matt
> >
> >> Balbir
> 
> 
> Best Regards,
> Yan, Zi

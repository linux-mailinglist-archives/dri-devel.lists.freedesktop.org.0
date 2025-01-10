Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FA6A09CAD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 21:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6F110E535;
	Fri, 10 Jan 2025 20:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pLAwJcD+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2053.outbound.protection.outlook.com [40.107.212.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0957210E535
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 20:54:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWBs3TlJpT4XT6vS9xO4CxOt4EloIq1PnJKMFJqhqk87eLLYb/+4R5JWgZwxqbdjr+o08VSnGYnj7yr5LBd4PiXyQ0z2Qvx0Uvza7eXiNIdKpj1LsYIP+5UaWrkK8QxV78Qi5Q4QYEC/BJe1DNvlBXez3K70Be42xQF9QeAnBIT3ThUfignhUc4vvh26F/8sHNOx0gePdtIoIPLR/2myl57yWrG1J0/e7NTLq4a9PdUSwTqWifl2G3b0v+9Gdc/0X4begL0f76so/aukfw/BFuBu2RFYRwAEzU41vU8KAs0yr87/EUbmJQ57ocEoFREfm49SKkBjXCPBqHSMrRRVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJjCopZHe+t4w7jO2JfL3u/eimVNy/hKKO6+PWHe2iA=;
 b=LMlW8i6uvYd/H96d4pXX1h/v5aQimoUqkcbc0/LSS2SmCi6+41NESFnjyqqfIAIRLVNCLPQ3V8cEAdd3pMWEiYZ69y05r4YfdCpXibGK2DKuNUU1wmjirE1cGNgUKlhIXV+zMLf/NrDl8r6iCmoP/tlFJRqJA++FSuK23oOKiv08iTiyzDZ8OvXkDeit9B0hreLUbQTQpB9nfggOry3zsnoIAsTIm0itqrc0uyElE+7kbzcp062Jl8drYyVyPjU/vbcDpeptwtSZq4a9mUXyhLp/6sjRyo0403wxISaSWN2GpdH33uFjO3n1WsKq35RJ0YW8u2zgRBiQz6ozl5lqrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJjCopZHe+t4w7jO2JfL3u/eimVNy/hKKO6+PWHe2iA=;
 b=pLAwJcD+STtLBf4GVlYDtPqOdzM7MQ9jIXH+tQgbVby5A3sAL+oV2ZehLSworZiWRJ6HzIIR8ioys7z46JoLxY5ZlBtfcOokJ6u/GeIXHZJYiILs7CwoL9hbnr7IAAoH80EkY1q03tvxq9hxoaI83jtF5Nzl93EBD/FkaekPtkCgIY8C7cKUiNu3lONcCTennKXcMXINLfvrOkh8yuIBhSDJZpvGPqa+h8ByelKkqVqVRwLHM9hxpR7+BZeJkGvFq4BE47DkXjQG5VIAtSDQu8DkctWHoL/4pPyVAS8EAS3QOHVhJ8I2GEApinPz/sM5vVKoHwtQgCod51YXAflAlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA1PR12MB8335.namprd12.prod.outlook.com (2603:10b6:208:3fa::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 20:54:56 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8314.015; Fri, 10 Jan 2025
 20:54:56 +0000
Date: Fri, 10 Jan 2025 16:54:54 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <20250110205454.GM5556@nvidia.com>
References: <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
 <20250108132358.GP5556@nvidia.com>
 <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com>
 <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
 <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <c823f70c-9b70-441c-b046-71058c315857@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c823f70c-9b70-441c-b046-71058c315857@amd.com>
X-ClientProxiedBy: BN0PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:408:ee::25) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA1PR12MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: 557ca1df-5488-4915-1049-08dd31b909c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cm0wN0JaaHZSeHdzOE9KVkRIdU9QUG9pemFrQWprUFJTVE41YStvMmx4OUZv?=
 =?utf-8?B?TWNlZTA4andJSmNvamxvQVd3MnlTckszOHJ1cWdpUUJiT2IyU2w5a2hDdkZi?=
 =?utf-8?B?VHBGdS9rQkRpWGxwaThKREZYSVBuQUk2a0lVc1FXeTRPOWNGMnhKUmNDRjEr?=
 =?utf-8?B?Mlc2Sjk5aE0ybHBoNDdKWXo2MHpDTzNiNUtDU2kzQWJweTdCK3FxUlc2MklY?=
 =?utf-8?B?dmUwVmdRSVpoRTEvamJCKzRPNGtYUVQwUG1IcVdVdmlxQTFDUEJBaUNMYU8r?=
 =?utf-8?B?WXdaTmFwUzBjQTJxcXhJOXBYOHppMFUyeExydldGQUZIVXhrVFJ2WlZUbXl1?=
 =?utf-8?B?SFRBeEJ5Nk55Q0pZNW14emZ0Y0E5V3R5UGpTYmZ1K2xmMnpqVDV2NDhpZVkz?=
 =?utf-8?B?c1JORnZvamlkOHRiaGxma3o0UTFKN2NJTHhRME9iSTZsS3RxYXl6elBKZTM2?=
 =?utf-8?B?VHNGTWpaLy8xckRneVdMVldnYUg1MUVOSFVmd3pWTlYrZjF1TlFtUWh4WnR4?=
 =?utf-8?B?T0xmaVBIQjRLM1ptbHZMT3Bud01BNURyaisxb1Vvc1lKTTNpUHFzZUZoSGds?=
 =?utf-8?B?T0tqaU9Ec3haVU5lZ0tTcktLa2tuYUxDRU9WSE1IbWxBcHFBWkhiZE05ajlJ?=
 =?utf-8?B?QzJ1TUd3Nko2QldQc3NmcDR1TndjNUZ3Y09ZbHpJU20yNkV2NFNFWjF2ZzVx?=
 =?utf-8?B?WFRvV3JrTWc0R3M0b0xsaFFTY0hRdWR6VmVRRDlwbnhKMWR3SFhidy9Vd2Vt?=
 =?utf-8?B?MnFWdmlzNHlnd3h4d3c4bXhodTJlT2xxNGpGOU5TZHZkdW9mYmpTUWRKN204?=
 =?utf-8?B?K0lQRU5XVlljbCtvZUc5Tzg0S1l6SGhiS2ptUE1qcWMwUXY4MlkzT0NHWVc1?=
 =?utf-8?B?N3FtN0F4Q3AxQ3hUbnE0QWEwRVZRdkJMcEgvMU9CWTMrUGVGbVpKakhvQWYx?=
 =?utf-8?B?aXpEOGdsSExZbmMyS0g3a0h5MElvekhDNG56MDNBUVAvaG42Vi9FRWxMbDZn?=
 =?utf-8?B?aHZYUGx2U0VHdXRaY0xYV2ovaEpHb3NheTYwa2JPd1NEYUpOaTVJbFR4RVN1?=
 =?utf-8?B?TEZ6UXd4NGYvQ3FSZ3VvSzVwNXNtRUlsZDBNYlJvdjNzMHFoTVcrYWNoY2NH?=
 =?utf-8?B?MXdUcWFZMGdkRG9UbEtycTVTcFNzNWpHY3lIN0RyZ1VHL1JxbTh0MXRwS1pJ?=
 =?utf-8?B?MzlzVWwyS2FVWDBFTDdQaUZqN1dYUkg5NnlnZ3c1aUc0aUdWNmFQRnN6SUk2?=
 =?utf-8?B?UG9WaUJzRHVxaElMTGYwaFY1Zm1DL0QyUHF2ZUhQcVg5KzVLWUw3YXhQR0pJ?=
 =?utf-8?B?bThBVXRjUThOdVhua1FFVW5ua2U4VHcxYTVNZjhoTW9FWHhqMXhXTFU4Ump1?=
 =?utf-8?B?WWtnVFBhMmZGTGpCK0t5ME5NaVVwM0Z2blhGV1IwRk5sZHg4RDJCa3BIN3FY?=
 =?utf-8?B?UmpEZ0NYMFFwSWlUVXdYSjY4VXVRT0xyWEZTYVhiT2JkL0x5TVBsdkl2Q1ph?=
 =?utf-8?B?QjhlcHA1QUx3VStCNUN2WFduQ3pva25lYldSZk5tbVArb2VJM0tZeWE0ZER1?=
 =?utf-8?B?NUIxUkw0Vk5KSDltdnZGSDdhNkVpbDNEZXE4TmlhbjNicWVRb2d0bENtTWhD?=
 =?utf-8?B?RSs3eWpJOVVTYkdza3lFczg0aXhJSzJiK3VhVTRWeWV5bGU5YTF1aVBGV1py?=
 =?utf-8?B?cCtyeFFlbjNydnVpeTlOT3VsNTJGWUpFMXlFSkQ4MHB5S1BQcnpUaDBSaGV2?=
 =?utf-8?B?ODg0TWMxVWNkYklBU2hkTThUTHpsL0syckk4STBuWHIxN1d4bTdsM3VWek5j?=
 =?utf-8?B?L1ltOGZ4aDNVNllGS3ZVN3lwTmJlK1k4aUVsYWw2c3hEdnZFU3VmM3Q4NW1R?=
 =?utf-8?Q?ZeZ6gADk0T9nM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjNZSTFCN0RXczVJOUErNEhnZk9JcDJOUGxSVlcxYnhrcFFkSjVtZ0xYVUd3?=
 =?utf-8?B?anhVdGRKcXcraDk0Tm03MWJrQk9FQVI0ZkUxbkpwTEZ3ejdzMytNMllNUHI2?=
 =?utf-8?B?RXVrOWFVNUlxMktPQk85TEVLZUdJS2RNRWxpb001a1c4bWdCTllmdW5wYlZG?=
 =?utf-8?B?WUtIWmNWZm12V0JxRHZwWjExb1A0MjN6TnB2SVRUZ0dyN0d0MW1WMUlzZlll?=
 =?utf-8?B?V2dCdHFUY2NVZ0NXTkFqRWlMaFR3V3FyZWtPWnVrZmJHUkw4VEFTeWNPKytN?=
 =?utf-8?B?OHc1eUd3bzYwV3lKNG1PYVNCWEZqQnBiaVA5bFNBOGhjVHVYRXlEZjM1SHFR?=
 =?utf-8?B?SGRRTXRJTHNtenk5aS85SHdBa3Z6Yi9sQUExbTB3bDVWQytLSVZsVE5yS0Vu?=
 =?utf-8?B?L3NiOEY0T1NkRDFEaWlGNDVqaEQwb0FQRHcrc2I5YkpjaXBEOXNiUldBWklP?=
 =?utf-8?B?OWdKUHdxYlJqaVo5TnJuTzJBL3ZXSHp1QVM2ZnhqVEIwM0d6M2I4SklYMWpa?=
 =?utf-8?B?enB4V2NTSlJMZHVvRXZtaERrU2Jtc1h6Tm16SzBwRXk4ZlJIZ1BUMWtjcGQw?=
 =?utf-8?B?Z0k5S0tZT1FQYlVYc1A2TkVrNmJJWVJWOEhIbDlDSkxHdWtXRUMvRGtiOThr?=
 =?utf-8?B?c21zN0pBUTJlYzBpM2NsYUVobStza0JwVWRrb2RBNFdTQ1NKVEk3emlKTGM1?=
 =?utf-8?B?YU9rR0UwcnNabVVnREdLV0dSajlPc21BTHZCWHF3ZWNIZnd4R3gwMUhwdzRi?=
 =?utf-8?B?SnRmMmd0RHE4K2dkTk9yU0dLWkdWSGR5aXZSNjhzZXF3WWlMV0dIcWFzOGZu?=
 =?utf-8?B?T3AwZzdUbm9oK1BNbk1BeU45RWtkaEVDV2VaZjVTWGM0YjFleGV2ZHM2YkNP?=
 =?utf-8?B?TXpMQVdWL0krVkNvZnRZOWFzOXZXT0NIck1tYVd0NjlVNGFWMVprbi9CSmVr?=
 =?utf-8?B?ekdoRmxIcTZhbnZScnJtRDZHc0hHZWk0K1hVVHFBVXc0Rlk1OGxscG5FVHFQ?=
 =?utf-8?B?b29pa05TbXBRRC9SRmlOdlhSMWNBSjFNQncyQXBFL0tLb0tvRFpyVUdOZTE5?=
 =?utf-8?B?UWVTam02UnduckhvOHpDYXhRZXBPN2VSNzBjU29JdDgzMmFHdjVaajZPT25S?=
 =?utf-8?B?cVZMT2QyZ3Y5WW5oVFp3NU5KSHVkUk1oUGRJMS9IU3o1MHhUYUh5SjhXMVVQ?=
 =?utf-8?B?QVpsKzdEQUFmVzlYQWd4eEFpMEJoYXRDRzM5c01SZ1U4ZXVDeC9xQVNPOFZx?=
 =?utf-8?B?bktXRDduUEw5dDNTa24zem1wSlRGbzFKeElrOThXU0x4VnVzUkJWRkdyaWdN?=
 =?utf-8?B?bFN1Q0VqU0lHVmRwdXhiVVJlNGRqdnJEdTkyUDVYRGFHRUxIaW1ZaHpvMXZE?=
 =?utf-8?B?cW5yOThYbTNCMUZpcmZHNGtNK05XdjFwbXZGcHh6VFBQVi96S09WalFHQnNG?=
 =?utf-8?B?QVFJaFQ4dFNjRnRaVEhnekswMzJ4dlRKKzdnR0NHcGI2eXVNNzhCVktxaE1H?=
 =?utf-8?B?dDJ2OC9HLzFObXhBWjZPV256eEdZQmV5MnphWVVMd2Z0aHZoTmJQc01mK2l2?=
 =?utf-8?B?WS91YmJReEVMRTErcThmbzh3NndFWkI2S05ZZmRxSTNId0luZUJDcmtOTmJL?=
 =?utf-8?B?SHk5Nmo0VmZ1VHpwcnVPbm9jcEFxWVJmRUdYcU54YjB1OTZiaE52UXV1WG1K?=
 =?utf-8?B?N2owNWJsT1FjUGoxdWY1RXRyMFZxem81N1dMNlNGS2M4akdObkl2NWtveGM4?=
 =?utf-8?B?RFhTbEs2ZXp6SXJUZEVjc1liQ3YwQkVOSTZkKzVZSnNLUlpsSVZOdlgwTnVK?=
 =?utf-8?B?bUNrcXRzODJCSHJ5Y29ha0lxcDZ4Z2Z0NXF2M2ZUYis2K0ZaWXp2c0NtTW9z?=
 =?utf-8?B?alYzYmljYlRhOU5vTFNYM3d0NGV3ZEcveDNlbnRRVlV1dHp1NmNmWnJrcnhv?=
 =?utf-8?B?NjRyenRTZWl2WmxtSnpNMW4yQlhhQ0t0RVp1a09uSzF3TnRLZ1JpNTJ6S3VL?=
 =?utf-8?B?djVYK05tYW1vNzBXMG9kWnUxUHNkck1sTUJpVzNIb3RtM1oxcjdrRTZ0Ykgw?=
 =?utf-8?B?eFQ0WDRQQTJYaDdVT0NqcllSKzBabkc5L2RlcFQ4dUIydkxpS0REQnhEa3dy?=
 =?utf-8?Q?Cc74d9X8eSDm4Co/+1gh6c8/q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 557ca1df-5488-4915-1049-08dd31b909c0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 20:54:56.0035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pkq3ViFH+ryh1RiEpIaMOMrTVWcAs8kDjnNFbuOl62/W3SqwqGHjTzWwwTeXUMkZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8335
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

On Thu, Jan 09, 2025 at 09:09:46AM +0100, Christian König wrote:
> Answering on my reply once more as pure text mail.

It is hard to do anything with your HTML mails :\

> > Well you were also the person who mangled the struct page pointers in
> > the scatterlist because people were abusing this and getting a bloody
> > nose :)

But alot of this is because scatterlist is too limited, you actually
can't correctly describe anything except struct page backed CPU memory
in a scatterlist.

As soon as we can correctly describe everything in a datastructure
these issues go away - or at least turn into a compatability
exchange problem.

> > > > Where I do agree with Christian is that stuffing pfn support into the
> > > > dma_buf_attachment interfaces feels a bit much wrong.
> > > So it could a dmabuf interface like mmap/vmap()? I was also wondering
> > > about that. But finally I start to use dma_buf_attachment interface
> > > because of leveraging existing buffer pin and move_notify.
> > 
> > Exactly that's the point, sharing pfn doesn't work with the pin and
> > move_notify interfaces because of the MMU notifier approach Sima
> > mentioned.

Huh? 

mmu notifiers are for tracking changes to VMAs

pin/move_notify are for tracking changes the the underlying memory of
a DMABUF.

How does sharing the PFN vs DMA addre effect the pin/move_notify
lifetime rules at all?

> > > > > > > 3) Importing devices need to know if they are working with PCI P2P
> > > > > > > addresses during mapping because they need to do things like turn on
> > > > > > > ATS on their DMA. As for multi-path we have the same hacks inside mlx5
> > > > > > > today that assume DMABUFs are always P2P because we cannot determine
> > > > > > > if things are P2P or not after being DMA mapped.
> > > > > > Why would you need ATS on PCI P2P and not for system memory accesses?
> > > > > ATS has a significant performance cost. It is mandatory for PCI P2P,
> > > > > but ideally should be avoided for CPU memory.
> > > > Huh, I didn't know that. And yeah kinda means we've butchered the pci p2p
> > > > stuff a bit I guess ...
> > 
> > Hui? Why should ATS be mandatory for PCI P2P?

I should say "mandatory on some configurations"

If you need the iommu turned on, and you have a PCI switch in your
path, then ATS allows you to have full P2P bandwidth and retain full
IOMMU security.

> > We have tons of production systems using PCI P2P without ATS. And it's
> > the first time I hear that.

It is situational and topologically dependent. We have very large
number of deployed systems now that rely on ATS for PCI P2P.

> > As Sima explained you either have follow_pfn() and mmu_notifier or you
> > have DMA addresses and dma_resv lock / dma_fence.
> > 
> > Just giving out PFNs without some lifetime associated with them is one
> > of the major problems we faced before and really not something you can
> > do.

Certainly I never imagined there would be no liftime, I expect
anything coming out of the dmabuf interface to use the dma_resv lock,
fence and move_notify for lifetime managament, regardless of how the
target memory is described.

> > > > separate access mechanism just for that. It would be the 5th or so (kernel
> > > > vmap, userspace mmap, dma_buf_attach and driver private stuff like
> > > > virtio_dma_buf.c where you access your buffer with a uuid), so really not
> > > > a big deal.
> > > OK, will think more about that.
> > 
> > Please note that we have follow_pfn() + mmu_notifier working for KVM/XEN
> > with MMIO mappings and P2P. And that required exactly zero DMA-buf
> > changes :)

> > I don't fully understand your use case, but I think it's quite likely
> > that we already have that working.

In Intel CC systems you cannot mmap secure memory or the system will
take a machine check.

You have to convey secure memory inside a FD entirely within the
kernel so that only an importer that understands how to handle secure
memory (such as KVM) is using it to avoid machine checking.

The patch series here should be thought of as the first part of this,
allowing PFNs to flow without VMAs. IMHO the second part of preventing
machine checks is not complete.

In the approach I have been talking about the secure memory would be
represented by a p2p_provider structure that is incompatible with
everything else. For instance importers that can only do DMA would
simply cleanly fail when presented with this memory.

Jason

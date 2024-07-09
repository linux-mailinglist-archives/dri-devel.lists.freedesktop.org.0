Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA3B92BD8F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 16:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1645910E57D;
	Tue,  9 Jul 2024 14:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LR86TvGD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2058.outbound.protection.outlook.com [40.107.100.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC9A10E57D;
 Tue,  9 Jul 2024 14:57:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7/DgevdnoYH8BKH6R2i7cqeC4ChGB05i1mRzVCXI6hnVbY/JJZ8GaD1CsC8rgcm/ySq5OClinufK9E5kyHZZFLgjY9/GaGRiqGnGr1sY+d2LPsCZM0UTslFS8Arb0F9bm/qEmbIChseJNiwX+4wWb8zx13QetlZzWtXlTHc9RY/48FRiocIZqfrnvsoqaCJ1cRIu0grqD3/FJYyN2meyuUdwEk4lN30+TNSbkcKk9pn5jBXnOS27T5O5rQsoErGNyLMxKytOjxqjBkzKoXDw7YE1kZEMjV3nXfKZR578fLUwqUt3WB5MtpUzryOP6WBxOF65rSFlTR3XtzRf0+NlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ja2cXDJLvu/O8Y3olXVXteDDXq9mvtrMptGFV3Ye7bo=;
 b=meJT3dIFaqY2HOpgPlR/1VvcJA55PsiaaXjYoBzJCWQFci1NJ6OKNWOGUCU2CNEm7uCwV8QPg3IGFVpM/pAD5rypVOe8NbmSM/owA2NZDkq3XRS7Yy98cue0G3P9VvtnHlefUNw4+oKZ0wTLtOjyPB3aX5AwwJ6hVyxyLEW5ms3+nZdwrhqwUWDsIsuTzXX5JeCUL8cUWj6+fDiu9RxNBqmalvlRKd7TfHR/3qMCNtOnemsvkbzQwVKr6RgPsw8ohraSCWMSiQoyq38JZocmqEpSOdZkB5tkmDWtJY5Uz6EH5SPVbJKM7DgMOak1PyA9m5LLv/jqOULJslPEzsxCdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ja2cXDJLvu/O8Y3olXVXteDDXq9mvtrMptGFV3Ye7bo=;
 b=LR86TvGDEgMHuysbPCy/lU9lHN0jSMZ+k6wGOu+sjrecwEpxlqpEFacgiMIzaUiKX+2Fi60H7i5k40VETnXzOoUSzwGkiMRzBMdmR6c/hCDrIlsGf9UfZBPWHvD25aiWPDzWCu7t0L8DTIQWyvftQs3oHrdLsgRukqCK0RB7gyc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by DS7PR12MB6214.namprd12.prod.outlook.com (2603:10b6:8:96::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 14:57:23 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e%5]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 14:57:22 +0000
Message-ID: <f2c15b94-5b94-4e58-959f-4912047eec47@amd.com>
Date: Tue, 9 Jul 2024 08:57:18 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and
 120Hz
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
 <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
 <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info>
 <CABXGCsNoFfMn7LaqqFgEPg-ECyUPN=f=SXVrFi=GZk6c69-Gqw@mail.gmail.com>
 <CADnq5_PDSkr4hOHJmb1J30UC0a7sXsm5-TPkEmjzffMK_A+7ug@mail.gmail.com>
 <ea465a40-f673-42b1-8b1c-a2efb20cd562@amd.com>
 <CABXGCsPyrUEqDq2gbr4VLw5ncd9cKoCZ9nOr2SRfg8Lh=9H5Kg@mail.gmail.com>
 <af91ef9c-5050-4f16-898a-f0c02a293d3f@leemhuis.info>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <af91ef9c-5050-4f16-898a-f0c02a293d3f@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0317.namprd03.prod.outlook.com
 (2603:10b6:408:112::22) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|DS7PR12MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 32973ca4-67b4-450c-9def-08dca027703f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnhtMVh5V2JvaEQ1V0I2SnlLb05WMHYwODI5UUxvZk91bzdRckxjVmEwamM0?=
 =?utf-8?B?RFUrNWE5ZGpwcHhDVlkramEwTDlhSkhYZ2VpWjlNa0g3Q2dZb1JSZktzZzVM?=
 =?utf-8?B?MVpJL1Roc1JPTmExMTlOY0h5VlNJRjcvM3djRTlzS1hBSC9IZm5xY3I2d1d5?=
 =?utf-8?B?S3hOVTZIencyM1dQTUZlV3J0R2M4a2hVMm5WT09Vc2xMZVc1NjZsREtJK2pJ?=
 =?utf-8?B?S3R5Nm5ENXdWMzNSR3BlT3UyOWhkTFVCSHBzcXd6YzhuZVFRTHlqeTU0ZDlL?=
 =?utf-8?B?MGNLcHViTEU3N29FcWhrY1doWEN6NWxIR29reEpBdmhqaWtZbFRJNHVBYm5W?=
 =?utf-8?B?S0U1c2tkN2ZzR2NOWllaOVFSbDB4Y056TEFFUUhnUFVvZEw4R0RFbUNSSmtC?=
 =?utf-8?B?ZnEyS1Q2d0U1U2ZNbWlreHBmc0lrK2VvcXAxcUtxcUc0MFhGT21sejhpUWRl?=
 =?utf-8?B?YkhzYlN2SWh1TlVlSjM0c2c0M21vQXovNy8yaXB2VThIMlRtOFVFSThBZWdm?=
 =?utf-8?B?VVlqL0pnTHVzRmR3QUpJZGVMMHNYWVFta0k5ZHByZ1pUczh2U2N3U0xrRDFY?=
 =?utf-8?B?UHpObVdkSVhjL281UEErNkFwd3dJT3hleWRsVFVZVDJ4MHc0RjVYNDBsQmZh?=
 =?utf-8?B?RHQrRlc5OU9QWENTV0VGT2ZtKzJEckVDaURoWkhmelNzcGl5TE5zdEdnc1JR?=
 =?utf-8?B?OXk3dG5uTmo2NHYwYVpjUmkzQUIwN1NtV0dEeXUzbHFaQjQvbzlLYTErZy9o?=
 =?utf-8?B?Skc3clpQS3l1REx5Zjl2bVVmRlZoeVZiVDFFQ3FSOUhOaVozeDgxR3RMR0Zy?=
 =?utf-8?B?bWZ6a2wrVU0rSUUwWjJmMDVVb0ZmUWZkQVEvRFQvVis0aUs2L25zNTFIUWc1?=
 =?utf-8?B?MC9Nenp5Tk04NkVCdjJjbUkwMUtSZU9NN3dqaCt1NDdyMUMvMVQwYmtrRUlD?=
 =?utf-8?B?ZEszNkt0MlZrWksyRWQwWDRVcUtZNmtUU0RoOFJYQnI4K0F0ZjhYem42Rkxs?=
 =?utf-8?B?Q0NVV2QvN2RsK28wNU83UVJjUkZJK3IxOXFZVjNkNWQ0ZjVlcDBwOExFMzIr?=
 =?utf-8?B?YkM3M3hjRnU0MHo5UmVIcVJaZUtmZlB2WHFHdmpQcU9lZmRmMzBzTUl5Y1do?=
 =?utf-8?B?TUFMZ1RYWlRyTVdIdkM5a1JiMDdqbE4raVVpZDJpWGZJYk9MN2Y4N3UxeUpH?=
 =?utf-8?B?VExyVUk1ZmFXMHA0ZmhhYnYvUDRwa094VW9NZkp3Uyt3ckhPM0JQK2xlUTky?=
 =?utf-8?B?dTE2b1BmN2MxdzVMdWVnWGxmd09GbExhbXFoaEFmTFRyK1dSRVo2ckFMc1pa?=
 =?utf-8?B?WjFDUkloNk5SaFBsSDI1MVJ0UmxmSGFKSjd1eUdwWjRtQXNpTVkwSmd5MFVi?=
 =?utf-8?B?VGNTUERrc1BVNFpUMmFRVzRmTmpKZEJsenJDQkx6RHorNWNOd0Znbi9VRzNt?=
 =?utf-8?B?ZzVqMzBkbWsrM0lQU01TZnlYZmdMbTF0Tkk4dUV2OE9JNjlxby9PbktOTDlm?=
 =?utf-8?B?YTVIM3RVaTVkKzZUcE9HdEtxU0lzMXhVL29QVjBBWExsdWVTTnJZa1VFb1R5?=
 =?utf-8?B?M1BuK2Y5ckVSY2dwaFZxVk1yZG9yYjcvbmJTeXVOQnFhMzRsd0VPQUwyMWJa?=
 =?utf-8?B?Sy8wejVpY05zYVAvZzdxTjBsbk9RWlg0NUFtVGM5dXE1ajhtZDlkUFNQU1pL?=
 =?utf-8?B?c1k2TjMzZ1hHcHlYWE12ampUTjdpTEtRbGdkMTU5ZURuUmxQY24rTE9XZ3U0?=
 =?utf-8?Q?ukIbGtNmzNtmyz9uKE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODlLb0k3MkpEdHc4TkpjL1hqa2ZaQWN4Y0JKeVVWNUZWR3d1Z2RHcDhJOXN0?=
 =?utf-8?B?K1FaVlhQTmRIdDlCWHVycHNBZjdIOUNPb1hFaUlGV2xyYmhld0FpdERteXFP?=
 =?utf-8?B?clVXQkh0MFl0NWsza1p1WExQUlVIMGJWWmIwRXdoWVFPZGI0ZXVoMGhwenJj?=
 =?utf-8?B?RkFTSEVGdVJEYlgySW1VZlJtdVJtWWk0eW8yZDlra09uWElBcWpkVGhadWJs?=
 =?utf-8?B?OVV1UmhMMGROUVBPZGZ1YTF5ZVFDY2Y0OUdJa2hsdGJtSis1bFQrbGpnT3o2?=
 =?utf-8?B?Ynl6eTBXbzNnN0dlUi9TT3pFM0M2czdvV280VnBJL3Vuck5ZTnBHZllEcUI0?=
 =?utf-8?B?dEN3eUVkR2cvVnhZSTB2N3YweEVEcFN6bnE5U1RRL1BaWjRHZEpKY3laeEpE?=
 =?utf-8?B?anZHdnhSSWFzRkNJYTZYbmFTWEFHclhIUGRYZU5qMEtzaExGaEl1aldwZjl2?=
 =?utf-8?B?QUxUTW9ELzZXM2ZlY2pQNzFwQWhBczFjN096d2RhcVVYWEg3bEpNTHRON1hR?=
 =?utf-8?B?MUR2ZHNSaGxyQk1mNVVnRU5LWUJzRisrZ3JwV1gwV3dwRnFHUjZsVk5kaktZ?=
 =?utf-8?B?K3g5dUhNQTNiVHZ0Uk1hZ1RSSW93SzZFM0tpdCtaaHFkQndFRXpjTjhGN1lH?=
 =?utf-8?B?ejNXTnBEWVhESVkvOUt4WHV6bzNoSUhNWjhSa1RJZjFpc0tZSXlLUDk3anVp?=
 =?utf-8?B?Vzk3YUwrM2QreWo1SUU2SFlBeDZmbzNmZVM2UFpjU1hldTF0SFpuL2pwMzlN?=
 =?utf-8?B?YzdZcm1QaGhPV1NkS29aNVE2UHd4OXcvUCtNam9hYkNqenZ2SElSMWdnZVA3?=
 =?utf-8?B?RUFrSkZuSEtGMHZTZnFiZlNTekt6NHVibHplWWwzM1hsZmltUGswTmN6UEtC?=
 =?utf-8?B?bkZ1dVZ1YWp5SjRvNnExSldFR0tzdENwMTEwSlo1WFlsOW9pamhBbXZMUmo3?=
 =?utf-8?B?Y3cyZ2l5Uk1jZXZnT3VMaUdpVjdIMnpsb1VuWlFHR0haN3VkSm5IRHlWeHdR?=
 =?utf-8?B?ZUt5QkNLZmhsdEl5ZlZqdTd1REtTaVhTeXA3STA3UUFCdFlFVUxQWGE5NVpZ?=
 =?utf-8?B?MUc1bU5hNmd6eEtRZkwzcStibkw3YzlrcURueWlRREREYmVhMTdIRng2RW1n?=
 =?utf-8?B?aTkxRGloQS9QdW94b0xWZ1lqTUdDR3lZSmc5MlRLQjRBRDUvaDRLaDgrc3I1?=
 =?utf-8?B?bEsvUUxXZkxTaDUwR3pneUExeGc5ZlcvVHRVWU9FM05hZW91aEZUVlltRWx2?=
 =?utf-8?B?NmYyQ3BwdU9sUWQ1ZHlVVWk2K1FZZGV5TkFKb3dsK1AxZEpESTdoLzZwSVJL?=
 =?utf-8?B?cTYwN2JQcjJKenM5Mm96bXJUNTM0R0tOVm1UblozNEp0MEZPVGR0VUZtVnZm?=
 =?utf-8?B?cUxGbGFwdkhBeGk5WXQ3enBlSzFiWGNyalMvVFJUSnhUdVJqZUYzUVh0Y3lo?=
 =?utf-8?B?WlRBTkg3NE9yZ1ZlOGkxWlFkcjB1ZGpVb1ByWmNwcy83enZRaXQ5UlBvQ3pB?=
 =?utf-8?B?cTh0VTRLV05teUc4WFdVQWJucUlNSnlpN2ZrMkJZZ3pXejREcklLd09mL2E4?=
 =?utf-8?B?ays1TDhIanFJTW9TYWJUQ1ZCellUTmRya0ZKRlhGRVhiSjRjUkpTeGc2bjBQ?=
 =?utf-8?B?MTcwOVV0L1dHNTRINTJ2aytpNU9nL1ZnQ0hkWGVQZStaZlY5WVZtdWJ6ZUlm?=
 =?utf-8?B?ZDZUWW5odzdndmJacXg3RFR2S3BHdDBzNld4b3Rjdlowd1Y0eEdlZnBJMExs?=
 =?utf-8?B?NWdXMEZaZjdQQjIwMW02eFJrQlB4VWJCdWVuajlmUjZJM1ZIVUdzU2Jwamk1?=
 =?utf-8?B?a091YWhWZFFNS3B2S200elZmMjdKMk9iaG5tYi9QS3oyOWZZQ0NrMW9wZlQ5?=
 =?utf-8?B?UGFRQVBscXU0M29FMjFjQkFzbmxKQ2NmcDY2VUIwM0NvSmxnK2l0U3JaeUwr?=
 =?utf-8?B?Wnh2RFRVMVFvanl2OXBkZTF2ZU9XUFF5V0wwcnVwVkxDZE1qZlp2NDkvNlhZ?=
 =?utf-8?B?TFMvMkc1VFlWMnJKS1hPRUNXMDZUZWowZW5mTWZ1Q1lkdzFHb1QybitVa1kx?=
 =?utf-8?B?R1hpMGVCUHNFMHQrVGtidkxjT0pwVDJQWEdGcDI3ZUpBZ2JnWnUySDkvcGRD?=
 =?utf-8?Q?6cBksRy5KoLBWN4Kvq8Xf8LRE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32973ca4-67b4-450c-9def-08dca027703f
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 14:57:22.8628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3mLKCFDhkAmKN8uPPjIk3DVU0xZor7+WRv+sA1gW4Rk2Iu/ZOPjb2zZK+I5UkV53VfQSL7N/IiIt+kD92G8SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6214
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



On 7/9/24 6:41 AM, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 30.06.24 01:18, Mikhail Gavrilov wrote:
>> On Sat, Jun 29, 2024 at 9:46 PM Rodrigo Siqueira Jordao
>> <Rodrigo.Siqueira@amd.com> wrote:
>>>
>>> I'm trying to reproduce this issue, but until now, I've been unable to
>>> reproduce it. I tried some different scenarios with the following
>>> components:
>>>
>>> 1. Displays: I tried with one and two displays
>>>    - 4k@120 - DP && 4k@60 - HDMI
>>>    - 4k@244 Oled - DP
>>> 2. GPU: 7900XTX
>>
>> The issue only reproduced with RDNA2 (6900XT)
>> RDNA3 (7900XTX) is not affected.
> 
> Hmmm, again this looks stalled -- and the regression report is 6 weeks
> old by now. :-/ Or was a solution found in between?

I'm okay with reverting the patch, but I want to see the requested data 
and tests first. I could not reproduce this issue on my side, and others 
did not see it either. I suspect this is something related to firmware 
or it is a display-specific issue, that's why the data/test that I 
requested would be useful.

Thanks
Siqueira

> 
> So I assume no solution will be ready in time for the 6.10 final? I also
> assume a "simple" temporary revert is not a option or bears big risks?
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
> #regzbot poke


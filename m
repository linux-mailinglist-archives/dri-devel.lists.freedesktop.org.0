Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E50AD2CC4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 06:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DEB10E465;
	Tue, 10 Jun 2025 04:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CSSyd1Un";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FD610E46D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 04:37:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9uApPtoV2mZjcav6qQUFnx9XtLCCmL3Iq6W6PjjeJ8Wp+WMWszAVn21pdZmFWdBlvrSfJ20LKYE2N+S72EAP/if0MUuJ2txSM+P0eKzNHdps0B8vCzOY/sP05i81ASBT6fGmtAgZjzxF82gRud2tdeWujJpThmCYyBCMObRyL6EKfgCFjPPNJq5jBQhhy276m1cAzzqCDLianGXQ72JCRoa11GGOBXIAlHXb1j3HBwe7d25sWCiMx6Zx6QI82x/pe06O7e/QGqM4WdCsKznct71g091Nx4WNrclHrjE4Vne8JFGqVDma3LfzUewFR1eGG4B1nXKocLHazwrqCAQHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXd5D6Tsf8p1hzV891eZu4k20IXtmNFfwkZMpMt8a04=;
 b=i2XlzXy346USNRG26pCvfoufFf0f6ybFChTWdZTQqcuGh68JIMeeR5btWDqxATz8Az03kp8Q5Q5SQRxCc8UYsobyLevN/c02ejJoqm/+wRo0jgnqMkZbAg4iq0Wy/E8Rq3HA0EmWSI7SE2EHY6Xyr+XSDL9NWY3G6dKYpuGDV8RjJaLCa5EqJuQozHp9aYRqKCOAoNr2v7BNn03RrTX718mZlSJErRjzweG1zkkYg0Vyv+Uoboh39OUV8gbpAgUDmFr3kIHJuPQyP9FgJWc3AHuvO2gPzOKk4QiRUn5JHTKQrzGs99N2heskaDjZZ468dblK3uP2mysmrs165WVvDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXd5D6Tsf8p1hzV891eZu4k20IXtmNFfwkZMpMt8a04=;
 b=CSSyd1UnmngNzDWtcVtk2Z547VvFjZCvvQ4hixrJIwYNStyOTZBYyzIBmYeHF7NB5vbinhhzcwIeHqas0aY2bw3SGQ5OKu0Cm4C51j57e1CG6g3tPvJGwzbMYJFnTxERRJQwdItz8W9MnZVrJqjt08jbzAmr5vUhB9+Ke/EPtEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by IA0PR12MB7602.namprd12.prod.outlook.com (2603:10b6:208:43a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Tue, 10 Jun
 2025 04:37:14 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f%5]) with mapi id 15.20.8792.038; Tue, 10 Jun 2025
 04:37:14 +0000
Message-ID: <bbf47c33-5a34-4550-9af0-3b0a7df05afe@amd.com>
Date: Tue, 10 Jun 2025 14:37:05 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <371ab632-d167-4720-8f0d-57be1e3fee84@amd.com>
 <4b6dc759-86fd-47a7-a206-66b25a0ccc6d@amd.com>
 <c10bf9c2-e073-479d-ad1c-6796c592d333@amd.com>
 <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
 <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050> <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <aCQL+/HDYcxfWM4F@yilunxu-OptiPlex-7050>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <aCQL+/HDYcxfWM4F@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY5PR01CA0001.ausprd01.prod.outlook.com
 (2603:10c6:10:1fa::14) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|IA0PR12MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb1bc09-9d30-4eda-703e-08dda7d8790a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXpXL0tHWlg1bXRCSlZlQkVnWmlFa0JqblhXcjQ5U0MreHlFM1M0K2FJUTAr?=
 =?utf-8?B?MHh0Tktad3hzRTVWTjFERjdzUlNYS3hLaytNZnd2QjZmM0k3R1NneC9hU2RG?=
 =?utf-8?B?dkhpa1ZHN1R3ZEpGZGx5NUZBdDl1V296dUl3eXN0bW5DcjF4TWp0TUwyd1lB?=
 =?utf-8?B?Tk1GK084ZCttMHJtTWRqZ04ya0dsUlNxWjZPaDVrRFN3Qm9qZjhMTDRPcWZI?=
 =?utf-8?B?YitaNTNyOHcwSHlhS1N3VUdhZURUdzVGQXdmVDBvWTF3Njh5US94QTVJa05a?=
 =?utf-8?B?WHRDSGJvaGlJWDVFczZtbEdjZm4wdlBYbEo3UkQ0aWlJSzFGVG5TQk5HVEZy?=
 =?utf-8?B?OUxnTldITU5ocGFPZTNpd1ZOOHQyWHhaelVoa3pGeDE1OE42N2Q5TWtJUXJK?=
 =?utf-8?B?K2dUT2d5blM1NDRGcUd5cnYyNnhNWStubEU1UEd1ek44Y1Rad1h2aldzeWpa?=
 =?utf-8?B?a01wRjZJVGdJZE4zSkQ3SWVJc1d6YjBVczB4NzBtZUNCL290Ky9WYTRYY1BB?=
 =?utf-8?B?RXBWeWtkbWtMMzdqZTJsYzFSeFllY2s5UEd6d0UyRFFCTXBLU2Q0Z3RzSjVJ?=
 =?utf-8?B?R0IyYzJTTE9JbjdoeXpaK2JyWWJ4R2RVbHA4cWZiSVNjWFF5eHRRekIzV1M0?=
 =?utf-8?B?ZEhNOG50MUpKbHNPNzVQZmZyNkhmMzhkNm41SkZIdTRHUXU5RW1hTU8rbEZB?=
 =?utf-8?B?Z1gvSVNqRlN2c3JBZHR1QVUrWGVMdFJ6Ty9qQ1VRWkdyTHhud1hLd2prazJH?=
 =?utf-8?B?UjhESUVSVXJRRG1ET3RRWHhDdnFPMnBKY0RxY3hmc3pzM2xpV1pKb3d1VHlE?=
 =?utf-8?B?OEdSTndDaHRDSUZ1bDgvdVBZWWM0SVBmZ3ZJcDBJS1F1ay9aSVNMaG9RMThL?=
 =?utf-8?B?OHU2SHVCUTNVZzVkWFBCYWtnZy82aStGaUZQbjJ5UHdEejFSV0NPeUFUZ21n?=
 =?utf-8?B?L0JFZXFxWEFhdjVkdVNhazg1cFlQdHNleHRkTzIyM0xWL1BiNUNFdHFjOVdY?=
 =?utf-8?B?SGtuejlEOVFGTHVSdE9PN2ZzS1BuOEhSTnFnS2lZbnJLa1RINUlIOWN3U29Z?=
 =?utf-8?B?YWhPNCtuaFFORXJPajlWYUtnWkZuTFcrd3habTRNU3pGbXduVmlpVjdmSVQw?=
 =?utf-8?B?UE5OV25GMUoxU2xlek80cDB4bFpVTDNlYUF0VTBsbDJxNlhEQnNEVnJRSkVt?=
 =?utf-8?B?Q2hqSWloYlkzMk94NCt1WjhIU3dLM3RjNlRmNUZYajZDNnhSWFZiS0dTNUVa?=
 =?utf-8?B?SmVWalkvYklUWDdaZzZrc2Y5QjJtOUFqR0Rwbk8rYUtNWVFVa0JpdVJpbk92?=
 =?utf-8?B?bHBIQlhHdXF1bGpMU2ZnbStYblZpNzVYQjlYZGFqZ2xTbkh3Z04xaStnU1Ro?=
 =?utf-8?B?bkdjMmN3Sk9EdVVWQWkzeEFlM2REY0ZXejE1MGhmenE3ZjNGUnAyMTBuWVZH?=
 =?utf-8?B?MWV4SlB0a1A2LzRTOFhMZG1YY2x2MTMxMW9KWEV5RFcvQ0pydmozLzJhN2h0?=
 =?utf-8?B?NTZ0ZHlKck5naE5Sc3MrSUhDbWxxL1YvNVBIclphclBwd3pwd3ZESTQyRHBG?=
 =?utf-8?B?RTFlUzZTN05zaVk0RkNwRDc1SjIyZVNNVlBkZkVMaWdwU0ZsZkptVkt2R1Jp?=
 =?utf-8?B?MEVmbndlVGRTU3V4V0dEVzZMWFh2eTBocFpuRkw1akVjY2hDaTZmd012Lytk?=
 =?utf-8?B?YkdFSEVPVEFXZGZwbXFmRTFlS3JGRG0rR0YvOXpDcU5Vd0VseitCb1VvbWRv?=
 =?utf-8?B?Z2wzc0tIUVl4RU9QdUMyaUc2UTZvYVRsYjdVK1BuU2R2MlU1UjJmakwrQU5Q?=
 =?utf-8?B?SDJRZmJZQWY0Y0UxeTUxZnRzR1M5MGM2MVpKRE0wSGVKTVNNSElubTFPMHdn?=
 =?utf-8?B?cW1rdWhrWVZkVUM1R3ZnaFBDeVdzN2RieVVFaXkxRUpDTENqNlpBU1M5R0h0?=
 =?utf-8?Q?mJxMSKLQa2c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1dFd1hwQk4raGMxWUsyTURYUVRCVENScGVGNUkycytCTG9adkxrODZ5MnJC?=
 =?utf-8?B?M2FrQUtSRFNlVVMvNEk0ejFiQU02aHI4ZUFSS0g2a1g5MEw1eURub3FoVmhr?=
 =?utf-8?B?bUVrc1MwOXNTNFZRa254b0hCb3FSZVpncG5qaVpzeVAwandITEhjSzR4ajhM?=
 =?utf-8?B?TWdZb00xN21ENkx5QnVLRlloNy9XZUx5ZGY2UC9NU1g3QW95d0RFdTZYZ2ZB?=
 =?utf-8?B?M0lGbjkxUUorWWpTSy94ckZkMDVhZzNFQVRMT1FNZEVSMksvODJ5YS9oQWhL?=
 =?utf-8?B?elBZbXJEa2dSS3ZYT3hMMm5yZkJzVW92MVB4Vm14ZVRQbHVIanUreFczRzVt?=
 =?utf-8?B?YnM0YU9DTm1ybnNzTjl2dUR0REFGNitKL3AxSW9Ma3ZEQ3F5UzduNkFuc0Z2?=
 =?utf-8?B?SjFHbk1HYzByV3VtcTBORGVhM1VpNWNYZk5IVGM5ZlB6bDdHSzJlTWxkK1Az?=
 =?utf-8?B?dmVBd1F0dFg2dWxTYmUvNG85b3ZyekQ3MG45VXhIeFNVTk5oK1VIWU5YWWxU?=
 =?utf-8?B?ZDhJWTh2TUlTSjdabEl5emhVZ1JBV1dtcDMxa0hmaWFCemdOTVN6QXdxekVt?=
 =?utf-8?B?YUttZlNzS2x1dEIvWDdhU3BzWHFUWlF0VFFsK2FnbnZRWkRWb0JoVFRUdVZU?=
 =?utf-8?B?V3U5VHdLU0hFSnVNNDVPaytHYkZwVUR3NVdsZGRsTUY5d3JzOUpjRUxCdVd4?=
 =?utf-8?B?T0lXL2lGNFpuWVdnL0xhd0tXR0RBenFYVGhWNkFzT3k4MmRuMmtrRmlkUHQ0?=
 =?utf-8?B?T1ZqZDVvUnJiSXJ3V0tscHdxTXpoUnFIaHJNWisvUmJsTS9DVGo1VWJKaHlJ?=
 =?utf-8?B?SmZIK2EySW04b2JkVHlWa2dXSXc1MnhodytnZUFPQkM3bmJONy94UGRjdWc0?=
 =?utf-8?B?YnRoTzFoN1JtYWM0Nk5qQ2pHSS9Ta1VkL1krTEVNd0dMcXNXOHBqOHpNRkc2?=
 =?utf-8?B?MHAycUZKY2swTVdnYUJUa1JQbzkyL1NwUW9kb3BzZFZWQk9SWlM3L3M3aEFM?=
 =?utf-8?B?Ykd3NS8wMEtGMVR3ZGJJSWNrclZLSFl4R1Q1cndiNHk3NVdtVkwxQzRFU3Bp?=
 =?utf-8?B?WURKMkREdHJGTCs2dGJuWVN1SmQzRk1wUU5oTjdhWGV6bDJoaHZRc2p2T3Ir?=
 =?utf-8?B?d0hUdk91UFlYWjFqMEJSRFhYejczNEJmYXB3SnFlVEIrOHp5RU16MXZFRC9l?=
 =?utf-8?B?N01MRXhKWGx4ZVkzdjJObS9RNzRMQUJKZ0Vhc1Y2WUhRTExpRktBNFN2YmxU?=
 =?utf-8?B?dEx0bk1TN2JaVFJUY3lQMFBSNmpreU9YYnByU2ZYdHMydHZUNENHQmhwRE1R?=
 =?utf-8?B?cEpnQUlYOExlcTZvWDBibGNBWG9ER21vWlFyWERtRFdyb0hGWmtacFphczhz?=
 =?utf-8?B?SnRjc1l5OFhZaFpMY3ZvbzZtVlI1VjdYelg1N3Bxbkl4R0hRNGphNWMzTFVz?=
 =?utf-8?B?dFExUjlRZ2JmeWkvV0VaeFozVkFWTUdaeDFXWkM0VVd6VTlmS0ZmLzVFVjF5?=
 =?utf-8?B?OTJXSkFQb1ZxTWp4TlFtNHRFMmNFNzNrV0IwdFpMcjVCempmZTdMSEVMdE02?=
 =?utf-8?B?bkhLS3JEYWhSNzVRcGhHMzJodnFneVREb05MSTBpQmxScTBNcXRRd1JQZTJv?=
 =?utf-8?B?RCt1QXVoYmtMMi9UUlRjbXhFeC8wUzJEQkpQa1ZKRTZqTmtCc2JUUjBwMkhN?=
 =?utf-8?B?TStKLytLZ0srbTJ1dERsZ21oaFowbTRKeUp0aWVKYjByRlhpSEZ3QlhsRGlX?=
 =?utf-8?B?N3I3NE1naUQxTm5SamNaSjhBWGNaQ0dsb3NBek1mQlQ1aE9BTm9randnSVRq?=
 =?utf-8?B?aWtHTVljdHhXZnVjMU9IWDRlVXEwV1VoVHFNblRTRjR3QnFRbTFLdE85MUNk?=
 =?utf-8?B?ZktLWVlUYms3cC9UU1Y4VlIwa1JCTVE4NnZWSnVFYys5SldQQm1iV2cyY3pS?=
 =?utf-8?B?V3JFZ0o1YSs5bVRGSDN5R3UzQWk3N0VNZGpGUThpZWordGt3YWFMM3U1SzdF?=
 =?utf-8?B?dms1NkhhVXVpY0I2UGlvTXFqVmZXVmVZMS82OFhkajdZS3VUNXJ5Yk8wRDho?=
 =?utf-8?B?cm1kd0Y3Q1NKL0ZuWW1wa0E4QW5zbnFyQ2dFRzNRVVlmRUd3KzgxUWR6bjlP?=
 =?utf-8?Q?cu+cnGTnPJEmvzmQoNDCoVAVO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb1bc09-9d30-4eda-703e-08dda7d8790a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:37:14.5708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yr4KWI9D0NntkGuJkK0ZPdt1Tt8Uv5viQJCOlR5OWdG6+v0mCLec2N4zsdnDJqtiGWQQIMozw5X7S7zHbIo4rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7602
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



On 14/5/25 13:20, Xu Yilun wrote:
> On Mon, May 12, 2025 at 07:30:21PM +1000, Alexey Kardashevskiy wrote:
>>
>>
>> On 10/5/25 13:47, Xu Yilun wrote:
>>> On Fri, May 09, 2025 at 03:43:18PM -0300, Jason Gunthorpe wrote:
>>>> On Sat, May 10, 2025 at 12:28:48AM +0800, Xu Yilun wrote:
>>>>> On Fri, May 09, 2025 at 07:12:46PM +0800, Xu Yilun wrote:
>>>>>> On Fri, May 09, 2025 at 01:04:58PM +1000, Alexey Kardashevskiy wrote:
>>>>>>> Ping?
>>>>>>
>>>>>> Sorry for late reply from vacation.
>>>>>>
>>>>>>> Also, since there is pushback on 01/12 "dma-buf: Introduce dma_buf_get_pfn_unlocked() kAPI", what is the plan now? Thanks,
>>>>>>
>>>>>> As disscussed in the thread, this kAPI is not well considered but IIUC
>>>>>> the concept of "importer mapping" is still valid. We need more
>>>>>> investigation about all the needs - P2P, CC memory, private bus
>>>>>> channel, and work out a formal API.
>>>>>>
>>>>>> However in last few months I'm focusing on high level TIO flow - TSM
>>>>>> framework, IOMMUFD based bind/unbind, so no much progress here and is
>>>>>> still using this temporary kAPI. But as long as "importer mapping" is
>>>>>> alive, the dmabuf fd for KVM is still valid and we could enable TIO
>>>>>> based on that.
>>>>>
>>>>> Oh I forgot to mention I moved the dmabuf creation from VFIO to IOMMUFD
>>>>> recently, the IOCTL is against iommufd_device.
>>>>
>>>> I'm surprised by this.. iommufd shouldn't be doing PCI stuff, it is
>>>> just about managing the translation control of the device.
>>>
>>> I have a little difficulty to understand. Is TSM bind PCI stuff? To me
>>> it is. Host sends PCI TDISP messages via PCI DOE to put the device in
>>> TDISP LOCKED state, so that device behaves differently from before. Then
>>> why put it in IOMMUFD?
>>
>>
>> "TSM bind" sets up the CPU side of it, it binds a VM to a piece of IOMMU on the host CPU.
> 
> I didn't fully get your idea, are you defending for "TSM bind is NOT PCI
> stuff"? To me it is not true.

It is more IOMMU stuff than PCI and for the PCI part VFIO has nothing to add to this.
> TSM bind also sets up the device side. From your patch, it calls
> tsm_tdi_bind(), which in turn calls spdm_forward(), I assume it is doing
> TDISP LOCK. And TDISP LOCK changes device a lot.
DMA runs, MMIO works, what is that "lot"? Config space access works a bit different but it traps into QEMU anyway and QEMU already knows about all this binding business and can act accordingly.

>> The device does not know about the VM, it just enables/disables encryption by a request from the CPU (those start/stop interface commands).
>> And IOMMUFD won't be doing DOE, the platform driver (such as AMD CCP) will. Nothing to do for VFIO here.
> 
> IOMMUFD calls tsm_tdi_bind(), which is an interface doing PCI stuff.

Only forwards messages, no state change in page tables or anywhere in the host kernel really. Thanks,

ps. hard to follow a million of (sub)threads but I am trying, sorry for the delays :)

> 
> Thanks,
> Yilun
> 
>>
>> We probably should notify VFIO about the state transition but I do not know VFIO would want to do in response.
>>
>>

-- 
Alexey


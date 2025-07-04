Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E70AF884E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 08:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A9910E930;
	Fri,  4 Jul 2025 06:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0KR5iYku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E8D10E021;
 Fri,  4 Jul 2025 06:52:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=naIcErsZstQbMEFkE9V0+FtLgknEmm56SmD/jZgHwSGxQ/OCz5/ymzs9MGpJulS9Kl605GSMi26Fa52vM4slS3zTMmc4fEaKTpBsjL8Jh7sSW2DXWbYp9iTYGFsNk5sKXgZXPMbpeoTZBcTUH5My3lYyL00qof1AtBWpLdn6zdOTElRggTrbZUja+MKJF2FQQqfViBsA65dnoVwgAQwP1rktpAjWt3c/MtthffPbAZqibREz5ewYpNZyWPGVmIEp6yBBhX9qXTq7mlsoOKDjV4pXwerULOmHYT5/JehljqNBQjH6LJICB5i8DEaamPrhzOqxOfkRizsbrxDm7XQ9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXzpmGf//4tq4yH0BMCn1PaS5r2Jg98hT8saVt85JhY=;
 b=FL8qI7+2IIEvyqluNalppogRaqR/EZY/TMkYOUBjsSYaog5SGRVdMFuHrQU3qpd2krFEScysOOr93o9XL8/itHWBMqY5RCBPe9y8wMaFlu/gn/vtDgR5RJcsF2qz5ExhEL85L/MyEswszi7RE+c46jPKRAvg9oE+WiEv/c3kz/81BHNdyZxEe/bvj0eAtVLLZ39+X7+ia4FINJzV6MUhmiAl8iECarMy5Y78gpzfD/I1Ir2x9vEEp+JtbPQWdgrtwWdZEDHvDzr0jzAwYJpfwz85uB1U3zfcIWYaAUEkA0884M4cq4o2CQLcSEIWsfXO7uBIdM6eFlaNDtIWIiDX0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXzpmGf//4tq4yH0BMCn1PaS5r2Jg98hT8saVt85JhY=;
 b=0KR5iYku2ucaRMnORBulEgVrQiljjbH711CFh8wGI8xCL/BwktCY0axROPOkNIGHpb5PxjcY/XCb4NAP+bz4foCcSZX/nP3OfmSPMoksTz78qj13ZAbhIPinGU64fjuIiOPEkie0SEwI2quOg1XaDpLNQFiJ/YShBhc/5ZLFg8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by SJ0PR12MB7083.namprd12.prod.outlook.com (2603:10b6:a03:4ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 06:52:35 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::81e6:908a:a59b:87e2]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::81e6:908a:a59b:87e2%6]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 06:52:35 +0000
Message-ID: <3ffcf77d-abf2-4c2a-8a0f-f1128fff5de5@amd.com>
Date: Fri, 4 Jul 2025 12:22:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] drm/amdgpu: add debugfs support for VM pagetable
 per client
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org,
 linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20250701164948.8105-1-sunil.khatri@amd.com>
 <20250701164948.8105-4-sunil.khatri@amd.com>
 <586cff2c-bf69-4202-8ca5-67a3f30d80ec@amd.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <586cff2c-bf69-4202-8ca5-67a3f30d80ec@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0247.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::14) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|SJ0PR12MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ccddcbd-8691-4535-5329-08ddbac75b63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1B0dGhWeGdDVmQ5YUdDUHVFMlJ1dW1CZzdjVzlwS0VZNU53azR5SWtZNUxZ?=
 =?utf-8?B?TkFTL1FpNjhtRENQK3QyUFBZc05IaC9EMVBvd0lTbG1zSTlDUDA2Wm1jSGV5?=
 =?utf-8?B?WUwxMmxzcXNxZ0ZkeCtoTWlXWDRkZHAwWXRSMWtwQnh3aWIzbHZ0QldXK3RU?=
 =?utf-8?B?NXoxWnBUMmp6d3hFT3gwRkQ4dXFNUm9pbVQ1eHI0OUZWQ3RzT0NOTEtDaitK?=
 =?utf-8?B?VFUyNnl6T3pMSnhQTHNrRHlpNGE3aXhoei96YjVqNFVGUTI1bFZDWlI2ZE5m?=
 =?utf-8?B?MmtiTFNBU3NsQ2NWVHE4UHM0NEZCT3lZaHVxRmhOY005N0g5encvbDVGWFhq?=
 =?utf-8?B?QTNxbUtSNU5FRSt5Sk9IazNTb1NFRUh4ekVLTkZWbmJvTUQ4Z2pOaEJBL1hz?=
 =?utf-8?B?VWl5UVREV1RNMkx3R1VXUEk0S2xFRVU3bDhFYlVkS1d5eHk0cGhOZkdmcTFq?=
 =?utf-8?B?c0JQelRDVG00ZnIxNUYxRTNxT0VON0NPak13SzVIUWRHSkdvRG5HWXQzaWxK?=
 =?utf-8?B?ajlMQVJTVkdzaVVzQVBjNDZoMTdnQzVVQUtwelFvTGJKOEs2Q1ljRk5Yc3Zj?=
 =?utf-8?B?ck9QeUdDd0NpeU0raWdlREV6TWlSMm9LUjh3dklySGN6VVc4b3VLWVNpZ1lU?=
 =?utf-8?B?RjV1OWY3bGJKUjNKSHpCL3FvVm5PWThXNVFyaVY2UVNoNC9CZWNCZUVSaFV0?=
 =?utf-8?B?bktZcVhNS1BWbnlJaEQ5Qk96NFRzdWJNbUFKSk4zTDArMGk4dGlEb0cyZjJ5?=
 =?utf-8?B?dXhCbDI2TXg1OXBmWGNrdjBBeWg5OXZ0U0JnVGRLS0ZQMktXQVd5ZUJmMHE1?=
 =?utf-8?B?ZW1tUy9ELzVLWmU5UHNoKzIxQTFvakQwQjRFOUlzWXh0WW40dEJRRmpqWXZp?=
 =?utf-8?B?aWoyUmpKRGEzUnQ2NkNoKzJHS0lvUTNKZlVvUWZ0UGtLNjlJb3lDZ3cxdnpu?=
 =?utf-8?B?NlczZlM0NU9mQkUvdEZkdC9iakZlLzI2aU1jL2dzTVhaNFpZNnMxSVJpRUxH?=
 =?utf-8?B?ckFDNzB4ZGgvTlh1b1JNU1RjNStQZXo1Tzc2eFRtVUFuNDRva3VqYUlRU1Vs?=
 =?utf-8?B?S2thTE1iRGkyOUZhdEFhRmE1MTdGK0JRdWEwZkYrOGpYbFkybFpZcDRMRlh6?=
 =?utf-8?B?bHFvdkwxRk5hZmNrTVk2QmlrdksrVWZ3QkZOeDVRb3FDRGZFYnJaSWswMTg3?=
 =?utf-8?B?SGtucGFEcEl1OWhrRUZYNHBWWTRSajVNOEhQQ1hpMG5kU3dCYzAwaDU5WHEr?=
 =?utf-8?B?NkxUdnFPQ01DcFpiODFnRXZyNmVJZU5PVDk3TGVpRE1HMEM2RmRTL1BwMmJJ?=
 =?utf-8?B?aUNsYjJSVHZGUncrZUdNdnNvQkxiaXF0eTdiY0JuUU0yTEdKRlhjUEZQTTRy?=
 =?utf-8?B?OEZGeHBEb1VMY0FSb1YxbXVnOWI1VUt0bjErOHBwL1FGWkV0ZXFMa0NZQnBH?=
 =?utf-8?B?TW1tNGxFV3N5OGx0Qmhpc2ZTWU9CbzlNZ1g3RmFkdklzd2JaQWZqdlBKdkVQ?=
 =?utf-8?B?OGthZHZrN1ZqeG1idGtVNXk1Wkx5OFd6TjVzcHEzbkJQaGkvR2xhOTl3eGtt?=
 =?utf-8?B?ZEFpWjRhOCtvaUlVNlpwMjJxczBZUmluR1JFL0g3L2FhalBQUG1yZ3JTL0J5?=
 =?utf-8?B?eHc5V3Rxbk5XRUo2VWRuL2trd3JWWGt0RjM2anZYY2F0RUkrcEV4eGdqRTIr?=
 =?utf-8?B?Q3dmU3ZtMWw2MjBMYTJOVENJTnRBSG1SV0lmVk5hRFFpTzVNZ3FuWmlUMjda?=
 =?utf-8?B?ZVRscEdrNjNIOUh5bGpQL3dERHJsY3FZUTBwTGw2TVpHbjJid0FYcG5mMmVq?=
 =?utf-8?B?NUdXTitYYzhLbXZJWFE5UDE2VUhxZDczK3pVdEMzdXBzcmxXaU56TlhPQ2pt?=
 =?utf-8?B?R3k5RHA3KzhvKzJTYk9JRmdKUGZPUk5VTzNqUVQ2MjhiZnJNSE5VODRXMlJ2?=
 =?utf-8?Q?YlygXinEyKM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djlsemdEbFhmSmhxRE9FTktrdWlnYkVmbUdTa1RvWThvZHc4SjA4eXdUWEVx?=
 =?utf-8?B?eG9wZlRNaWl2NlNVNlhpYWZXcWVEUmpwMDVNOFBNQzVuL1Vnc1RxdHpPTU9w?=
 =?utf-8?B?dm02ZUdXVkp0YXdUSWR0K29MVzFrekpSZ055SXU3Zm5JQzlYSnVERjFmL1h6?=
 =?utf-8?B?ckh4Mm84R0FVSGlXRy9FOEl3SUdpQ0xSWFZXM1oyU0o1VFl3aHpNWjhkNTJ2?=
 =?utf-8?B?RUtHdytMdWxVcGZKa0pPdzMrelkxVU5aNnZocG5XUXBQZGNUNWo4SXJNR0hq?=
 =?utf-8?B?L2ZxNGtVL09kMUF3ZXBTTUgrRWl2RlZpSkxOTFRzZHlZNUxENEM4NGR5VTNQ?=
 =?utf-8?B?YTEzMkVkaXZpdGREejM5cmowT0VNckRpRzhDTzhCbVNvdEpjbjJpTUFicmFL?=
 =?utf-8?B?TVhNK3JCQWRFY1hSRVNiMGpUaUlySjAzcjBMeXE5U01BRUlIZTFBVkxhYitQ?=
 =?utf-8?B?WW9nNGhJMHd1RzhhakZzdmpQSmRrNnhjOW1pNjg2VDhPQzROM1hjTWUyVlBS?=
 =?utf-8?B?aWhOdERZc0ZBNll0RjNCTUJwOTJ6MHcwYzhseUdXOUNOMHpFMGQ2aDdmZjdR?=
 =?utf-8?B?ZGVzMmhlWTZwdnZnQTF5QTlCV1h2SkZVTVkyajlidElXbXJIM29yS0N6dFNW?=
 =?utf-8?B?aExQaWcvWmljbWtZMjNQZEo3bmRMY09GSzB6Vlk4ZHdjME4xR1I0Vm5EcHg3?=
 =?utf-8?B?V3gwS1UwenBkQ25qNjhDTVZtcjh2OXhvcjNEVjAzWURUdm9lVmdJaVVxQzZz?=
 =?utf-8?B?VTRJbFo2b0ZFNGRLV29pKzdTcXh6YktNeGZoekJnR1dub1U0dy93b0k5bVkz?=
 =?utf-8?B?ZFFDNnkrek05TkZ2SkNQTDNsUi9MY3dMUis1ejVCWHVUODZiWC9BWXQyRG1z?=
 =?utf-8?B?MTd1Z3F0alIza1FHRVM1MGJ6VGZkWFMvM2RvNzJkYktaZlVoK016emJOYlJm?=
 =?utf-8?B?djNqTlNaaEg3ZWYwODVIK0JJUVlBNUo2REY1eDdHVVdrWXV4M1VuaDJ4SE5V?=
 =?utf-8?B?MVoyck9Eck9EajlRZ2thdGQzNkU2VFMxNGVyN1E0eEZYU1dWQXZLd0dHcUxo?=
 =?utf-8?B?VWJjVkFhbmJEcksxZXBPSElncGgvL0tjYU1ZSUJCaVNKb1JhRTR4UXBNOWlv?=
 =?utf-8?B?eDdlUGI0dGxwaUwxMXFsSXBwSGxiTy9QTGwyL3lNa1NLdWVqKzJvRlU5RUhL?=
 =?utf-8?B?ZEpxb29adUtncmFnaDZKOTg2UXRHZ3ZQNUtHTFVJZGI1c0laMmk4WStrdlY2?=
 =?utf-8?B?S0V2QWg4Zys3dkVEaVFGbjN0RVBOVFRzQkJhTGV0WVZRb3A5WWtmZVJubHB1?=
 =?utf-8?B?SUo3emMrSEh1Q1E2M1lSQ1h4THA5N3F6UzZBTFF3Vnl4NkJic2l1V2NDV2F6?=
 =?utf-8?B?K2ZQYXZQUWJwdnM2cm91V3hRRnkrcy9tOXdvWjJDbm9GSVpwYW1aRHgxak9h?=
 =?utf-8?B?K3VkcHRPVUVFUE1DeWpFL2FVV1ErelJCUDFUQTZDQng2VXFPRnJzN2tTQlJa?=
 =?utf-8?B?amc5M0NMeUFmeFlQZHY3Q0V6LzJuOUo2eVlNVzZSbThhbm9NaGgyUW9IeUVC?=
 =?utf-8?B?UHpoQ0lXQTBKQ3EvdERrck41K3hYc1FXVmEwcGx2RnZWVXZVYithRmc4Rmhs?=
 =?utf-8?B?TjAxblZwVmxjbjJESzYxWkNKNzRDWWl1bmJFOGlkcUtpMnprNWRKUjdwSnpW?=
 =?utf-8?B?QjhmZzV2eG5FdkdEbjU5eTlTTllobWdlek5RaHk4QnFtd1J2eVhCMEVvVVNW?=
 =?utf-8?B?RlJCdG5XRGpYdHowTWE2ajl1ZFA4b2VMbGRzSGdtQzIyU0RvYlNxeGxLQXBa?=
 =?utf-8?B?cHkwYmhWOHZ3WC92VEVGa1BiQ3czcjdHMWdVTWc2Wk85emxLc3Q3Z1JJaHlU?=
 =?utf-8?B?dWtUcmsyVWtrZ2tzQ09lOHZhbnJVTjJsUWhVRW5sd1NmemJqMXhUa3lRazV5?=
 =?utf-8?B?ZmZlcjQ3SDlhdVJsWXdLejJEM3IwQ3daUUFORndxVGxXNUgxN3lSQ2p6Y2dx?=
 =?utf-8?B?OGJDejA3RmVpZTllVHdwQmtnN1dnVklHSlhJNjNpR0VXSll4Nmc0RU1WTldE?=
 =?utf-8?B?V3U4TnpSdHdaQlhrVDB2c1BzNDlRQWNoNVkwV05mTk55WG1odnpqVjlxcnYy?=
 =?utf-8?Q?uMj9xc9acJ3wOorN3TL1aJZch?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ccddcbd-8691-4535-5329-08ddbac75b63
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 06:52:35.4598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UgNyid07Le8uG+rAavBkljKi33dq0ajBS6/yDIELZy+NQJbJGE8U0H1JbeWo+FzZSaQWtAjTbc4S8LIApOpTcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7083
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


On 7/3/2025 1:30 PM, Christian König wrote:
> On 01.07.25 18:49, Sunil Khatri wrote:
>> Add a debugfs file under the client directory which shares
>> the root page table base address of the VM.
>>
>> This address could be used to dump the pagetable for debug
>> memory issues.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 52 +++++++++++++++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h |  1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  4 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  4 +-
>>   5 files changed, 60 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>> index f81608330a3d..6762dd11f00c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>> @@ -2131,6 +2131,55 @@ int amdgpu_debugfs_init(struct amdgpu_device *adev)
>>   	return 0;
>>   }
>>   
>> +static int amdgpu_pt_info_read(struct seq_file *m, void *unused)
>> +{
>> +	struct drm_file *file;
>> +	struct amdgpu_fpriv *fpriv;
>> +	struct amdgpu_bo *root_bo;
>> +	int r;
>> +
>> +	file = m->private;
>> +	if (!file)
>> +		return -EINVAL;
>> +
>> +	fpriv = file->driver_priv;
>> +	if (!fpriv && !fpriv->vm.root.bo)
>> +		return -ENODEV;
>> +
>> +	root_bo = amdgpu_bo_ref(fpriv->vm.root.bo);
>> +	r = amdgpu_bo_reserve(root_bo, true);
>> +	if (r) {
>> +		amdgpu_bo_unref(&root_bo);
>> +		return -EINVAL;
>> +	}
>> +
>> +	seq_printf(m, "gpu_address: 0x%llx\n", amdgpu_bo_gpu_offset(fpriv->vm.root.bo));
>> +
>> +	amdgpu_bo_unreserve(root_bo);
>> +	amdgpu_bo_unref(&root_bo);
>> +
>> +	return 0;
>> +}
>> +
>> +static int amdgpu_pt_info_open(struct inode *inode, struct file *file)
>> +{
>> +	return single_open(file, amdgpu_pt_info_read, inode->i_private);
>> +}
>> +
>> +static const struct file_operations amdgpu_pt_info_fops = {
>> +	.owner = THIS_MODULE,
>> +	.open = amdgpu_pt_info_open,
>> +	.read = seq_read,
>> +	.llseek = seq_lseek,
>> +	.release = single_release,
>> +};
>> +
>> +void amdgpu_debugfs_vm_init(struct drm_file *file)
>> +{
>> +	debugfs_create_file("vm_pagetable_info", 0444, file->debugfs_client, file,
>> +			    &amdgpu_pt_info_fops);
>> +}
>> +
>>   #else
>>   int amdgpu_debugfs_init(struct amdgpu_device *adev)
>>   {
>> @@ -2140,4 +2189,7 @@ int amdgpu_debugfs_regs_init(struct amdgpu_device *adev)
>>   {
>>   	return 0;
>>   }
>> +void amdgpu_debugfs_vm_init(struct drm_file *file)
>> +{
>> +}
>>   #endif
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h
>> index 0425432d8659..e7b3c38e5186 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h
>> @@ -33,4 +33,5 @@ void amdgpu_debugfs_fence_init(struct amdgpu_device *adev);
>>   void amdgpu_debugfs_firmware_init(struct amdgpu_device *adev);
>>   void amdgpu_debugfs_gem_init(struct amdgpu_device *adev);
>>   void amdgpu_debugfs_mes_event_log_init(struct amdgpu_device *adev);
>> +void amdgpu_debugfs_vm_init(struct drm_file *file);
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> index 4aab5e394ce2..d3f16a966c70 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> @@ -1415,7 +1415,7 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>>   	if (r)
>>   		goto error_pasid;
>>   
>> -	r = amdgpu_vm_init(adev, &fpriv->vm, fpriv->xcp_id);
>> +	r = amdgpu_vm_init(adev, &fpriv->vm, fpriv->xcp_id, file_priv);
>>   	if (r)
>>   		goto error_pasid;
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> index f042372d9f2e..7e31fb5f6f33 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> @@ -2527,6 +2527,7 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>>    * @adev: amdgpu_device pointer
>>    * @vm: requested vm
>>    * @xcp_id: GPU partition selection id
>> + * @file: drm_file
>>    *
>>    * Init @vm fields.
>>    *
>> @@ -2534,7 +2535,7 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>>    * 0 for success, error for failure.
>>    */
>>   int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>> -		   int32_t xcp_id)
>> +		   int32_t xcp_id, struct drm_file *file)
>>   {
>>   	struct amdgpu_bo *root_bo;
>>   	struct amdgpu_bo_vm *root;
>> @@ -2610,6 +2611,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>   	if (r)
>>   		dev_dbg(adev->dev, "Failed to create task info for VM\n");
>>   
>> +	amdgpu_debugfs_vm_init(file);
> Move that into the caller of amdgpu_vm_init(), this way amdgpu_vm_init() also doesn't need to get the drm_file as parameter.
Ah yes that's better.Sure, Noted.
>
> With that done Reviewed-by: Christian König <christian.koenig@amd.com>.
>
> If nobody objects I will push the first two patches to drm-misc-next now, so you only need to edit, rebase and send out again patch #3 and #4.
Looks like there are new changes and need some more in drm_debugfs.c due 
to another debugfs file which is not in amd-staging-drm-next. I will 
make that change and push new patch set.

Regards
Sunil khatri
>
> Regards,
> Christian
>
>>   	amdgpu_bo_unreserve(vm->root.bo);
>>   	amdgpu_bo_unref(&root_bo);
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> index f3ad687125ad..555afaf867c4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> @@ -487,7 +487,9 @@ int amdgpu_vm_set_pasid(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>   			u32 pasid);
>>   
>>   long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, long timeout);
>> -int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp_id);
>> +int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp_id,
>> +		   struct drm_file *file);
>> +
>>   int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm);
>>   void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm);
>>   int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec,

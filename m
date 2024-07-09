Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1436192C378
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 20:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E41A10E63C;
	Tue,  9 Jul 2024 18:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iUzL3j17";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0331410E63B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 18:46:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5SCdGpUz8xXpQokEyxoCZJjnpNFPGxLgqqKva6XvpvOF2yt2loK8Yq8W31FBhb5Q7GvNbZnhw209RJeOmv9s5R9VTUqRHNom6C7wXbi+G7x3x8rURpfutpoVvnWk/6iSFBpxLmoA4wx5DkogKnex9JKT41feZNGybPvXu3P0MGPdhSSyjVj5wCYNDFH8eDbxxJX8Jppx1Pofkfy8qT6mNRsZpBhWPPcKuFKVoDauJDkP9wbz5wRYttoibBCsha6zH5mI2bdm7vJNq23YAFPvCNluePpayTkxQG5S8tCucwpfVVl6nGRPsPl70cV46o090H1pto8BrCsM/mVTBiPpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51CvxZ83aI7feBPlYtQ1rXcXncaYl/6wvBnqQF+dJMY=;
 b=oLac7hZ3jpRdfzIp1hTF970fVM1evcI1Cx3YhiXcRvrsBAvKwIDX5GyOOPAR8cXLpZIJQxkIKDM5usSVNOEHRHPBp+hyJj+Ou2dC+BV/AhnmHI68lKPjmXqv5Nsyz6qqUEI69TVidT2n2nwZHqjQXOJ+ozgvMe92sITyn7yXYshjmhzJiBZKUmKNsHrgyDcMnMWdLAUXJPwCyY2xqsFq/JD1HJ0KXp5eX2b/FSPwmOE1kBeaPkDtFuC1C8piEjhg7Dwtyasg+3xvuSJyoH9FvPpeRlSvWyWH/tnb8h0+xcY+nGvScHcdF8kxbhi1qRCSO8DGIjZFpv6NpakPoPUfNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51CvxZ83aI7feBPlYtQ1rXcXncaYl/6wvBnqQF+dJMY=;
 b=iUzL3j17A9QsOSsWw3s8xozTqGwYZsvdvCbOrxhQCgcQvAPfxPU96PnQtUlzKXRdLg4m6C1lAexcNXwRxDnzz1owCk9v+v8bXwJY7W617vMOC/hP7d0NsCQ4nPAFIZfFU4VgC5HYMM0/Dxf4bsp1wKLx8827SFiWDFQhzear320=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by IA1PR12MB7566.namprd12.prod.outlook.com (2603:10b6:208:42e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 18:46:25 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::e441:89a7:4dd:dce7]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::e441:89a7:4dd:dce7%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 18:46:25 +0000
Message-ID: <8c4634e9-4f02-4c54-9c89-d75e2f4bf026@amd.com>
Date: Tue, 9 Jul 2024 13:46:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/13] PCI: Give pci_intx() its own devres callback
Content-Language: en-US
To: Philipp Stanner <pstanner@redhat.com>
Cc: airlied@gmail.com, bhelgaas@google.com, dakr@redhat.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, hdegoede@redhat.com,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, sam@ravnborg.org,
 tzimmermann@suse.de, thomas.lendacky@amd.com, mario.limonciello@amd.com
References: <20240613115032.29098-11-pstanner@redhat.com>
 <20240708214656.4721-1-Ashish.Kalra@amd.com>
 <426645d40776198e0fcc942f4a6cac4433c7a9aa.camel@redhat.com>
From: "Kalra, Ashish" <ashish.kalra@amd.com>
In-Reply-To: <426645d40776198e0fcc942f4a6cac4433c7a9aa.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0205.namprd03.prod.outlook.com
 (2603:10b6:610:e4::30) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2767:EE_|IA1PR12MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: f945491f-4ba6-4b55-6983-08dca0476f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFY1RUVMWDFjQ3p0NktwNk5INGVwSUlETm9zZ21sMFNBcUFyeDFOenNSSzZM?=
 =?utf-8?B?RzI2M0srMFI1M3BmbHhWcFNId3I4ZHZjSmZqeTd1dVc3b0tHK2JGVnpIbEI1?=
 =?utf-8?B?MUFMR3FJemJTOE5BM2JPL1VvemJjMWdiSmRyWlJNRUhGeksvb0NxaU00UGxT?=
 =?utf-8?B?RENBbTQ1dWhHa2hsY1l5eHk4WWt5N2JKWTZ5YjhtbVcwbjJhQnErdGxRbnJj?=
 =?utf-8?B?N083OUpacVMxdlNPUklLaGVNYnZIZ1gyWGdYUW9BWmRpSUZPcjZ1WGRDcXA5?=
 =?utf-8?B?VDhZRnBMNjkyc3YvU0U2OHp4MFFqb0o5VHFTNVVIalpudXE3UGZRMzhMakdQ?=
 =?utf-8?B?cVFKZWQrbCtJK0xNcEhJdUNCT3A0SmpRa25wMGNLZElMcjRxM2ZPTVpacUYz?=
 =?utf-8?B?MzhOeGVqOUNDN2o4Q3MrRk94ckc1a0ltenNZcDlsRk91K2UrMjFkWi9GZTNu?=
 =?utf-8?B?SGtEcEhEMFhvWHkrQkdmSXlnQXF5cWJ0eXhRWXhrUnBOV0xGNS9HMW9Pb0x1?=
 =?utf-8?B?RWxCUW9RdVFNNU91bERDZ3pQWXhVUmxORTM2cnhaSTcrdjYwYUdrRGUyQWo2?=
 =?utf-8?B?RDRsdmUrTCsxR2VQbk9idmhmZzMyK1RtOEtrWXI5dEpBZE82OFVYMkNvbVRN?=
 =?utf-8?B?Wmw2N2o0bldwcmZ5SWoybGpTUjZjODF6dzNVZUd1N1d4cFRsbDlBSHk0ZVpP?=
 =?utf-8?B?QU9CbURrUS9SbFFBRUd5NW5QSkVlUkJBenVob1NDWitLbVVQZkg0NnF5dzZ6?=
 =?utf-8?B?Sk1udGdTMGV1UysrdnVkM3ZuR1dSakRxZ3pzeStOdkpJMGNGb2JNa1BVOHRH?=
 =?utf-8?B?UGVPZytEcmd0VGg2ZnRHWS83TnJPTDZZbjNiVGZNSkMzS3hRblYwTDM5YmZj?=
 =?utf-8?B?V3JmZjlXaU5TR1ZUVWhwWmlFdnYwdXo0TTBVZWJoUWhKaFdjeVBQY2lmZ2th?=
 =?utf-8?B?akdLU0lwS1pKd081MGRrRTI2TmlpZ3hReFAxaXR1SEIvMndRcWp5c29nMko2?=
 =?utf-8?B?dmtsU1BzYU9RQkZzbE1sOUhyZldqYTgxbUh1c205T0U3MGNPYmFIWlJ5TnMz?=
 =?utf-8?B?SlM2M3c1WWovQi96SlpzUUwwbzBQalZ3RzU1UnVMQUdTZXpFYXF5cjBGTjdn?=
 =?utf-8?B?QVVPbDZybXN5NVNGVndqNWpKcXo0aEUyVk1FRzVWRWtINC9oRE1uNU5NcVNw?=
 =?utf-8?B?TWl5Z0xQK0paQ2N4ODcxdFloWnp4UDBBZHJYUVJWU2l6azdsb1BxQStrdFJB?=
 =?utf-8?B?ZWFVUGNsa05EYW5hbXF2UWZVZVFiVjZiSmRKZzNnSnJiWUYzd3R2bU5oWjBY?=
 =?utf-8?B?T1pzZGxQN01rUzM1N2l1QS8vNjVqdGU2eG91MnhFOWkrRUhQTnZiWnR5ZlFQ?=
 =?utf-8?B?eVg1eEx4TVFiL2JxT3MrQ2p5NjhCWDUxdE5mZjQxSmVUK0NpTTRVbDJWcVZ0?=
 =?utf-8?B?SUg3bysyYzVySFhaWWxsdUhZZzdaSFAvK3lTZ1EvSlAxVGNsdENzQzg4UFdo?=
 =?utf-8?B?aXFnaTJkcG4wRG53U202dzFqV0wybmc0MHZOckk4R0ZPR3l0c0hMN0FLR0Zh?=
 =?utf-8?B?blR4a2VSYW5JMDJ5QzkvQ3U1MU04N1B5UHJZZitTQm1LMlBmYWUyb2E2YW8y?=
 =?utf-8?B?bW9tUk5TaUl1VTd2UFExemkxSVkyYXN3MU5iQWMwVVd0RTM4RTR2VUxjdjlZ?=
 =?utf-8?B?cHJCTkwrSjY1L1dNSkNYc2JwNjQzVGhzbEdjSXA3QWNhTEtNanBEN3IvMk9F?=
 =?utf-8?Q?OtU+Bu5959Z3cyv+4U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHd5RVJUaFVUcnJmeFBiTVNldjlmb1h5eDg0cThreU81Tk4yT1Z4N2hSc1Y5?=
 =?utf-8?B?Zm9Xc1NDVFcwUkx6VHg0WERaaDRaNityMTFoU3kyVWREZ1dnVWV2QmFWTDVy?=
 =?utf-8?B?QmFyMFRlTzdRWXhPLzQ3bnJEbUExVERrMTVsNkNiNHFwc2l2OHdPMkZQWFN4?=
 =?utf-8?B?ZlNtQUFYYUpmQzIreHFtOUJwdzJ5NEhEVXhyVEdpVDh5V0JlMHJ6V0hHNDhC?=
 =?utf-8?B?UnR1Lzgxbit1dVdUTTJ3TWJCY2o2dGcxb24zdjJkcjFRWFhzOXNLMnNjNVJo?=
 =?utf-8?B?TVkzYzg1Ykd0QVhzRUJKQndlTDAxclkvVGt0NGhDN2U1VTNCZ3ZtREpLZyt1?=
 =?utf-8?B?YlZ2bUZMbm05ZkE1KzBDTE11UFhvc2JhQWE5Ujg0VCtGWUhscUNMd09DSTlj?=
 =?utf-8?B?SzZzd3BhejNSWkk3MGZ3Z2k5cnlubUJwbHNaRGc1a0FGUWlma1g1WjZMUkZR?=
 =?utf-8?B?RGJ5WXpqZWM3N0lnVjlDZWczd1lzRTlLbWtYNE54QURnQmpwMFNJMytDcWU4?=
 =?utf-8?B?ZEY3SFpFYnh5bnBJSFBtYW95UjZZbEpaVTNXbWkxZFMzT1BtL3p3T01lTExS?=
 =?utf-8?B?R25VaC82VEx3bjlzaDBkZ1VhTXM2MlhmWlhldFE0NEtoaUNxb0FhSS9nUXpr?=
 =?utf-8?B?NXpYTXFkcUp4eGJUWG1GM3llY2tIdEhJTGJqNWFWMEppa0lyR054MG1jbCtN?=
 =?utf-8?B?SFJ0ZEozNnJEaVZYRXlKeHFvNXI2MFVyRkFHeG5pN3lSN2JBVk9sYUcxL1U1?=
 =?utf-8?B?UGhGZXJTeUQrRWNObWovMnBBQ3BVeVNzbGNCVldTSWU2VktSTVRFKzBXQnR5?=
 =?utf-8?B?SG1GSWsrdkJSRGdYSTZIb0tGTzdaWnR1NjNsY2k3VEorcWJYdFlWVTF6SG5Q?=
 =?utf-8?B?NkpJTElIYlkwL2hMZDcvV1V4Q2tBU2loaENNcUN5RXZyVHQwdzF4dkc4SDFD?=
 =?utf-8?B?dWZ2SStPS0xhbk51S2lYS3FhRXhBZEtJS3poTU1kb3dQWnErWnJpT3ZBQW9r?=
 =?utf-8?B?djYvcVNmQVFzd3lIUktBS00xWHhPeGNaeWhzK1gzMjZnWkN3N1JmTTNVTHlU?=
 =?utf-8?B?c3RmcjBncVdQQlFSemQrY3ZlZHZnVGNSK1dCMzlGQWJtUVBrT09uWS9vUFht?=
 =?utf-8?B?Vzc2cFBvOGxaTkw3S1NaQWYzcVFCOHIyZlN3WEdabGYwUFByNWdnNTJjUDNL?=
 =?utf-8?B?WEdzSlNxT0dvS0RQd2hnYWlET21PV0xsck1ac0kzVlNmSk9WQmczclgvVEt0?=
 =?utf-8?B?Vk5wUjVXdWRaSGppR1RWWHd2VlF3ZExhZ0JJMm43UW9OTmt2ZEo2dnEyOFVY?=
 =?utf-8?B?TnpmQUNDZWY0eTlPV0dMQ015WnlobWh3ME1QNnNUVlhhWnI5NlQ0SDF6T3cv?=
 =?utf-8?B?eTJXdld4Zm9vZzJ0cER2U3BLendld25YNUQ1UzVCMFloNlhVSXR0dWFtZWh3?=
 =?utf-8?B?QVdFWG9PN2pOOTVwdncxNTZFSmdZQlpra1J5UXF4aTVOWGpHSTQzZzlJeDZs?=
 =?utf-8?B?RXhPZTZOV3pEOWp0dnVGa2xrYU9Kd1dqU241SHhlOUVGSGVndUQxdEpjREJS?=
 =?utf-8?B?WmhKQXROeHhCdm12bHQzTHdybTJ5bUx1MmM4OTd5Um5Ca2s5Q05EWXNVells?=
 =?utf-8?B?ZHhiTmVsMkwzVmV5c2pwUGs1V0hKL0I5SW5NRTNVZVhpajFESzI2UDR2aFBq?=
 =?utf-8?B?eDFNcGJNRXJLdHFoYndEeVo1L29UL2taV0E3eVVFVTR0c29LWkJINEJBU2J3?=
 =?utf-8?B?cDU0eGxiTkRKbnk0L09qM28vdXNEZWxWUVBkb1RsVnQva29SOU1LNktQeHJJ?=
 =?utf-8?B?RDB1NVlla05hdXZGL08wQklwSWRJQ0k1NzdpbnFxUEhSZHdCMmFDMUlIdEJx?=
 =?utf-8?B?TGkyd2IxVjNLOCtkKzZxK0x6VVlWa3ZIcHJIMWh1YmtyNjRtTUhCNlQ1M21M?=
 =?utf-8?B?VWNtRUxLb2dlc1I4TXY1aHRMVmcvYk8ramtOUzNiL1VYaDB3aEFONSttTStn?=
 =?utf-8?B?My90TzN5UWZyaUMzek5Rd0dERzRWRldPTWFzMjdsbjNCQUtSSDJmUFI1VTc5?=
 =?utf-8?B?TmIwWEFIdWpnQnRTQUhtV2NpS2ZBTXpzajJLTUZnQlNrTzArN1lFejV4dlB2?=
 =?utf-8?Q?+nm2EwOPNrYiFpTlRt/G2hEGe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f945491f-4ba6-4b55-6983-08dca0476f20
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 18:46:24.9312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pM0wxDzI6NDz+RBntHxPqPyduQXMFQ/a/3/X/qVE/HXiCfLgBCU41iVYVing+ZFa5TXT+WY35qyOqwqLqK/ayQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7566
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

Hello Philipp,

I have reviewed and tested this patch, looks to be working fine and fixes the issue.

Thanks, Ashish

On 7/9/2024 3:56 AM, Philipp Stanner wrote:
> From c24bd5b66e798a341caf183fb7cdbdf235502d90 Mon Sep 17 00:00:00 2001
> From: Philipp Stanner <pstanner@redhat.com>
> Date: Tue, 9 Jul 2024 09:45:48 +0200
> Subject: [PATCH] PCI: Fix pcim_intx() recursive calls
>
> pci_intx() calls into pcim_intx() in managed mode, i.e., when
> pcim_enable_device() had been called. This recursive call causes a bug
> by re-registering the device resource in the release callback.
>
> This is the same phenomenon that made it necessary to implement some
> functionality a second time, see __pcim_request_region().
>
> Implement __pcim_intx() to bypass the hybrid nature of pci_intx() on
> driver detach.
>
> Fixes: https://lore.kernel.org/all/20240708214656.4721-1-Ashish.Kalra@amd.com/
> Reported-by: Ashish Kalra <Ashish.Kalra@amd.com>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
> Hi Ashish,
> I hacked down this fix that should be applyable on top.
> Could you maybe have a first quick look whether this fixes the issue?
> ---
>  drivers/pci/devres.c | 33 +++++++++++++++++++++------------
>  1 file changed, 21 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
> index 2f0379a4e58f..dcef049b72fe 100644
> --- a/drivers/pci/devres.c
> +++ b/drivers/pci/devres.c
> @@ -408,12 +408,31 @@ static inline bool mask_contains_bar(int mask, int bar)
>  	return mask & BIT(bar);
>  }
>  
> +/*
> + * This is a copy of pci_intx() used to bypass the problem of occuring
> + * recursive function calls due to the hybrid nature of pci_intx().
> + */
> +static void __pcim_intx(struct pci_dev *pdev, int enable)
> +{
> +	u16 pci_command, new;
> +
> +	pci_read_config_word(pdev, PCI_COMMAND, &pci_command);
> +
> +	if (enable)
> +		new = pci_command & ~PCI_COMMAND_INTX_DISABLE;
> +	else
> +		new = pci_command | PCI_COMMAND_INTX_DISABLE;
> +
> +	if (new != pci_command)
> +		pci_write_config_word(pdev, PCI_COMMAND, new);
> +}
> +
>  static void pcim_intx_restore(struct device *dev, void *data)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct pcim_intx_devres *res = data;
>  
> -	pci_intx(pdev, res->orig_intx);
> +	__pcim_intx(pdev, res->orig_intx);
>  }
>  
>  static struct pcim_intx_devres *get_or_create_intx_devres(struct device *dev)
> @@ -443,7 +462,6 @@ static struct pcim_intx_devres *get_or_create_intx_devres(struct device *dev)
>   */
>  int pcim_intx(struct pci_dev *pdev, int enable)
>  {
> -	u16 pci_command, new;
>  	struct pcim_intx_devres *res;
>  
>  	res = get_or_create_intx_devres(&pdev->dev);
> @@ -451,16 +469,7 @@ int pcim_intx(struct pci_dev *pdev, int enable)
>  		return -ENOMEM;
>  
>  	res->orig_intx = !enable;
> -
> -	pci_read_config_word(pdev, PCI_COMMAND, &pci_command);
> -
> -	if (enable)
> -		new = pci_command & ~PCI_COMMAND_INTX_DISABLE;
> -	else
> -		new = pci_command | PCI_COMMAND_INTX_DISABLE;
> -
> -	if (new != pci_command)
> -		pci_write_config_word(pdev, PCI_COMMAND, new);
> +	__pcim_intx(pdev, enable);
>  
>  	return 0;
>  }
Tested-by: Ashish Kalra <Ashish.Kalra@amd.com>

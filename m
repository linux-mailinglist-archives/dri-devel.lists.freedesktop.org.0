Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 606FD429427
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 18:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956E589D46;
	Mon, 11 Oct 2021 16:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7F789D46
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 16:07:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1DgMV4FgYZRnS6hFvRrGlu4v3y6qrHnAEMrGM4Cr6piivHKxiZTxfXIArPbga9MPq7eghB+peTTR7n0gnnipjLDqgJVvUDSd4dCZXNVGpvXXPTOzhl06J42sZKKnrg+Zr/wvAhDsZWK1I5T8jcNL1Wnt4XkAHdm8kCjVoAakXV+aOYkCWqEaelKtR7blgX70a6GlRMduzEhAPWvmpVtC4ILYhcRvL9fYThjqMylCs2/HHRAgBq9S1vYBp4bgeD4KNTxX4HO3iIze6JlvIfYxAsl5POHG3ZKSMKKzeLjfQEiXbV6CvUCfY3QXSzvLZaYSPEZEgZk4HW9S52z8RB5AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDUFL+Puv5jSxlTSggkKkF8MMv95MmnZ6cP4+Zw53Ns=;
 b=KNoF3Wx4qTtD06+uk2kBryhJwplOx1aromatG29d4CY8stIS6jaGD+O7/5mwZWeoVmnq1c55/lTYTbS5E5DnNTrOfu1Mx2QpCNCgieXAP8y1x7DVGPYWp6fyHsTr7AadarGU57M7n8pITpGACW3y2C12hBFkL3SQ8eEpfnH/1QRG677QUXRga0kdYHPyPWJH9MPvjzTWm20W8sSIrISFTh5G6sO9vJj0dolt1k3CoSyb99hspG9tD5o4kmRBCKsY202Mq+gzqDMN0B6tV7UAWoZei/LDn9D5fu7baFR7CUmIttQH2LP7n3mji105GAqxovg0zCT89KqWx8GCGpOSKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDUFL+Puv5jSxlTSggkKkF8MMv95MmnZ6cP4+Zw53Ns=;
 b=1gqjQrigzts/dnzEKLHb6AfAIrWUC/78VZebnAIk8/NL8CLsOdhQ39eZdiz8HAx7RGQurXBVmz+c0aKsq10T1h0CURXWd8wcNUO83SOvmg24Cz4zviX5pBKv+d3HDmxGK/Cu0+MbT94SEHs8bNuL+ZdhapdeWAacXKV1XWUJHnw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3505.namprd12.prod.outlook.com (2603:10b6:408:69::17)
 by BN6PR12MB1522.namprd12.prod.outlook.com (2603:10b6:405:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Mon, 11 Oct
 2021 16:07:16 +0000
Received: from BN8PR12MB3505.namprd12.prod.outlook.com
 ([fe80::704c:60ed:36f:4e4c]) by BN8PR12MB3505.namprd12.prod.outlook.com
 ([fe80::704c:60ed:36f:4e4c%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 16:07:16 +0000
Subject: Re: BUG: KASAN: use-after-free in enqueue_timer+0x4f/0x1e0
From: Kim Phillips <kim.phillips@amd.com>
To: Ainux <ainux.wang@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 sterlingteng@gmail.com, chenhuacai@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <0f7871be-9ca6-5ae4-3a40-5db9a8fb2365@amd.com>
Message-ID: <a6d2d16c-173f-d49b-ec54-defd6be2bb0c@amd.com>
Date: Mon, 11 Oct 2021 11:07:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <0f7871be-9ca6-5ae4-3a40-5db9a8fb2365@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:20::7) To BN8PR12MB3505.namprd12.prod.outlook.com
 (2603:10b6:408:69::17)
MIME-Version: 1.0
Received: from [10.236.30.70] (165.204.77.1) by
 SA9PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:20::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25 via Frontend Transport; Mon, 11 Oct 2021 16:07:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2524fb2f-5292-4759-ccf1-08d98cd131d2
X-MS-TrafficTypeDiagnostic: BN6PR12MB1522:
X-Microsoft-Antispam-PRVS: <BN6PR12MB152281C7ECFA884E2505809687B59@BN6PR12MB1522.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YzOBWQZ6XVx4Mu26/baH+eoBUfUCWHBb6Lh8VmNC/AHfcFv+J2L67StONAjsu37TTEqy5jbHgjbAjqn0shX1aiIf9QDpnFyIgE0awLBIcVR+20P6+mXH5VlRDEN+bGh7X0xFJv9q9idqRSmlHpgFpdW0JwrHAHtOLU/tkpnyVHR5gva1wr1RO0xli4H48wfv7UhalIhDYro7f/Kil0OH7ePEtC3u7A6TTjPYd8FymE3eZxELG/TFrp1H4l7LzecXGK2DG1pNp2Xfd+VkQPKtxeIvwnEI7JSz9d1OopnltbSt7zBUPhzQgimKT57Ma5B0I/IZ1y/kc0vrutz6vlnady738BGCYtb9P104YgvDduZ12iq9k7+q14JO0Cvp6vhFc7yhBGpZTHzUIagzvcTAKB/NRlt8BmW8i4dJindTWJ+S3afc6857a/yi1jnGtJS+YTBLN5gfGriglfT2p3NKFwmDY0tpH4gxWVkLzDivuU/A0/q01XuOMo5qC2k8DT9Re87/lq/8VqIFYOe/A9KtpX6d8G8gfwdwMnFmfJac+pFxbdhryLSEYEr3/RUg8guNdcStNNoRz366O8nUZyEuAUyCGIPAvuwTODezwNxFEA2sq6JPExd1PUOh1dWU0ZIdOZv1WdQFrdepj2r1pY756qAKEpVWh1YnCOC1W6EgNIQTolZIcuWJ55cQpxloWnUc4wmUtwc9bKuzaYRIovxQV0NMH8bwBHm/3U/Fbq/34qA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3505.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(5660300002)(186003)(508600001)(16576012)(44832011)(53546011)(66946007)(2906002)(31696002)(4744005)(66476007)(66556008)(31686004)(8936002)(316002)(6486002)(4326008)(110136005)(36756003)(83380400001)(26005)(2616005)(38100700002)(956004)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnNrcmg0Q3lkbnorSjBGM01PRHB2Q0hxSkU2bUYvWnRwU2NGMnpmLzRDc01y?=
 =?utf-8?B?UVJwRXdpSGhKSGx3Z1lxODFJNks4NEZKcWZGSW1XbkF3bGtJTEc2aWkwMFBm?=
 =?utf-8?B?SFdKLzFXeGxGVUoyTFFxMHR0NmJwWGd0VUVmMStlOStHQUVFSlFpUGFUclBK?=
 =?utf-8?B?RG14NTA2bTAzczBoOFMxc21sWFYzTnhHbVE0blZOSnZSUUNGUWVYUDdnaXQx?=
 =?utf-8?B?YW9MOFBWVVRIbXBLVkwrcFpIRVA4T0xvRDl1c0l2WTErOW1rRGtTVHlJRmJz?=
 =?utf-8?B?Wm1wWXdqcXlOSmFwOXhBRlZLdlBuSUhNVXdDTWZ5MGo1NFV2T1VSYzUwNXU5?=
 =?utf-8?B?alhucTdHYmdWMEFMZmJ2MEZrUDZFOE9FcXdQcUxBMERXVVhZelJiOXNDNVpa?=
 =?utf-8?B?WjM0RXNtNDg4STRFeFJRcDlxcWw0cUI1NGJmZUJLZzhPUWZkbExQZFNUb1NI?=
 =?utf-8?B?YWlzM2g5Zlk5bW5OT09qVXhvQkgvWnFham4wTVJIai82UW9KaDdXa1J6cVc0?=
 =?utf-8?B?Zm9ubnZiaTJ1cENCSm5rMFhCc3Y1eTJOc2ZjTjF3U3pDRnhieTk3UjlZa1p2?=
 =?utf-8?B?NHRjdldhRWF4VE9OUkltWmc0SE8zMkx5aDdwekhScERXcGtkZHBtbmRHb3BN?=
 =?utf-8?B?K1NOOXpFeUk2cU5xc2Z5dlN6Yzl5blFMNmpCdWxTbXVlUytGcnRpeU9kam1i?=
 =?utf-8?B?UWRqMFN5bVRPZG15ZUJvelRrQ2xzQjlXaTJpM1RqMktvc3FDTWVMOVlGYWp0?=
 =?utf-8?B?L1ZEM0FzcERlUU10Qnk3aytQQ01IOE9zZ3ZiS0JUTWJMY2s5R25ZeFNmeUxT?=
 =?utf-8?B?RlZIZmF6RDJLTStsMFhlSmJJNGRYajEwdTdpckVDMXZMTGJlQTFJTFNnSExJ?=
 =?utf-8?B?UDlEZHJUbWZWaHdubW1ldW4vWnViRWZCbDFXK09YMWkwNXN1dkhPcStZcVJ4?=
 =?utf-8?B?SWFIdEVvcXJzWXg3K0d6S1JqTG1vdHlZZGRPZ2NMWkh6U1ArQnZGbUVqYlBo?=
 =?utf-8?B?bS9zZjBWWlIvcXhibmRWQjdCR0tBYlo4OVhnQnJHejI1MVJZNnY0ZXgzc0F0?=
 =?utf-8?B?TXpRejJXMlQvWkZnSm1JWVVUcG5qOExXOW85RlpXRHN0VzhKZHFWTHRESlN0?=
 =?utf-8?B?L0lXdG5MUXdzZTFCcVpqVk1qcWxHUWE3S0gzOFI2R01PWSs5SUwzT1VKSlIy?=
 =?utf-8?B?R2Y4ZkpHdUNkU0F3dEhaOUkxUmNtM1hHQU5FczYvVWRFSTYyS0JZbGd1aTc0?=
 =?utf-8?B?RWdFUDYyaVRXd0dQNmJLOUFDWWxoS2pZazVzOU5YUXBlcWk4U3FrdmZZVEtY?=
 =?utf-8?B?VVJxYzFuZnN4MlFua0NFN3dwL2k3V3dmNW01Mk5FdE5VMldGVTl0UDlJMEJO?=
 =?utf-8?B?QlordGF5ZTlXMWtIdHU2cVZqc08rOWNneC9YbnJOZEhKV081Y0ZYZGlNRkZI?=
 =?utf-8?B?WXN3TmZtS1pyNElkejRMb3JReXdiS3hqWW9ERXZkV1dJL0tCRng5TmJlWmR6?=
 =?utf-8?B?WnRPUmlXcFdQNTdIcWpMSFRGMzlETWl5VnkweVhRRnpBWTFSbDJ3VXhncmRJ?=
 =?utf-8?B?amNveDlVdS9lTkRpdWlDUEVIR0wzMUVVU2o4ZnRvQmVtUk1NVFREcVVGbEVo?=
 =?utf-8?B?WngvY0xKOEh1T3ZFbld4QmhUSWpkS1M5SHhUYmNOU3lhTEZZdlJnc1ZLQ3dC?=
 =?utf-8?B?ZzRGb1RrNDI3Vzg3WVRNOWdUcVRFTVI5aDFTRVZpcDhNNjJaN1RrbFhqNWxn?=
 =?utf-8?Q?c1GQ+O8ETuT4ZBfcmOGLLF1A3MPavYQgv77RRkb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2524fb2f-5292-4759-ccf1-08d98cd131d2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3505.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 16:07:16.3157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4UfXGOZQJXiHMS23hsTBtlf/GL3QxVzB/j91oC2wxswE854daT/ho7CUrxSB1zDMhX0qzBT8lHYUnwG3p5rt1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1522
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

Hi,

On 10/5/21 1:10 PM, Kim Phillips wrote:
> Hi, I occasionally see the below trace with Linus' master on an
> AMD Milan system:
> 
> [   25.657322] BUG: kernel NULL pointer dereference, address: 0000000000000000
> [   25.665097] #PF: supervisor instruction fetch in kernel mode
> [   25.671448] #PF: error_code(0x0010) - not-present page
<snip>
> That bisection led to this commit:
> 
> commit aae74ff9caa8de9a45ae2e46068c417817392a26
> Author: Ainux <ainux.wang@gmail.com>
> Date:   Wed May 26 19:15:15 2021 +0800
>      drm/ast: Add detect function support
<snip>
> I confirmed that if I revert it from v5.15-rc4 (after reverting
> its dependent 572994bf18ff "drm/ast: Zero is missing in detect
> function"), the problem goes away.
> 
> Full .config, dmesg attached.
> 
> I can test any possible fixes...


Ping - if no fixes are in the works, can the offending commit(s)
be reverted?

Thanks,

Kim

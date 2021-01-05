Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 601762EAEBB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 16:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098D06E0EF;
	Tue,  5 Jan 2021 15:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBEE6E0EF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 15:40:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1no0jcsHv7rn6ELJMZoxHII+q4q0Ktdd7MR9zberGdw151aQOckoqp1Wt1zi6DAgWuZs5hionxKg1v1y+P0slgZutLLVRB68QAupKQvEh5wi1/rghCcYA809LKnBi9z7SI6bglmEqe8KQVRKRYrZPRIqTMnu7Mu6hV+nZd8UJR7IE2TUWjzFwVcOPIILsm4IIaC1oKPEV2V/eRG6cLrqRh/hKKWYrKKN70u58uvjLSMXZcZfaS6Fj3LFFL+w4wUnb/FDqtHpU2QQd17bKCIj6KK475JjGTpPCd+xQuWJvTD11DiXKQIocC5Ae/DspHhrzTEsyXhKC9PawCi4qgTaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrOzuZ8ntaI8UgXB9XMI1nbAqRMusMEBFYdeF0oReTU=;
 b=KA11ECOZOf09fj2L7DP8iTonIxSzcfJjfOua/D1GnZxv+ClTbMHz4eavi/bYgmlBhzNIjDX25TqB93UdOLHRb3OUMYumckNuVbb50K7uHwQaovkAe+JYgvrgI29syEYW6K+8BgASeXfW6RA6CjRL+RIrKUbd13ikFbuKgVSHPmFgtTA2IypAA72xQ4Ba2UPXwCnWWh4xh36GhXVFBGEC6mhFOginNYe7YXO7LkHdaYdOjw2TSKbjzx0/innA7e18/UUH9BpOF2GPlUAjA1EMxZHErNTMf9tAmYmLi+8fgXZrKC4TtW6FORo0rrcKPWjRiphKEgXIrK15xIU5n4b32g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrOzuZ8ntaI8UgXB9XMI1nbAqRMusMEBFYdeF0oReTU=;
 b=G8xKKWk/KjK7mCr3K0mra5FHbyqUasvDWiB0zxFC4xnuvK8leSlKCia8SJUTOCCQde7V0/4wG1/4Hpa5FKfZwL3MDwzATJS5V7xd/edlQ7D1QgHTGkIbQo18orEkoFaJkwV9QhT/wDkYTUOmu6F2MIw3rEYSGypCwHhGWQeb6Fc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4392.namprd12.prod.outlook.com (2603:10b6:208:264::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Tue, 5 Jan
 2021 15:40:21 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.006; Tue, 5 Jan 2021
 15:40:21 +0000
Subject: Re: 5.11-rc1 TTM list corruption
To: Huang Rui <ray.huang@amd.com>, Borislav Petkov <bp@alien8.de>
References: <20201231104020.GA4504@zn.tnic>
 <e3bfa0a4-5d0a-bd68-6cc8-73db1d29f22c@amd.com>
 <20210104105802.GD32151@zn.tnic> <20210105041213.GA544780@hr-amd>
 <20210105103138.GB28649@zn.tnic> <20210105110852.GA1052081@hr-amd>
 <20210105114351.GD28649@zn.tnic> <20210105122026.GA227519@hr-amd>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fa11e930-d8ee-a291-7d6a-6fdd6653ffa8@amd.com>
Date: Tue, 5 Jan 2021 16:40:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210105122026.GA227519@hr-amd>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR07CA0100.eurprd07.prod.outlook.com
 (2603:10a6:207:6::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0100.eurprd07.prod.outlook.com (2603:10a6:207:6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.4 via Frontend Transport; Tue, 5 Jan 2021 15:40:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6da8ae6c-9a21-4876-add4-08d8b1903649
X-MS-TrafficTypeDiagnostic: MN2PR12MB4392:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43929A0D57F7535570EFF94A83D10@MN2PR12MB4392.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9BKMog0C/UGUgm4oplabyLQqStV6tzC4MIKQsGKMpS/JYihhBkZOJg4230zIXCswFBkknv+JvlXh0bS5PiftbdLuQ4UNdzVTo1IFoYw1c5w/bg1mzxwHBOdbjDBO198DfkfmINIHe34ygIpgC7Qfsz1dnfSGqTTG30dKxgf+LJg2FBM6bR8wgE4IXq8JSfMwo+cICSoRWTJLhyfaSGrkyHuc4u9NR5fYiyCEsVHwpCXs8m27IpJqKFPBF7AMtxWdlDg558D4JpZBzTSvZ6ZDCGCd2BIH5YuL6/DwL6l8YgBP7hRWt426IHaJgVEuBZeD1cK97XFNgJzBpx2xbqtaOFkBtuIOtBqFWOMSJj4v1JOGrwxRUvDF1a2IlJsVeofWeTxAzuNr3sNDDGFDzjCwehBR6ESgWauZ9n2dzDTL+CrarQqNyp1bAn61tYrQ2UN1kKS87wfWQj10nv+5zjhvNDZQIV0vGURXKdhsk+EyQxw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39830400003)(346002)(376002)(186003)(31696002)(83380400001)(16526019)(6666004)(4326008)(86362001)(2616005)(8936002)(478600001)(31686004)(8676002)(66556008)(5660300002)(110136005)(66476007)(66946007)(54906003)(316002)(52116002)(6486002)(36756003)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NnhCaERQYnp1OGFvT0pZUm0zbkdaL0RFcjNUaFIyUFJSNFZHQWY4K1h5d1ZG?=
 =?utf-8?B?WnRFRjNCNWhUMmlFM1RCNlJTdkZNMDMzQ1FjN2tjYXJPeWZqOHNuV1BnOXdY?=
 =?utf-8?B?Tk9TdHZReW1CM21XcUxsTHJRNnNmQ25lNmN6UUxOZGFqblh4U2hRaXUyWUwy?=
 =?utf-8?B?MGNOMjI4djNLcXhOUVlkblNteW5uWFZUZWkwUC9sRElYcXRkRU9EVnJHTHE1?=
 =?utf-8?B?c29rYkxLZEpZcDJJYmtnRW15ODE4RktZanlqbkNNVSs0QmVRY2k0SWpJRGdV?=
 =?utf-8?B?RXFGbk5qRWxNSlhVVWpnUHRkbmc3QmtIbE45ak1SSDBxYWI2ek4vTjZqV2Jv?=
 =?utf-8?B?K3J2bk9odG11Rlo3dFJlSUxjNmtTRzBnMDZvaDAzMDd0QVJRQTVZMU1yN2tM?=
 =?utf-8?B?RGpCQWV4T09heDRCN0JIaFNuV1AzcjN6cXlsUTJXVjBXemM2OFB5NlJ1ZTFW?=
 =?utf-8?B?RXBydjAvS3pVbUhBRUdBTEY5eWxuYjN4UVpYNlNEVWxTZ3YzbW1JL1Uyc015?=
 =?utf-8?B?OGFZNnJUS2EwdjRUS3ZQV1Q0OHlDS3lzekgzaDNicmV3T0h5cTZ2bVNBdUJp?=
 =?utf-8?B?T0d5bjF0VzE4S0lsa05tZUNseUU1eTdleHZXVHFkRHJrUE1sQU5zS05xK0Iz?=
 =?utf-8?B?VldLN2wrNlhSSHNvQUFGQnVPZ0k0Mmx4RFEwcUVrYXVEU1ZKNW5XRVFHS0sr?=
 =?utf-8?B?bzJURnBCN213WlIzdmc3K0NTbDRIdE05bE5LdEg3cXloYlJDUDVYWnVwNk5J?=
 =?utf-8?B?SHd5dExwUTZ1MVUxZG93QXFtbmFzU0dLazBWa3c5SFJWdTg3MnhLZXBub28z?=
 =?utf-8?B?TERhaWhzcExkVmN3RG5Ld2tVTWozSmRwTzhDejB0REd6RmhLb2N6MTBuYTZ3?=
 =?utf-8?B?aU1pOVVGQ1dQSHROUytOOGQrT3BWR1JFYXI4UDdhS2dDN1hpMHBVNzA2NHEr?=
 =?utf-8?B?Q1F2Z1VDOUtJcG9ZaHI4a1habTZSNTRNdUdmQzRBdVNsQWtDcmJKS2FjYmZU?=
 =?utf-8?B?TU1ycnNJNXRydWN3eXZHNjVFdFBLNXhyOTI2d3FnVmdSZlpnUG5xV2pMaXdZ?=
 =?utf-8?B?TWJ1Sm5FT0M3Rmt4azhCQm9jeE1CVHRZbmpmeEF6V3llQzVMUGRBdEc4d2hs?=
 =?utf-8?B?QWdZVEE3bG5DalVxNEE0TWRSQUZBeEZabEVPT2NwMSszL3QyQzJUZVpWRGlM?=
 =?utf-8?B?V0ZONndGUkJDWHZHa2JKYWY4SGplaG1oaTZGRDBSNklWcDJNcXAxMkRzZGp2?=
 =?utf-8?B?RVBBTUtkTzJpMmxwZmxaaGdPV3JzWlhRNytKZVEzdG9ObzNNbGZtc0R6WHZY?=
 =?utf-8?B?REhxbG40eEdoeHIyS0t4dWxweExJNnhML0RjeGVHY0toWWxaZ3R1RHFaS1dv?=
 =?utf-8?B?OS95ZnRqNG8vdEpieDdTVlNhZS82RW9MbGQyMytzUWpJdHZaSldUK1Q4UHhM?=
 =?utf-8?Q?iHUAn0tX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 15:40:21.6131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da8ae6c-9a21-4876-add4-08d8b1903649
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTQTVf8Jmo0qHOhpyv6G+ypNt8o1qS7lbNtbcPsVZYiWGKuzqSGY3n2Iy/0ozPU2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4392
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
Cc: lkml <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.01.21 um 13:20 schrieb Huang Rui:
> On Tue, Jan 05, 2021 at 07:43:51PM +0800, Borislav Petkov wrote:
>> On Tue, Jan 05, 2021 at 07:08:52PM +0800, Huang Rui wrote:
>>> Ah, this asic is a bit old and still use radeon driver. So we didn't
>>> reproduce it on amdgpu driver. I don't have such the old asic in my hand.
>>> May we know whether this issue can be duplicated after SI which is used
>>> amdgpu module (not sure whether you have recent APU or GPU)?
>> The latest I have (I think it is the latest) is:
>>
>> [    1.826102] [drm] initializing kernel modesetting (RENOIR 0x1002:0x1636 0x17AA:0x5099 0xD1).
>>
>> and so far that hasn't triggered it. Which makes sense because that
>> thing uses amdgpu:
>>
>> [    1.810260] [drm] amdgpu kernel modesetting enabled.
> Yes! Renoir is late enough for amdgpu kernel module. :-)
> Please let us know if you still encounter the issue.

Thanks for the hints guys. You need a rather specific configuration, but 
I can reproduce this now.

Let's see what the problem is here.

Thanks,
Christian.

>
> Thanks,
> Ray

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BE443A0CB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 21:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4C389C2A;
	Mon, 25 Oct 2021 19:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69CD89C2A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 19:33:49 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19PJEGL7026866; 
 Mon, 25 Oct 2021 19:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=dwSViFRbIEaDwfwF0GxwwXgHgFSxFWhtz+Q4IK0LQPw=;
 b=k+FuXwf997bfWs5IZYj8EWqVDN7iaT4rovvqOYneeWwsfErFEBHqksBZeud1LnrSOnf0
 g07yvppAO4HlHl/iPwY1zpdwQo9K0Gc02VMCwzdhWziIzuvSySFqGXyulwI9s/B3T7Xs
 18UULyUviS0K7qgQ9CDZKRaz8clglWihW5+RS3p5P9dUBhxQZ2teAloYEzBcGcA0aBOv
 JTk6qDmr3lc/KaPuByqpmmnvXRj0kj+sPegFDprUHrauoBjNWG3Fxvi3RTlaD7vgssLP
 dS9KHNvM9P8ww06TlAijCo1o6p8mIPCPveGZQHLsGGV3SEyTzd9Te9yblRfZhpjfLQJn YA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bwxcy9j80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Oct 2021 19:33:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19PJFUxm030804;
 Mon, 25 Oct 2021 19:33:46 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by aserp3020.oracle.com with ESMTP id 3bva7700w7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Oct 2021 19:33:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TT6cpo30qE9iaZfixqP08ZCxnRcGjtoA7LNtRSVegBbTbBp2qNjVSMTXsPmnY29RPmRk0y0l5a7P9gEeufQ4FX2qwdVGqvNjSpti6QsH/FgYvhBay/EOA4qxW3D5CsOjVXAZmbEbEFDMK2DQwIWpYiWRKVpybbuS465w42YXtpRlJKFEbe/f0mRN+6FXDzjx2YHvflJbbzwbepF3fDPIiTmXv6Kgc9YoHl+PQCtYZ/59fHEfl7YIfoquZuakeezIyWvY8YbfZtSMcmvJcAgSYznJX6sbLKcG3ClIeHr22dejpd+6hhvKLqxfpUWhIB5mwhY2xCIGvr/dfAX40LmuYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwSViFRbIEaDwfwF0GxwwXgHgFSxFWhtz+Q4IK0LQPw=;
 b=YhoxoXmnCDpyg55jf19mJg5z9QfbbI+RXFLcH990YLe3hlkymLoC2t8rzQQi+wFmZJXVZikFYvCJD8W+PdUiEps1cru+dkax9EhgqkeKkg7/DLW0zCghDLqFYzopm9nEa4u80KOX7WIwcJKzGwcvNkMnMQSb4Na11nWWSugv8echdkhe9PTPUYcBWw8eB1WIJiLTQeGTrWnafQvR3DiD1F4V051Ve7bQxTc9me3EoXVeDZzjUoyQZGEiXWtddPZI/e1HlE0c6WRbgl2hJv2m5dqIUCPGqzejfVGU3OuYh/Ise3KI9PvFhsvksiYU5zKnucjVKzHkm87Vyi/kCJKE+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwSViFRbIEaDwfwF0GxwwXgHgFSxFWhtz+Q4IK0LQPw=;
 b=my4F29guIN0jWQXRLqsyTmlVe3AIi0Nwu4c/DjuOjDBnVq4YmEigvIuq8iXyuMARmBkLC/FjnSGhXjx2Ehwm5jKHlXjnHDNQ9/7jngebzlkp1nfIebbD6BbWo9kbO/+koOUChnoa9evjUXrEt0h8uGjI5n8oVaOk0DbfIueD2c0=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=oracle.com;
Received: from BN0PR10MB5192.namprd10.prod.outlook.com (2603:10b6:408:115::8)
 by BN0PR10MB5224.namprd10.prod.outlook.com (2603:10b6:408:117::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Mon, 25 Oct
 2021 19:33:44 +0000
Received: from BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e]) by BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e%4]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 19:33:44 +0000
Message-ID: <0ddb1c19-64b0-4117-7a92-c3d2fcddfdcf@oracle.com>
Date: Mon, 25 Oct 2021 15:33:43 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] video: fbdev: cirrusfb: check pixclock to avoid divide by
 zero
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: tzimmermann@suse.de, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1635188490-15082-1-git-send-email-george.kennedy@oracle.com>
 <YXcAbXJfg/jKCo5h@kroah.com>
From: George Kennedy <george.kennedy@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <YXcAbXJfg/jKCo5h@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR01CA0006.prod.exchangelabs.com (2603:10b6:208:10c::19)
 To BN0PR10MB5192.namprd10.prod.outlook.com
 (2603:10b6:408:115::8)
MIME-Version: 1.0
Received: from [10.39.217.235] (138.3.201.43) by
 MN2PR01CA0006.prod.exchangelabs.com (2603:10b6:208:10c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Mon, 25 Oct 2021 19:33:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18e9a1e0-8e02-435d-69f2-08d997ee5bc2
X-MS-TrafficTypeDiagnostic: BN0PR10MB5224:
X-Microsoft-Antispam-PRVS: <BN0PR10MB522496A6CD1969EC70781C83E6839@BN0PR10MB5224.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tzl/4/RWwpFgGja6yl/9WboMFa6xggrcy3InZZZDsJHBI36srRH4m51S5uj8Srn8pC26enCzkLVxxj37iagZZf09y/kDqPKIxL5xetEO4Lm3zoHuRdGAZ2qCbMGyDD/8OrP0+3bzAPYtVO9M0UcUJD6/h/S3JIx59vAFuANT3NNq19V5X1yOUbLz0zL5U85SurwAIeieznza//rryUxPAqsj6DwgiTsiEMyUTCiCpPTzEAb6f4z1B+xvD8uC25Xk9+/+bI7B4/uwa7RLFiyHhczUXcf7KaXkjvBNhf8BpAemJLsyD8k8w8KBLuXWvz9RS5U7ulFPI1BfgMlXYAB/kdIBnDZQucNlNDmdcdOwZSFfMhjfQ2h04T/CYFp6818Jj5GTN2DFwyk+HiKhJ32s4J20NO4qMIPaPqlNd77Us1JcfM0GH+/Krmrr/x/8l0H+zAWc2oQ/YGJRnXuQL+af2A6YUJmY7ST5t9tvVEPqLsLJrCcLDYq6vhpytZSwM+47HhoUHepvJ4LiZjMJ72AggNXpB/3+cW5wrw8dHpXpi9TsoZ16QEYMvP9WEvDX70QYL4tkGpf0BoI805zggEgl7nZSVCJfV0kcdbDsSfONJd/MGUUkeulRKENE/DNR4Y596HGksvIk2BcQUeSmDzwWzDkdW6vbiki+mIlIw97or2Qhdpd9aNQUGAencvoBFHfLeIOlJKqRqSphPR4kka+8ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5192.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(6486002)(2906002)(8676002)(8936002)(66476007)(86362001)(66556008)(83380400001)(36916002)(26005)(316002)(4326008)(186003)(66946007)(36756003)(2616005)(53546011)(956004)(5660300002)(16576012)(6916009)(44832011)(508600001)(31686004)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3M5L2EzaHhNMVM0VEdwRHRPb1pwcS9iYWdTU0U0aTN3N3VkdnBuaHpQcUdN?=
 =?utf-8?B?dlpqSXBwcnM1ZUF3MElxaTUrTEtzaDM5QmwvVW5xV0p6OFVEdG40U2NaNVY1?=
 =?utf-8?B?QzZqQVp1Vy9OdW5IUzNTLzI3TTRKMzF6SXdvQkRFdmQwWmk4bGtDV3B3OWZs?=
 =?utf-8?B?MU1JV1VkNFh1N0V6UnRUKzNKZXJpbG9BZ1M4L3dWb3I4K3NXTmRzZUVMTitj?=
 =?utf-8?B?ZVdpQVUwaUpEMmFIb1piWUpVUFA0R3Yra3M4dDF1SWtQaWl0dDhRR0FOMHQ3?=
 =?utf-8?B?L2RJVTZ4dHZjczA2TzBoTVBKMC9SZTJLRUpRL09INkk1WjJ0b1hLYUpSRFMw?=
 =?utf-8?B?Zksxem9wcGxCMFZTOVR4YnBZRnZsVmlmaldIR0p4ZTZCenNMNlpHRzd3Sjl3?=
 =?utf-8?B?a3FiVzlyNmRLK1V4dlhjdWNwbFN4NEVRRmVLT0FuSkRRek9naXZLK2dHdUQy?=
 =?utf-8?B?b0Y3cXI3TVhySHVYc3dvaTdSaVhBVGFQTW9qa0hSNW9jZDZSZjN4RVNqMEVG?=
 =?utf-8?B?VUc0V3YrSC9IWHBESDFIR3o4cmxPK2pKcU5iN2JqTEMvM1krNnRaK1NsYmxl?=
 =?utf-8?B?NFo5MnIrUW9pQXFnV0NQS0p6YzF1VGI5M0tmYnVpQXFHbHZUck9ES3VQQXVn?=
 =?utf-8?B?cEJJckJsZEpjZjkwOFlONnBsM1J3M0NvV2dyRXQwTlpsbHBhR09BdTVFQmd4?=
 =?utf-8?B?YlJyaldFT1M1L0wxMUY0cVlFcTk2RGx3QjR2aVZBN2tSY2pDZjBQeVRXeDFp?=
 =?utf-8?B?dXZFSGs4RUhUdU5CMWZoT25ma3Z3WFBnTFM1OE1hM1BaeEc2NUMyMTdMNVpF?=
 =?utf-8?B?K3YvTFBjbHZiaExTeTl4cStrd01CNUVhaTBoM3VjZDFtdWRuamlCVkQ2a1BY?=
 =?utf-8?B?ZGdGTTYxQnVRZVNLalluN3RYSkdaNU5uQVdjZXlINVdKVWJTVmluNEtOQTFl?=
 =?utf-8?B?ZzNmM2hXZlFkQmI2M0xLanRwNkptL2ROVE94NHV6MDVXNVowRmVRT2twUDBh?=
 =?utf-8?B?blIzK0NBM3EvaDd6VGtKVzJkN2tITFB4TUJ0T1lVVm9meVJCdWwxS1hmdW5V?=
 =?utf-8?B?VFdFRER1VU5jZVJObHZhMXZxa3JHcDJwK1MveHk2bUxUNkxaMk5sb2RpZ0Jh?=
 =?utf-8?B?SHgzNWVEMFdRUUhsMC8yNmNkNlMyVUdkYVl0VFZkUFF2Z0IvV2FoWGpzK3Fj?=
 =?utf-8?B?aTFheC9DeXdJcHpkRHRxQmJzZ1BTVnJhbFlPbFF5bWtDTTdhNjRmQmJsdHFq?=
 =?utf-8?B?SkRtb0UyajlUNFZ2UUxVZlN3eWt5TkFnSGxCUUI3em5FLzFtQVFKSnRxM1FO?=
 =?utf-8?B?QW9hTWNOdE9IUWQwcVg0WGZHSXM2WGJ6QitqeGI2MllBZHVjbFFDbTkzWENC?=
 =?utf-8?B?SGJrcFdad2d4ZzZ4aElqQzF6ZU9sYmtLYkx0WU93b25YbEEzYXB1aEtGMm1N?=
 =?utf-8?B?TVVJZXFua2cwTEVXa3JtN3J4S3B5Wkw3eXltV1Zydmw4ZHJFL29nQWVwd2Vj?=
 =?utf-8?B?Qmd0MzZjNWtGd0ZzcTlkcVhKbVNXOVpLb1hCSXVta0k5b2F5Mm40Rk9uTm1n?=
 =?utf-8?B?cWxEZUgvYXErcTJ3RTZMekVlVTd6YkNMM2NIcXhrV3NyM1NnbTFESkppanZL?=
 =?utf-8?B?Yk1oak9vQnEzNnp3b2pKZXcvR1J5MGdscVE3a0N0QzZxNzdYbjFWL2pLQ2Ez?=
 =?utf-8?B?ZG4zOVJSOEs5VlJKWkU3MXg3YTg0NUdYdkQ3Yng5QWZRUS9XWnhKcnJibTVY?=
 =?utf-8?B?Qy9uY1RmejRLQkVzekpXTUUzalJBUEVRRGpkSXQzZ2M0aVNUSjU3RzdsL1hw?=
 =?utf-8?B?TS8yU3Q2ME1ENHBLSDZ1RjRWMDBsT1JSbXNoUjZsdWpadjlpSEpIQkZhWGVa?=
 =?utf-8?B?RzNTWEZ1TVZWRFlicEptN3FvcEh0d3MwTEZWSmg3MjZzZVQwMXc4ZU9XVGI5?=
 =?utf-8?B?VnZDOXNWMkxVcCtZYWNoSlFBMXV0cXdyVHVoQ0EvSGtXb2poaWRIZzhxWjJW?=
 =?utf-8?B?SGp0NVlrTVdCNTdBV28ycWRhVURaQXVib3RuREJRY1RsR2pwZUp5RnV4SVBa?=
 =?utf-8?B?b01WZUd0azk4cTFXSTJ5LzFrdkNjYkwzdHpqeTlBSTdSMUhUS3Rqbnd0NzNI?=
 =?utf-8?B?bWFYSEt4SjhnTnZsb1M2d1pXNVB5S29tMWdlQ1o0a3hhdnRoblNUd3d4Z3pU?=
 =?utf-8?B?VVJEMFFpZjZ4NThhbGNmSnY3VVQ1SW9SQnNmeXBrZjFxMmtYVmxqVi9zcXVY?=
 =?utf-8?B?UERQMG4waEV0UWV3WXk1U3dGQzJnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e9a1e0-8e02-435d-69f2-08d997ee5bc2
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5192.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 19:33:44.8119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5GeUMXHQglKYQdCggWaZSpiEgShIQw5K4UiweOw21p1p0T8LFJWUi3DbpIBzOMCXpsi2n02vUqVh52VVqv64ibnifEU0Fs6i4/AIgMT6NPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5224
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10148
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110250113
X-Proofpoint-ORIG-GUID: Ldxuk6w6NSXvSPc3tf4q1-VAX6E36Ukq
X-Proofpoint-GUID: Ldxuk6w6NSXvSPc3tf4q1-VAX6E36Ukq
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



On 10/25/2021 3:07 PM, Greg KH wrote:
> On Mon, Oct 25, 2021 at 02:01:30PM -0500, George Kennedy wrote:
>> Do a sanity check on pixclock value before using it as a divisor.
>>
>> Syzkaller reported a divide error in cirrusfb_check_pixclock.
>>
>> divide error: 0000 [#1] SMP KASAN PTI
>> CPU: 0 PID: 14938 Comm: cirrusfb_test Not tainted 5.15.0-rc6 #1
>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.11.0-2
>> RIP: 0010:cirrusfb_check_var+0x6f1/0x1260
>>
>> Call Trace:
>>   fb_set_var+0x398/0xf90
>>   do_fb_ioctl+0x4b8/0x6f0
>>   fb_ioctl+0xeb/0x130
>>   __x64_sys_ioctl+0x19d/0x220
>>   do_syscall_64+0x3a/0x80
>>   entry_SYSCALL_64_after_hwframe+0x44/0xae
>>
>> Signed-off-by: George Kennedy <george.kennedy@oracle.com>
>> ---
>>   drivers/video/fbdev/cirrusfb.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
>> index 93802ab..099ddcb 100644
>> --- a/drivers/video/fbdev/cirrusfb.c
>> +++ b/drivers/video/fbdev/cirrusfb.c
>> @@ -477,6 +477,9 @@ static int cirrusfb_check_pixclock(const struct fb_var_screeninfo *var,
>>   	struct cirrusfb_info *cinfo = info->par;
>>   	unsigned maxclockidx = var->bits_per_pixel >> 3;
>>   
>> +	if (!var->pixclock)
>> +		return -EINVAL;
> Shouldn't you be checking further up the call chain where this got set
> to 0?

The same pixclock check is done in these fb drivers:

arch/arm/mach-rpc/include/mach/acornfb.h:    if (!var->pixclock)
drivers/video/fbdev/asiliantfb.c:    if (!var->pixclock)
drivers/video/fbdev/clps711x-fb.c:    if (!var->pixclock)
drivers/video/fbdev/core/fbmon.c:    if (!var->pixclock)
drivers/video/fbdev/core/modedb.c:    if (!var->pixclock)
drivers/video/fbdev/cirrusfb.c:    if (!var->pixclock)
drivers/video/fbdev/kyro/fbdev.c:    if (!var->pixclock)
drivers/video/fbdev/riva/fbdev.c:    if (!var->pixclock)
drivers/video/fbdev/uvesafb.c:    if (!var->pixclock)

>
> What logic allows this to be a valid value?  What about all other fb
> drivers?

The "check_var" function, which is set into the ".fb_check_var" element 
of the fb_ops struct, should do the check, but in the case of cirrusfb, 
that is not being done.

All this patch does is add the same pixclock check that the other above 
fb drivers do.

BTW, this patch should also go into stable (specifically, 5.4.y).

Thank you,
George
>
> thanks,
>
> greg k-h


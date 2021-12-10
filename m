Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EF9470397
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 16:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE3E10E775;
	Fri, 10 Dec 2021 15:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035F310E775;
 Fri, 10 Dec 2021 15:13:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UebmB1x4EeLnfkT+LzS7YXxQFdM+nbJKxfpGczazavNj0H5K3KIkneRebgZtYxFPVGgiNubv+LQUHwtM4omNxNfYw2o6eALAfmLEUdr51I4jHhu1qQMCd8amXEX4skuJcENnrqD13wpzE9jomsPaFsK552PWxiYz+TixfjRwDEbgLckRlVweT77Hz+mxIolVeVTKQMTg7J55MX0Jq5k4SYqedMEq9SatKf+yHCe0nSSJ3cfVGz4s1IH9nCPOMc+DAOdbLz0/O/WGsZIOVx9ottquT6DDQrw8fi0+Qt9E6ITVrzAwYTGioukwXbEA+7VPc97NXbyziaC6dbRZhfIUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1uXPNOxd0Cpg3TH65Fd3Ri4kCHIDmPI5vY/hZv6q0o0=;
 b=VMyrqCZhz87gNsr/Rk3O8QOOSEfavhEHesxriYJxpZtnd9Bp0VGXGPMyh3t5+S8JfPjaAlY2kwd7T1MVsKNB9Gan6tWu1vVRy84hvo7o1FwkWhfSQ2RYYYQ7B+EjTCYfnQs+S0CcGpNddIyTzFOwJs5H3s/WfemoepHFXSaJziyfSo0bhG+lxXhLDsHJQzIriGf2KbyC+xiQDFNHi8mEOaOVl+CIC/6a780C7GLbzwTeKPA4H4vXEt5hTUo1mOpZRfaks2hYsEN9452NRPgSLMzZY8BmUyfOtua0otRbk5OCuGcda6Sk18cXOCoGUtclK1SEt87tFTDknwS9jKIRTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1uXPNOxd0Cpg3TH65Fd3Ri4kCHIDmPI5vY/hZv6q0o0=;
 b=o7qCrpN8bXMNmvMzeahszQYW9E3IXqt4AHJN9rdTKA4Ue4eSHSs0L7btf7uqBHRBEfpA5hl9BvdVExFfqiJhuUJ6NFlq3QpobtXXGCJyaUkQPiFDefzIeiioxhiPYwI5LHmUuIwYWq/EttC/ZvKyOI7q0WzNvfqlEPH2XGXNlBU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4458.namprd12.prod.outlook.com
 (2603:10b6:303:5d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Fri, 10 Dec
 2021 15:13:58 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4755.027; Fri, 10 Dec
 2021 15:13:58 +0000
Subject: Re: Reuse framebuffer after a kexec (amdgpu / efifb)
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <62aab616-53cb-ff9f-c5f3-169c547bd1ee@igalia.com>
 <CADnq5_O8x3_8f7GZ=tme55-QW+nqMJ2YoqvROjDPg2YZP2catQ@mail.gmail.com>
 <a1f4d263-b3d2-4ceb-8a89-948c8129500f@igalia.com>
 <CADnq5_N9ptK4c86LO77YcrF5_M==hket+L7eYjsGCaKbORO=ug@mail.gmail.com>
 <eaea0143-a961-b83c-3c6c-4d612cd003bc@igalia.com>
 <6d3c7acf-a23f-3073-56ed-375ccb8cc815@suse.de>
 <99b38881-8c63-de04-50f8-aa4119b52b25@igalia.com>
 <CADnq5_NqPEY6vPSsBQSst5Gsw-VpJ-sp-5DHMeB+EGA2t7KoAQ@mail.gmail.com>
 <56dfb915-036b-0584-f0ef-83c786970d6e@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d1de6ca3-11ae-af9e-a2fb-7bcb6fae01d6@amd.com>
Date: Fri, 10 Dec 2021 16:13:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <56dfb915-036b-0584-f0ef-83c786970d6e@igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR10CA0068.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::45) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:9f71:eea0:f459:9080]
 (2a02:908:1252:fb60:9f71:eea0:f459:9080) by
 AM6PR10CA0068.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 15:13:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3426b9a-761d-412c-c8cd-08d9bbefb08c
X-MS-TrafficTypeDiagnostic: MW3PR12MB4458:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB44581E13D22B2CC072077F6483719@MW3PR12MB4458.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uiGd3UBtdvcWkybwhWqu9nFmDIiiR1STubcOgm8Z0j8rbZAZJbV3P2/FJ4xqotmp9Li7pBhIvcHhhuFMDTH51vrm20VxAZuipIZ8TFkCXW3brQ0FV/ocKvoJBMF+OF8ecp44PPky0rP2pMLBVVCd+RRDU00YPsc6fIFqlA57kL7//thVPdmJWmu6VWec31KQ0I/6nn8EX5wgG1mpZGTs2KHowpwyEhJUeNMuw7Oayend/GT4wlicgnSIQTVWKeMPadNWQK2jXNUMj6ysc9HcXuRqevl6gdcyDM3o69BMBRO0Qibqsj+dKZ+YUNIfxFp8rNVY1yN7EfE1EUCXqhyclDkYWhMcnPqDLm/sZbPqEs/srqLr1zxB380+AAB23o/ff+SXGYTWNqg+ZGqVesKRXj5pAng5iH0YTIDtoo+bjzZz0NpJLwzWXzpfS6CrxLqp0VtOya/BnIHVaeaO0cxEr9weoryKAnU+KpoEMkJ1sCvlnH3r3UV9kG08/ZDJiWoyGhi98lQ1sC6Syz2XZLSmr6CDzz8830XAuwV3YEQpswYwFoEdU9Kw8UepWuCr0zRQ4p0MVvG0OlupiDlwJay+rC8soyTVYA6alaNqhUZdEFHD8WaoF3KHHqUpNQDkl9tPZ+iELs1oglIgwGI+s8syEyjFxrkqxVvfq0uZx7afVoKPOhMSnak74XJQyRJwqS37yfB6gW1xOdajGKFX08SdZt9n8cCVHGP6HP7Gt6UGyhpygiIXNhBwdIW6jp5q14I4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(5660300002)(508600001)(7416002)(4744005)(6486002)(8676002)(36756003)(86362001)(186003)(4326008)(2906002)(31696002)(110136005)(31686004)(316002)(2616005)(6666004)(66476007)(66946007)(66556008)(54906003)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S09HZzd6Mm9ZVXVhODBHbkpxZk50bUpsajNGazh5dk5JUjZ4bjhmUzFPa2dF?=
 =?utf-8?B?VlBpRTZTL2FxSExDeXJ5dWJZZHZmb0lHK1RZUWNuU0RTWW9EZjhNVDNtUmZp?=
 =?utf-8?B?OUNtOHUrVklDTEwvUDFMZEE2NEtza0JnMkdST0xqcFY3VUE5K0tVNkJuOU9p?=
 =?utf-8?B?OXBkUmpFZitUdDVyQ2hNL2RVSXpEUU5DOFRSSFdoQlYwc3U1VlRGa0FqcTVR?=
 =?utf-8?B?WllMS21lNEpKZ0lnM3FwVW9BM0ovTHUvWmNmQ1J1U09RWXZCcnIzUnlFa0wy?=
 =?utf-8?B?NTVhN3VmZWhwNFNiNlJmcU1uY3FmR2pNLzJEOU9GREVSbW5TY1BmMDQ3cE50?=
 =?utf-8?B?ZEp1bWwzUHJlTW9LQkcydTVyc0F2U1luMnVDM24yQlRWVEhEcG0vZVZyMkRW?=
 =?utf-8?B?Z1c0SkFRNjd6ZEVwak44SjdPZlNMc0wzeDZORkRSbE1GYVJOR0g1N3Uyc0FG?=
 =?utf-8?B?WTNsb3RCOUdDSy9SMmovTm1Zb2t5cmJ4TFBaenQ0UGozRmpGU2FUY3RIcGhC?=
 =?utf-8?B?SFF4Tlc1NWZHUXlJcWFXU3BueFkzSDF6Z1hlWWpOMjRhRS9yeWtQY3dMZFEw?=
 =?utf-8?B?b0N0b1dPeXpjOHFLYzBSczljczd0S2RiL3FBeVJNQjB0ZHhvSVdGMjFKSlRO?=
 =?utf-8?B?SEVHOWNKcldEbHRZeDdQR1diK0ZjbDIvTlpsUTNRSGtuam84S1hRUzhIZlpo?=
 =?utf-8?B?aldmaVY4RWQ5UXB2M1dKQWlOTWx1M1JHMldrY3ZRWmhDK3Nkb2doYjNjc0c0?=
 =?utf-8?B?RkRZcWtQaWFQOStIemdNTTg4Y3dveWR0NWc5ZzNQWThOOVFwR1dzWUpySjNX?=
 =?utf-8?B?R2x2WDdsc0JjdGVxZWpGcVZyaGF5NzVXdmRJOCtIYVlYeTRnbnd2bTNabDFk?=
 =?utf-8?B?dHpaWmhwUTJGR3lWSXZPWjZWK2JkL3lYa3J6MHZoVU5ibnpXMDRIS1FXMzhP?=
 =?utf-8?B?eW1UL1ZHSFpCdG80M0hJc2dkOTU3UXBKYzhLWElmNm5BbGc5NE5FZVhyWHdm?=
 =?utf-8?B?T1BsUk96WDZ1aTMzamlyWk9od3ZCVENWYlpjZXpVL2tpM2NYdEpwdVRQNERu?=
 =?utf-8?B?ZkFrLzZNWjZWVnF1SXNhS25UM20xUEpwVmVOK3BKWDlhcmdNMjdMZkNRM2s1?=
 =?utf-8?B?WVFRTGRVYllXWTdLQlNpK29nOXZRbUxMQWxnZGlOTUE0ZTQ2NDBOTGpPbEI4?=
 =?utf-8?B?ZjdDeDB1U2Y3S1N1TVp5Nldkd0F3aXdscFFJNFQwMUs4TnY1ek10RXVJM0lo?=
 =?utf-8?B?OVQxMnFUODg3d2kvUzVwYmFLUG9mQWJxczNiQU1CVVZxZ2JneEYzL09Eb0FH?=
 =?utf-8?B?enF5Um9veXNhWTRnSkFRY2h3cW5VMXJtSnRKZmtlbEhQeXJZQ1EwUDhJeEFN?=
 =?utf-8?B?QTBMT2ZNSWNxN3JHaDZMM095bzdVdnBhT0pQbFB6VnZtWkpReXk4RGFWRlhp?=
 =?utf-8?B?ZktSNGdRRmh4aFdOM3FkeFdXclVLckp3dVhKT2RnWEpjZUplTE12T1p0a3Y1?=
 =?utf-8?B?ak5IeWV1ZE1lQVFnZzB5T3FWWFM5cTFja0NzOXJacTVNeGhmWTJhVGxwUU4v?=
 =?utf-8?B?UkNQUWJjL3dNR2tyeW05Mm8vTUZEN09Yc1lOczluNGFhVVdRMkpmMnRqVHY0?=
 =?utf-8?B?VG5yS0VNTmxOQTVUcG03dU5KOWFGN21MK1d3RzV6WGJBMmw5V0d2VjJFNENF?=
 =?utf-8?B?MVAzN0NMeW9RZzBDeUo3YzRZQVY2THgzOUZEWldON0pQU3A2dktEQ3VmU1pN?=
 =?utf-8?B?TWlmdUgzd3BmQlhHcUtTdDYyL0hDZ1J3TXloYTJvM1MvVzBmQmQ4Sm9yQVdK?=
 =?utf-8?B?b0JTeXNQVHpJZ3NOZXg2MFp0S2NwVDg2L2FCbUFnVWQ2OGZVNjJWcFhCSzhL?=
 =?utf-8?B?dkZyWi9lbGxla29mamV3bVJ5UVFrRjFZZ25JSzZiUkpyNVdMbWFIa05mYllU?=
 =?utf-8?B?TjU2WkhuR1JkQUhVd2JWUTJPMXd6QnpBZDk0SFgxUjRBem45eVNVQkhLcmhq?=
 =?utf-8?B?SDl3UnVoWXpFUG5Vd1o0cy9YUWdNUkxDcFR6RDkwL3dGdW4rQm5aTG9WMlVC?=
 =?utf-8?B?M29ZeWQzSHB2cmRJbk16SlY1TWJJb0ZwT2d5bDNVbEFtdk5LdDZia3VpNGxQ?=
 =?utf-8?B?cHo1YUNGWW1JclRLbldKZzhyOEEwV1JZUjFBa0VPaGhWZU1zS3RMbmRLdEJu?=
 =?utf-8?Q?xKvZRbvqPhSFTllMi7XOE1c=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3426b9a-761d-412c-c8cd-08d9bbefb08c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 15:13:58.6778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNQuWmQRxqDgd/Gv2ovs6I9mR7J811rJz43cM9XHW+bHZrqLvM90fTUYRWNXrq8K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4458
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
Cc: "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 xinhui pan <Xinhui.Pan@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Baoquan He <bhe@redhat.com>,
 =?UTF-8?Q?Samuel_Iglesias_Gons=c3=a1lvez?= <siglesias@igalia.com>,
 kernel@gpiccoli.net, kexec@lists.infradead.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, pjones@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 10.12.21 um 15:25 schrieb Guilherme G. Piccoli:
> On 10/12/2021 11:16, Alex Deucher wrote:> [...]
>> Why not just reload the driver after kexec?
>>
>> Alex
> Because the original issue is the kdump case, and we want a very very
> tiny kernel - also, the crash originally could have been caused by
> amdgpu itself, so if it's a GPU issue, we don't want to mess with that
> in kdump. And I confess I tried modprobe amdgpu after a kdump, no
> success - kdump won't call shutdown handlers, so GPU will be in a
> "rogue" state...
>
> My question was about regular kexec because it's much simpler usually,
> we can do whatever we want there. My line of thought was: if I make it
> work in regular kexec with a simple framebuffer, I might be able to get
> it working on kdump heheh

How about issuing a PCIe reset and re-initializing the ASIC with just 
the VBIOS?

That should be pretty straightforward I think.

Christian.

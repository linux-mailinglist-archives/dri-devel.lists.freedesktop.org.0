Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E082E63427E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 18:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC1E10E1BE;
	Tue, 22 Nov 2022 17:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BED010E1BE
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 17:31:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WunQmkZ6mSl2iyEod1AzV2UG6bFDwvPCa7SNYXep4DkViXiEcGnR1cNx41tln76j5he6XmkNj/P2QHu/pwt3rx6jIzRnK4OO/BpSF2PyWQ7OCCStdXaj5IdJfH6/ysKyPvxFUUCHILqi7v113E6J6OkVmFOOqM/Zlc0bPvJfZkvZAmKNDA8N9bGisiDd9FrWcklflu1qR+adcBLPV7Ue+VXq4fXG4rCqxjV9mo62ZCzZ4fur29Dce8ovv8/Z0c3sjuYnjgK9M61XbCCJm/P8cFn3Tmz09gomljZ2cZdAeYk6WjqVqcKsABiJeH6RtQxJ8HHftcEnLlO6t92RqaTxVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ai+FWgwuvpBWzBoGcOsMbRgjs4faFTbx5HZRYiJbLQ=;
 b=Rnr78wwLDgyjGtiN01XEV8ROz48bB3qmFGMY8CfPkrL16wjOS5V1ZQkMKnMQBp77mOei8Y8H0dJ5Bz7t7ntWRR0gWtEdLrilukkyoJKFwjJ3dPevi+T71jTDOuw5wkbA8BYDglqlcfI+rxm8ie3mWWcvVNN7dheWRwqawBtSPhX6wuTw4NRFJh0F5DbGlS+6zXshXKL3CMxbgSNYKiucKK81ntOO2wWRa6nG2Rz6GJHJG/QqAFWMyqgKmcG4XTJSGOxeqSJYcbmh43/d5OTvBE6J7v1Z8I4ezDyWa1Xnkf6PVGn7Z8UqqxKiUawZ6/jdKeCuE63RClrMLpI0KRRPJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ai+FWgwuvpBWzBoGcOsMbRgjs4faFTbx5HZRYiJbLQ=;
 b=kuUHR7W4EiXSZZ/4SvifaIqh64MRsGZTrphpwjHjZFovfY4WPm/r9Ddpuux71kFa4oXBUpx4eE5dYjj+1j23jIpeQNOPoLUaAR3jCyFpeuwvjeTMIx/wIxXMHvkhwjlwumP3tya1uGWaXK+Zg7lumYNNw299j+X9VCw6GsBMcfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB5520.namprd12.prod.outlook.com (2603:10b6:5:208::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 17:31:54 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5834.009; Tue, 22 Nov 2022
 17:31:54 +0000
Message-ID: <e01001d4-19c6-0d16-574f-d980b8840ab8@amd.com>
Date: Tue, 22 Nov 2022 18:31:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [syzbot] inconsistent lock state in sync_info_debugfs_show
Content-Language: en-US
To: dri-devel@lists.freedesktop.org, gustavo@padovan.org,
 linaro-mm-sig-bounces@lists.linaro.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com
References: <00000000000021719805d692e035@google.com>
 <000000000000d5b3af05edc9d445@google.com>
 <Y3zh4naNB+nZ0YTd@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Y3zh4naNB+nZ0YTd@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB5520:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a67765-9cf9-40d4-79bd-08daccaf7288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ewEONUbGqBS6ABPEN54WZRz+ZmRp3QsG9JvY/jVYGgQNRokKyN3R6VEtwNzDuN5VT2A7KtLMnfD7agpLiEaGm6vUZ9NSvVfyE8pGse0r2D8qZltC6pGhHfAFNTSR1w17RbWAUpoIyLt43eKO2fPC6bHCtu2wURMxSgXTDuBxP2Zjlo8sNkgzA0Dirx7Aft8yZQZtT2L6BFgwwspB/4oJZWqPN6LKSczE4UfVAa6I79uGzehouiIWCIk5EL2JcWgTp4r1L3uekGqu4IBrPHfa6uuz6l8n2j/TV70Ff+rrShGo4ypAOLV/NWatp2XwHuM9TMy/oStqp7Qe7reTljwcsHEA0dtZjvL8LiKmccOe8GOD7z5CDi9PoTkROpIfmIpGkWXRwbCBKZcN0Rxi70FfgwUmo7LYSqM2Oz2kFkcwHuw9rQz7bI2OE0qWpq65gHyVcilaPPoLUbF/v3juUXJBVDGBmRU7KurPWd+MENsN19iR7bCjMn89Yc5yaZ6WreknXBwrpCyXlvRyAmwlozqC3bpepa1BVvQHcutt6L19YRDCG8MwRDCq/HBWN+GidSAmrsZ/ZJs+kZnuxTw0nOeV7uwqxPkxQQxNBqeU91car58SkpRYbBsbOoO0MLOVWxOFKKjT7bEoPxp/vZQtsXwtDMnpSbKWirSEez/qzQsGV0fZRsRYNHEE8ANiAPHDkiZED/hNOqKoo3GtCwdkofrZXBgQl+AoZ9cykdFcsraRYBx1cmqWidYnnGV/JpjQ7lel6sNoOscwUfsxSy/CcHKFj7j9KkvF8pzSfqkg3G/GdjqEjio0nHyFvdox8iGOoSFQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199015)(30864003)(31696002)(66556008)(36756003)(86362001)(2616005)(41300700001)(66946007)(5660300002)(66476007)(186003)(6486002)(8936002)(8676002)(6666004)(966005)(45080400002)(6512007)(478600001)(316002)(6506007)(38100700002)(2906002)(31686004)(83380400001)(99710200001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEJxVDUvRUpCU3pKZlF1blBYZldCWDZIRUY2azBKYVNYU0NUdlVDbDFhREQ0?=
 =?utf-8?B?ZkwxOEkydW84d2VoOWRORDQ4REdZV2xNRlhSM1h2a0dpUVo2dk9RUy9MMU94?=
 =?utf-8?B?U0pHU2N1UEhXNk45R2NYd2tPODE4UDdCc2R0eWhNb0JlOW9YOEM5UVlhSlhT?=
 =?utf-8?B?UFpzSEF5N3NSeFY0QmJjTE1YTWZRRm9VUndGQldOTWJwdTl5MDlOSW54VXZo?=
 =?utf-8?B?Q25LUEVPVUNYdUo0aStWZmtyL2ExS3VHRGtGOWlCdE51Vk1QeWdma25zb2Uv?=
 =?utf-8?B?ck9pUTNUNVNkaE04clJvUExPdUF5K2lhVXBwdVI3aEs4SGU4MmxlYTltVTlz?=
 =?utf-8?B?NTZiQ3ZkOTZXcENaWDdCL3A0U05wcjVFYW8wOTk3K216RHRJTXdyM1pPbTdV?=
 =?utf-8?B?MC9ETjUrNEMrSUZpTUpBakdDelNJcjlOSjRkSDVxWVQ4dCswM0RlYkdKU2Nj?=
 =?utf-8?B?NlFxa0pheGV2RUhZNTc1WlJCNkZUS3VtZmJtL3Avcyt5cmw4ZW5XaVd1VXBD?=
 =?utf-8?B?Rm14SkowYlRDOWt2cXBHWUZhb2tjaTAvMk4zUGN3NlBsS1UvYVdKSVducmxx?=
 =?utf-8?B?S1FLa3M0RFNoZWFiK1pWOStuSk9wc3ppbXhJeWw5RmV4ejQxSzNQczZTRlpo?=
 =?utf-8?B?NHlSdG1QZGpmLzJaZEtmUnV0U2hEbHFwUUl1ZlU4UWx6dnU4Q0FlaG04RzFp?=
 =?utf-8?B?cU1zdWY4ei9SNzd0MjYwU1YrZzltOTVKcEdQZ0ZXb0tZT29sS3NaZ2E1MzFI?=
 =?utf-8?B?Y2pmLzkwb3BuNGY4MTA4MWg0UC82YmExTU1WL2I0UnVrQkdGVlRvWll4ZlVP?=
 =?utf-8?B?enA3Y2VCWE5vUFFZNTdvcGpMdmhnd2tXclovZjI3V3ZxS1NZamlybzBDajdm?=
 =?utf-8?B?di9hcVpON3JidlNXa1pDTGxDcHFUTGJPSm5KOEp2dFhLYjNNSk5ISFZTV1Jo?=
 =?utf-8?B?MEVhaGc1bUE0Y3JqeGdUQmhYNGpXallDQnhmNXpxUlQzcXVaSjRNclZ3K3RH?=
 =?utf-8?B?c0syQ2VZTnc5QWFvNjdaWVpSRVFIcTh4VTBHT2FibU9ocEZMSGFVY2wydm80?=
 =?utf-8?B?anQ4bmx2dVBHUmFrd3d6VUpqanI3NlB3MkpldCtGUG0vcUFiRzRLVmwwU290?=
 =?utf-8?B?Tnc3a1Y1N0xSRk5xVEdIVUZTNVZRdHN6K3l1c1JRc1M2QnRUajNZTDJKVjBs?=
 =?utf-8?B?UXJiUHI0d0YwWGc0MCsyczJpc0xCWVcxWHJBeFBlYXR3WlRiaCtVY0lyRzJv?=
 =?utf-8?B?YlJwVUtZOTF4SlZzdDB5SERTUEludG0vRXZjODROd2RlVzhVQ0h4Y3VDcDU0?=
 =?utf-8?B?MlJWS2Z3MUxaa0d2M3lJRVp4eGtYbjlKUUMyT3VVTjZIU1hRRHJRaW44Zys4?=
 =?utf-8?B?SzhUT3NFZXExaWwralJQMTFOT0JCVG1LWWN2RnFKdUxXdWZEZU1GbTZoMFF1?=
 =?utf-8?B?U1VLWDJ2em5MdHROc0tlVXJZVkZDU21nSDJJVDJlNnU1ZUFkaE5lRWlCSUVp?=
 =?utf-8?B?ckFvV3RXVnFlS3Z5RWNQZjVqcjBxTm5rbDJDUUZ5RVNjNURaMkxIb245RlRS?=
 =?utf-8?B?d2ExblRiYldXWlhmdWMreWtPbjhvcGdrMkZaVHRIRjA1cDEwVS84UFkwZmdB?=
 =?utf-8?B?MTI4RXp1cDkydUNpZU5RSm9YREVyS3ZKNWp6YzFsZENMSHFzTTJBQk9HVnJC?=
 =?utf-8?B?MDgxUlJ5eUFteVFYRk9qcm5wSC9KQVM4M2c4Z1laL1N5eStKczVHYnJLbm1Q?=
 =?utf-8?B?Q2N5a09pUkZRb2oyTldMR21JeFpCRjM4VmhnTnZxWkczOE5ZZmFYbElnVkto?=
 =?utf-8?B?V29sNFZrQ0FIdWIyaUp4bGRWZVU5amFqN0tNRU9pWUFGeXBnSUUycFpIWUQx?=
 =?utf-8?B?QTRwWWxkb2k4UlVVck9oazRmS1JYdjBYa3Q5a05mck5XZldsalQ0N1h0dk5K?=
 =?utf-8?B?ZVNvRlh5dmVPa21rVm1Nd0hueFltZHBPZ21jQ0xjMWgxVjlxOWpleVR5MXBp?=
 =?utf-8?B?L0pLNUJxVCtpbTVTeHI3cWM1Mk1HcjJJYW5rZ3RNOW5BZFZXQnQwRW5ybHVN?=
 =?utf-8?B?Y2FIV1VTZjF4N0VVRE9tbkpMMzFjL3UwMi96VVZtZkU4aXlrQUorT1J5K1Ux?=
 =?utf-8?B?U3N4TGJ6WUE4b1p0b0FYbmttVXZEUDQ2aExjWHEzRE9zQUtOU2RyaFBkZ1By?=
 =?utf-8?Q?KLeXa7Ml01Ol77Ij+6iNIU+M/h0BI8XK97rwWZOJii84?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a67765-9cf9-40d4-79bd-08daccaf7288
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 17:31:54.1423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YtzjY95DZhbT3B2n5Q2g1UCl9+YjuuB02j05LwxnJs1mG0IOvGtquj6uAcDpNv0l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5520
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

Am 22.11.22 um 15:51 schrieb Daniel Vetter:
> On Fri, Nov 18, 2022 at 06:46:38PM -0800, syzbot wrote:
>> syzbot has found a reproducer for the following issue on:
>>
>> HEAD commit:    84368d882b96 Merge tag 'soc-fixes-6.1-3' of git://git.kern..
>> git tree:       upstream
>> console+strace: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsyzkaller.appspot.com%2Fx%2Flog.txt%3Fx%3D1670fb65880000&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C93106507f7994c3175f408dacc99034c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638047254866307874%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=%2BNj%2B3vZRTi6DhdOdNlQDG7GJN9u3IZy8%2FZxqHScu2Fs%3D&amp;reserved=0
>> kernel config:  https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsyzkaller.appspot.com%2Fx%2F.config%3Fx%3D6f4e5e9899396248&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C93106507f7994c3175f408dacc99034c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638047254866307874%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=qZpvAr44nbuFs3jvd9fggeVnMgAt7J5Izxa1GvoMDjA%3D&amp;reserved=0
>> dashboard link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsyzkaller.appspot.com%2Fbug%3Fextid%3D007bfe0f3330f6e1e7d1&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C93106507f7994c3175f408dacc99034c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638047254866307874%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=tTHNWwrjD%2F%2FddfRi%2Fe3AbwMw%2B7MPWoolWeZt%2FgnBa4g%3D&amp;reserved=0
>> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
>> syz repro:      https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsyzkaller.appspot.com%2Fx%2Frepro.syz%3Fx%3D164376f9880000&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C93106507f7994c3175f408dacc99034c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638047254866307874%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=bay5gePJjT3Nm4J%2BINtso1hKNPMUmfP6xActclfXqa8%3D&amp;reserved=0
>> C reproducer:   https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsyzkaller.appspot.com%2Fx%2Frepro.c%3Fx%3D16cf0965880000&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C93106507f7994c3175f408dacc99034c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638047254866307874%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=o5JlI1IDcmP%2Bd08wLRhyD5gUIjuPioMEyK%2FkH6m%2FNIQ%3D&amp;reserved=0
>>
>> Downloadable assets:
>> disk image: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fstorage.googleapis.com%2Fsyzbot-assets%2F031b6e68785d%2Fdisk-84368d88.raw.xz&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C93106507f7994c3175f408dacc99034c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638047254866307874%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=dAT5hGTqrR01QiyGbOHyWkBIvTYvsmGqLiPqXuw7vK4%3D&amp;reserved=0
>> vmlinux: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fstorage.googleapis.com%2Fsyzbot-assets%2Fcff5e66b90e8%2Fvmlinux-84368d88.xz&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C93106507f7994c3175f408dacc99034c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638047254866307874%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=bHMhF3kWMS3ZVbPs8z6mWewUlNBTJPabhhI58e77KuI%3D&amp;reserved=0
>> kernel image: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fstorage.googleapis.com%2Fsyzbot-assets%2Fe75525784a66%2FbzImage-84368d88.xz&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C93106507f7994c3175f408dacc99034c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638047254866307874%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=KFJD3fDW1Ppqla%2BPA6wY6NC3qSNrlCpnkhdqIDZGxoY%3D&amp;reserved=0
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+007bfe0f3330f6e1e7d1@syzkaller.appspotmail.com
>>
>> ================================
>> WARNING: inconsistent lock state
>> 6.1.0-rc5-syzkaller-00144-g84368d882b96 #0 Not tainted
>> --------------------------------
>> inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
>> syz-executor333/3645 [HC0[0]:SC0[0]:HE0:SE1] takes:
>> ffffffff8d295c38 (sync_timeline_list_lock){?...}-{2:2}, at: spin_lock_irq include/linux/spinlock.h:375 [inline]
>> ffffffff8d295c38 (sync_timeline_list_lock){?...}-{2:2}, at: sync_info_debugfs_show+0x31/0x200 drivers/dma-buf/sync_debug.c:147
>> {IN-HARDIRQ-W} state was registered at:
>>    lock_acquire kernel/locking/lockdep.c:5668 [inline]
>>    lock_acquire+0x1e3/0x630 kernel/locking/lockdep.c:5633
>>    __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
>>    _raw_spin_lock_irqsave+0x3d/0x60 kernel/locking/spinlock.c:162
>>    sync_timeline_debug_remove+0x29/0x1a0 drivers/dma-buf/sync_debug.c:31
>>    sync_timeline_free drivers/dma-buf/sw_sync.c:104 [inline]
>>    kref_put include/linux/kref.h:65 [inline]
>>    sync_timeline_put drivers/dma-buf/sw_sync.c:116 [inline]
>>    timeline_fence_release+0x267/0x340 drivers/dma-buf/sw_sync.c:144
>>    dma_fence_release+0x14b/0x690 drivers/dma-buf/dma-fence.c:559
> Do we need to just generally push all dma_fence_release finalization to an
> irq work to untangle this mess once and for all? Or is this not just plain
> old recursion? Christian, any good ideas?

I couldn't even figure out what exactly is going wrong here.

As far as I can see someone just constructed a timeline_fence within a 
timeline_fence which doesn't sounds valid to me in the first place.

Christian.

> -Daniel
>
>>    kref_put include/linux/kref.h:65 [inline]
>>    dma_fence_put include/linux/dma-fence.h:276 [inline]
>>    dma_fence_array_release+0x1fa/0x2d0 drivers/dma-buf/dma-fence-array.c:120
>>    dma_fence_release+0x14b/0x690 drivers/dma-buf/dma-fence.c:559
>>    kref_put include/linux/kref.h:65 [inline]
>>    dma_fence_put include/linux/dma-fence.h:276 [inline]
>>    irq_dma_fence_array_work+0xa9/0xd0 drivers/dma-buf/dma-fence-array.c:52
>>    irq_work_single+0x124/0x260 kernel/irq_work.c:211
>>    irq_work_run_list kernel/irq_work.c:242 [inline]
>>    irq_work_run_list+0x91/0xc0 kernel/irq_work.c:225
>>    irq_work_run+0x58/0xd0 kernel/irq_work.c:251
>>    __sysvec_irq_work+0xce/0x4e0 arch/x86/kernel/irq_work.c:22
>>    sysvec_irq_work+0x92/0xc0 arch/x86/kernel/irq_work.c:17
>>    asm_sysvec_irq_work+0x1a/0x20 arch/x86/include/asm/idtentry.h:675
>>    __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:160 [inline]
>>    _raw_spin_unlock_irq+0x29/0x50 kernel/locking/spinlock.c:202
>>    spin_unlock_irq include/linux/spinlock.h:400 [inline]
>>    sw_sync_debugfs_release+0x162/0x240 drivers/dma-buf/sw_sync.c:321
>>    __fput+0x27c/0xa90 fs/file_table.c:320
>>    task_work_run+0x16f/0x270 kernel/task_work.c:179
>>    ptrace_notify+0x118/0x140 kernel/signal.c:2354
>>    ptrace_report_syscall include/linux/ptrace.h:420 [inline]
>>    ptrace_report_syscall_exit include/linux/ptrace.h:482 [inline]
>>    syscall_exit_work kernel/entry/common.c:251 [inline]
>>    syscall_exit_to_user_mode_prepare+0x129/0x280 kernel/entry/common.c:278
>>    __syscall_exit_to_user_mode_work kernel/entry/common.c:283 [inline]
>>    syscall_exit_to_user_mode+0xd/0x50 kernel/entry/common.c:296
>>    do_syscall_64+0x46/0xb0 arch/x86/entry/common.c:86
>>    entry_SYSCALL_64_after_hwframe+0x63/0xcd
>> irq event stamp: 638
>> hardirqs last  enabled at (637): [<ffffffff81cc6530>] ___slab_alloc+0xca0/0x1400 mm/slub.c:3132
>> hardirqs last disabled at (638): [<ffffffff89f47e95>] __raw_spin_lock_irq include/linux/spinlock_api_smp.h:117 [inline]
>> hardirqs last disabled at (638): [<ffffffff89f47e95>] _raw_spin_lock_irq+0x45/0x50 kernel/locking/spinlock.c:170
>> softirqs last  enabled at (538): [<ffffffff814c1d03>] invoke_softirq kernel/softirq.c:445 [inline]
>> softirqs last  enabled at (538): [<ffffffff814c1d03>] __irq_exit_rcu+0x123/0x180 kernel/softirq.c:650
>> softirqs last disabled at (505): [<ffffffff814c1d03>] invoke_softirq kernel/softirq.c:445 [inline]
>> softirqs last disabled at (505): [<ffffffff814c1d03>] __irq_exit_rcu+0x123/0x180 kernel/softirq.c:650
>>
>> other info that might help us debug this:
>>   Possible unsafe locking scenario:
>>
>>         CPU0
>>         ----
>>    lock(sync_timeline_list_lock);
>>    <Interrupt>
>>      lock(sync_timeline_list_lock);
>>
>>   *** DEADLOCK ***
>>
>> 2 locks held by syz-executor333/3645:
>>   #0: ffff888021f8c8b8 (&p->lock){+.+.}-{3:3}, at: seq_read_iter+0xe3/0x1280 fs/seq_file.c:182
>>   #1: ffffffff8d295c38 (sync_timeline_list_lock){?...}-{2:2}, at: spin_lock_irq include/linux/spinlock.h:375 [inline]
>>   #1: ffffffff8d295c38 (sync_timeline_list_lock){?...}-{2:2}, at: sync_info_debugfs_show+0x31/0x200 drivers/dma-buf/sync_debug.c:147
>>
>> stack backtrace:
>> CPU: 1 PID: 3645 Comm: syz-executor333 Not tainted 6.1.0-rc5-syzkaller-00144-g84368d882b96 #0
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
>> Call Trace:
>>   <TASK>
>>   __dump_stack lib/dump_stack.c:88 [inline]
>>   dump_stack_lvl+0xd1/0x138 lib/dump_stack.c:106
>>   print_usage_bug kernel/locking/lockdep.c:3963 [inline]
>>   valid_state kernel/locking/lockdep.c:3975 [inline]
>>   mark_lock_irq kernel/locking/lockdep.c:4178 [inline]
>>   mark_lock.part.0.cold+0x18/0xd8 kernel/locking/lockdep.c:4634
>>   mark_lock kernel/locking/lockdep.c:4598 [inline]
>>   mark_held_locks+0x9f/0xe0 kernel/locking/lockdep.c:4236
>>   __trace_hardirqs_on_caller kernel/locking/lockdep.c:4254 [inline]
>>   lockdep_hardirqs_on_prepare kernel/locking/lockdep.c:4321 [inline]
>>   lockdep_hardirqs_on_prepare+0x139/0x410 kernel/locking/lockdep.c:4273
>>   trace_hardirqs_on+0x31/0x160 kernel/trace/trace_preemptirq.c:49
>>   __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:159 [inline]
>>   _raw_spin_unlock_irq+0x23/0x50 kernel/locking/spinlock.c:202
>>   spin_unlock_irq include/linux/spinlock.h:400 [inline]
>>   sync_print_obj drivers/dma-buf/sync_debug.c:118 [inline]
>>   sync_info_debugfs_show+0xef/0x200 drivers/dma-buf/sync_debug.c:153
>>   seq_read_iter+0x4f9/0x1280 fs/seq_file.c:230
>>   seq_read+0x171/0x210 fs/seq_file.c:162
>>   vfs_read+0x25b/0x930 fs/read_write.c:468
>>   ksys_read+0x12b/0x250 fs/read_write.c:613
>>   do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>>   do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
>>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
>> RIP: 0033:0x7f7cb1bbb049
>> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 b1 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
>> RSP: 002b:00007ffd52951818 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
>> RAX: ffffffffffffffda RBX: 00000000000f4240 RCX: 00007f7cb1bbb049
>> RDX: 0000000000002020 RSI: 0000000020002200 RDI: 0000000000000003
>> RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
>> R10: 00007ffd52951290 R11: 0000000000000246 R12: 000000000000e32c
>> R13: 00007ffd5295182c R14: 00007ffd52951840 R15: 00007ffd52951830
>>   </TASK>
>>


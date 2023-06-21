Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B548738292
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 14:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9712B10E0D0;
	Wed, 21 Jun 2023 12:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2059.outbound.protection.outlook.com [40.107.95.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9446A10E0D0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 12:05:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOCrwhZymYY8rooExVpQ1E3DyFm1F4xjoHCTJRsHfUnh+kGI8eMrItDded2oIscDHq10WioVOUkUY5+3cvBt1adHoYTP/kXcvghbomKauZxe7D07MhcOSvCV/C2+WKTulruBZqRl+hy8jL8hGTAKYAdN701iZJQKtLJyL5foY90toDZXjyIhikaEgzFksRa4CJxjut29RE9jUhTShI+wD9cXxfQSYfIAvYQHNa8tbz+Wtxhlc0LXF/DIaFV5YjcWfzkfAH3E4p2LZ5Vrobok044RWjUg+k07G++c2cGYfkF4Aw4XCiYtjnb1ZdJd+kNQmkiFaOI6H2/TFigaqaQfXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsaWs3hSyg7E/YiXYs6vqEwsHnb5yfuEG628FmNcbzk=;
 b=i6o82ApjMVw6N9cAy/q7GAgsDmbCk5ohBkN2J4yBhHj+G27n7H7yPPVStbY+JeaegfJ53ggHjQhh7zDHqqSAanyT2FerX1Fpf4GYELm9EWM3CBaXAlK0+vstnzhP1VJ1HPDHKD+Oj3nvtkZdXEc6ctLszr9K9Lfqp7fINBrLvhzTdpzcKvGb2XmEZOBImAc/h7C/FK9lxEV50cSbQo0an3kO3Gq8rb0wSojFSXb7MRtoEjFE3GobbfCoiS4WggRmgApD7jd0KX5DUrt8O0fmvddk3RLIoLyidCpWP+XdFNlxya2RrlUygNEipJlqiwPU0bbhK0qfDJ8VaFU9iNynPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsaWs3hSyg7E/YiXYs6vqEwsHnb5yfuEG628FmNcbzk=;
 b=D/Ik5Bo29HDSfmWU6q+J10IjoakfrmDgj1BwRpIvS4jW67C1NqV34luqS0iUVKdcvMvntze5oqipVB/zh4ftf2bakENmbU/mYzcQRaOwysGEFq+iEnX7Ihm6vBUF4wP1+a6pufkw0+4IYm0pQCGmnKRsa0j+FWdU3Eo59xdBEgo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV2PR12MB5822.namprd12.prod.outlook.com (2603:10b6:408:179::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 12:05:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 12:05:12 +0000
Message-ID: <44be4e13-a157-35ec-6ff7-e3a0fce057e4@amd.com>
Date: Wed, 21 Jun 2023 14:05:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dma-buf: keep the signaling time of merged fences
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20230621073204.28459-1-christian.koenig@amd.com>
 <2023062140-bartender-closable-9fa9@gregkh>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <2023062140-bartender-closable-9fa9@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV2PR12MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: c3963c21-4fc5-4626-750b-08db724fc42a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g0QSPHQjNA4zDIOWKfMaIQTPkeO4YuLxwevG/8LFcdORcYbl6mT0lqSMzR+HtFo4vx+/8ttU+gAvu/WMF5FjjfYf+ETKm+wqcW2Qs3OXmXoWjrUysvMoE1Z75G65y6YunH0mmodHgcKbtlbTkkoeKLQOMi3rwZWYatkJHHvEUvrhqiEBSGQuo0N0GQM6B/0rlMrP7N3x3+t7ZfJfUh8hbEfDqXvpmBH4MWx5ky2aeamiJseAAMp/SruRLCKBd3YrkWQIOuicAQ4x+T0q72wzAckI/apnzsuDqyQY8UFIIHXFXtvkxoyhMsHJmmtr/ihtHPYzivxX6n67vXBN+AA49IsftbsAaMfMO8B9OMOdPyMR3LGgowR2tD5l2rUmL1iBtNpChFdh/nHX4Qykxja5/QQIdCYGR58cJJ7cwUkzIoXGgR9s7HIsfwzALW17JGafvf2fLuS57wgZ5K0Lar+vmc7UvXRYUnM5rSh7F5kTlOqPJph7xkk9Txxvw85fO6ZMTzybxdZD8n4BrtD9RwegTol2W0UVjqkHpo7Un/h/JCRfoUPB+fAzZVgl2Agp4wPGEQw1kouLqXJ7xtOx4VigL9xsYOc3Su8gAjDya7aLTwVAMXj8GRldgNtUdYGBIG06Or2tLYpBgscZOazVeuqYQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199021)(4326008)(110136005)(478600001)(6486002)(6666004)(38100700002)(36756003)(2616005)(86362001)(6506007)(6512007)(186003)(31696002)(5660300002)(316002)(31686004)(2906002)(4744005)(8936002)(41300700001)(8676002)(66476007)(66556008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3FPYVQ0VXNaTTBiWTlGMVdhQTdkc1JYdnF5clJXN2JpOUF1eldDc0NYMjZN?=
 =?utf-8?B?bDNSd29idksxNFhjOWs5cURyUWV4bDZ5NkswQ2hjV1RoMVhNRUFVbElSZGdR?=
 =?utf-8?B?TFl5S2dLN2RlWWtibWx4NE5VL0JackdMTEhjeWhJWmE5SHRjbytsWkFkUjlu?=
 =?utf-8?B?NVJrcml4TTF6MEtINm82M2VMVzhHWjZZTHUzaFJucDcyRm1YQ0sweGxuZldI?=
 =?utf-8?B?bnBUcEgwM3hDNXgyZjVCODZhTVVHYlZkd1pkalI2eU1ieE1hTjhhaEpVd0Vq?=
 =?utf-8?B?TkQ4NmlqRWZmNXV0VFVSY2xhN3p5RkJmVG5hQmVZamNFVXNoMUVVa3g3QW5l?=
 =?utf-8?B?STV3SVZuRnBoVk1HNnZDK1JmRXZJZVRJOGI1RmtQTEx5TnJXUXVkMXVjc2Nv?=
 =?utf-8?B?bTlaSzRzNy8rK0tzMGxtWEhXdjBJTHhibnkxNVc5QU1peEp2UjkvZUhrbEtz?=
 =?utf-8?B?cFVYK3hlbGx3d2s3akZOQ2M0RkgzNXM1em43Sko0K3M0U21SYWNEZnQ0NUxq?=
 =?utf-8?B?NUlGcGYya3YyNWxLcDRkQ2V2MDR0cnowUTdtMVJyUDZlVHJpVkxqU2xKNDhJ?=
 =?utf-8?B?M1ZvRUpxUEx0UzhqeWQzcTgrVHRTYUhJY09nZEV0Tkp3UDlPcEVuVzlYd1pO?=
 =?utf-8?B?SHJFcFFkYnlSVmlXM1VmdmxWaGFpNHk0cUtnOTljZCtsM3BnUEZTY2diM21F?=
 =?utf-8?B?TFE2bDZiTmUvVGhnSGxWM01DcG5jNE9sY3BmVnltVk9KNWFSNGdna1A1bE8x?=
 =?utf-8?B?OWQxc05JVDc4cTVzQlNaSVBOaFIyUkZhZ3lDRUVBOGR5NjZrMk9xUXpJN0pJ?=
 =?utf-8?B?QXg1b3BUOWZ6ZnYySHdqTnJrM1VuTmZKYWJKQUcyanZoZXgrWkNkZExSMkxY?=
 =?utf-8?B?T2Y2Zm53WDVpWDcwMjloeTZOclQvRm51VStXZS9NcitOOENBTFlnODVQNkx4?=
 =?utf-8?B?OXFnUEJ6UnpVa3RXclZGVzBuTGxIZ092M1lNTFM3dUIzdmc0VEtOdWJqMERa?=
 =?utf-8?B?d1hDS3pZdlVLSnlPMTJJWjlhaW5SNUE4b2xZM3YxZzFwcFp3MGVDZEt4TER3?=
 =?utf-8?B?UVhPdytQanZYKzZtbjVmYUJUTnFpdlR4Vk1tNVE1dFBxcWNCQWlsMG1GZjRq?=
 =?utf-8?B?MXgvc2dGeWZKVHlxWGhlcDVPK0ovS004ais0ZUFsVjRld3kyQjVHTnFBTXcz?=
 =?utf-8?B?VWIzZDdHQXV3aG13V1NSc0IwRzROZzJpWUV0c05TblVoSXF6TEhaaGY3TENq?=
 =?utf-8?B?b29hT1lxT0NNR1pqWXJiNC8vY3o2dUx3MnBpcmQzeC9JMW5UWGNnZGlSeG9w?=
 =?utf-8?B?WHQ3dkwzTmtJUmhsb2Y0WTllV2I4ZFV3bzNaeEhJVDRhRzE3b2VBcGdzTW9x?=
 =?utf-8?B?OGtJM2RydngwNlNhK3d4WUh5SE02RkZCdEQ3WE1iRnB6dXB2a0lobGxSOHh4?=
 =?utf-8?B?Zi9MRTIycVdxY0RTNVdQN0U4ckVEMEdDNkZkT2d6NUZsalhkTktnbUd0OFF5?=
 =?utf-8?B?aXc3Z0JyOGJqMzNSMUkrS3hxTTBZS2RDeFJFVFF2YVdHR2FtRTR2TzA2bWtN?=
 =?utf-8?B?am9NblZOaldPZDRVckl5N3IyOGdaYzVwS3lzTzMwRmtDaTNQMkdZWXBucEw2?=
 =?utf-8?B?WGxEazJOaUdwMXpVMnhIN0VRNlhCZ050ZFcyT2hMVmVOUUgwS3Z2ZXlrdkph?=
 =?utf-8?B?enNNSUFaWldEakJObWFSR2Z1OGtvNjFuWHQ2QkNlQzRtNTlTamk1M1BIK1Ex?=
 =?utf-8?B?d1FTVk1xbDZhdFRTdFpiaTAyMTNyYWFkQ1QzY0lST0xHaXJSOGdydUhEcVRJ?=
 =?utf-8?B?VHU4TkIxYlc2UmRHSlR4TFFyY1hldWRQaml2OTluQzlTcS8zVThCeE9JZkx2?=
 =?utf-8?B?RlFmU0ltV1lRMTREMjhYZG5RVWYzTjJLUHgrRTZKQVRZVEJUUCtzU3ZyYTJ3?=
 =?utf-8?B?SFhnaDAzNEtIREF6WVc3UGlLZzhsbkZLdmhwREk5alUrMU5XcC9oU2NCSUMr?=
 =?utf-8?B?eVNnSG4vM1hiRWFXWXg1ODJaQ3M3S04rNjF5VTlCVFhRaHYyU0JIQVNhS3RZ?=
 =?utf-8?B?eXVtYllOcnZTMGZETjJaM0c0bEZFSU9UTUV5b0QwVXhUa3FaeHdlWGc1WFQ3?=
 =?utf-8?B?anhhdS80cFFlSnpxUDhVbEFGTFptM2FNNStJb3FhQXltYUZnS3Y5NnVZRjQ3?=
 =?utf-8?Q?PQdJgpw7URazEgnZke4ylA5j/aurZ2dT/BpD8AQmlzG7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3963c21-4fc5-4626-750b-08db724fc42a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 12:05:12.5042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTKLWCH2q5XegdM83iB1F3Rnc6b7uADIg82oKoHwT5TsQ/fl8kTBr0m44PtfQbDe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5822
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
Cc: juan.hao@nxp.com, stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.06.23 um 13:02 schrieb Greg KH:
> On Wed, Jun 21, 2023 at 09:32:04AM +0200, Christian König wrote:
>> Some Android CTS is testing for that.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> CC: stable@vger.kernel.org
> What commit id does this fix?

Sorry Greg, totally unintentionally send this CC to the stable list 
because git wasn't correctly configured.

The patch is still under review.

Regards,
Christian.

>
> thanks,
>
> greg k-h


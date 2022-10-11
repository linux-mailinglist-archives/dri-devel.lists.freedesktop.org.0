Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2C45FB222
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 14:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0329010E2CF;
	Tue, 11 Oct 2022 12:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2083.outbound.protection.outlook.com [40.107.96.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBE910E1E3;
 Tue, 11 Oct 2022 12:10:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hA+mN0Y3l1Ol8JLMQHJTJmz7G35FpWoHNTbUj4ODIXdbyer3lCb2KVSPekIYCcoFx5g3iLQexzTpGg8ZMOHqvSzcKRVg6NSDUZE/+41SZZwu0suSyBsCboJlKIzM8njoZfAvhMUxj/pjeyK+96gca2N7i3h6O0dkCclVycpbskyyHliOm5srr9C7MoTPHmVNgCW0j0GkRBT2Jd9TqBwkILaPOxJ0Trl701l6I0g9L982x9ZPp9pWdVwFuGy90puUqpK4D0ydcPyCHRhESg/1nwO/k2zLhnpZPEuoygfFdWZh2PwnYbo0pFbrdAmvCndPoozt42qQUDIsdrLOWF47iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTd6UD77VmjhNWSRqUclLGntGZ6uV6B/lxeeDDWgBPk=;
 b=bvqIhiYfsmL53+BG1SexPBAiPn9RbSfwsXOpEZYFR0qwQhsVcVbb4+Cq3Z5ZdkSoTXurmrXPnAXdUD0+xn4rOzzWn5Ch7HLAmfnSrEARTAnpnTIZiVwS+vPUzUvOLI/ap4Ue+akXeaoJPElvwyoJnTAU1+oq4TYdWGwA9Pyo5FzOsc+92vLXg5ZSYtkd/xHXhWO0w/xel+7eocJRImb8jQh023p0fsfYmG2gbXumyF/21fNcFOyQUyuADH0nh53zu/WU7Em0IukQqjg+WGCBqEsoaqtQonqUAKvs40PpD2u1tcB/S2IzJAMig7bcf7mbuwdkYF3e+zmsIx3yZJ1bjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTd6UD77VmjhNWSRqUclLGntGZ6uV6B/lxeeDDWgBPk=;
 b=ZdJn/v0+jFUE1wBZMb/nAnB/OyLdw09tvC35qzwZuC1iWUvopfk+XFfayWzHRZKpZhNPaw5y8yYDMHtADiJcI/eKzCWB9U8RMkiKpi4fI3KF31G3KpXME2Adn1i1imllRqgkckwL+xZluoSEjNIC47QU6HMvXgO5FwO8Mp8BeF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB5735.namprd12.prod.outlook.com (2603:10b6:510:1e2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.40; Tue, 11 Oct
 2022 12:10:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5709.015; Tue, 11 Oct 2022
 12:10:25 +0000
Message-ID: <240b0135-5219-b923-ac08-1ed574dcb901@amd.com>
Date: Tue, 11 Oct 2022 14:10:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH] drm/syncobj: add IOCTL to register an eventfd for a
 timeline
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20221009144001.161124-1-contact@emersion.fr>
 <09e87ee7-4500-df21-1e20-641303a67b5c@amd.com>
 <YlRyF1ugXQAIFNoNIuFRmDek7S85or_YpAz26fHKaaQIYeCB3RVGSjEaYhw6nI0iH_k6vDjPYeF6ekmVeEgUWyf5V5w4aMm8Z5oVPjGQKh4=@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YlRyF1ugXQAIFNoNIuFRmDek7S85or_YpAz26fHKaaQIYeCB3RVGSjEaYhw6nI0iH_k6vDjPYeF6ekmVeEgUWyf5V5w4aMm8Z5oVPjGQKh4=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0576.eurprd06.prod.outlook.com
 (2603:10a6:20b:486::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB5735:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b0da0d7-5ab9-45b6-858a-08daab8193f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qiFqSy7wAFWJY7IU7wI562EE6dsrO+sC/SS96kRn+2jVCnb1Ey9D5gPADqCX/63QPP6Rt4ohVWNzLeCpDQGy5AQp1Kms9uP7TIy3wmhPdars38/wf80pYKYBrjYRUvcIM8ujTQWl5Fk8DhGJWWHAH6oWs4QIy5ZDhsUeV3h0UIPif5NZ3RIZnWFtKZt766zRbzYtgSixV/XiFA5/D+CqAUPvAp0ifpny3cF/3XgHu9IUm3kf27WH5574I7Lf5AGJx8s/lQNFv214WqeOvv0liLqQoAraDFVp0dnu/C9XVkuVg9wxQrI2w/dvXPTjAS+lEquFibMY7dzscWkwBsjDwBVcZ+lXxEcVMtnkMYqbDPrVsanIRnjmR/ng4G1o/UYozKFwE7LRpW/pmywcKjHjV0iTag8IeqBcjH+jncn8ixLdU0uqihfOeTdT7GFxa4W8Jquo9l+48KUyvL8Ti+7iWDGiTfhI9Sm9rtzeUMRfRqOHdZkdOJG6wBYLMEe6rXLpa3YyFgf9u4SmJLu2rYBLCAhWbxTvstkNK628NEYKpeYjanTMjXgZ19eL1j/wjQsrW7gbp9RsUchgeZ9atiqcAJM3+HvEhanplf4V33na/zN5xSe3sTm7uQiZvIdWNo3wjbNeJIqVdTCxOlRMcwdHQQzoQtw2aAqS2kLkj4bMEBK0jYKXtWdzC012lHXuloSd+Fxkl8G692lBPXBV6Zc5e050Mryt4ZBzrUF/cseV/oev++bcOdSfV86a7diveaWYJ9GTanGFtO0JB3zyiUUPOXZCRSLoBWtfS9dOXZfSEuU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199015)(6512007)(31686004)(26005)(6916009)(54906003)(316002)(6486002)(66476007)(31696002)(36756003)(86362001)(38100700002)(2616005)(186003)(6506007)(6666004)(41300700001)(5660300002)(2906002)(8936002)(478600001)(4326008)(66556008)(66946007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ky9IcCtrUWMzUDJRQlRiVmVWaUowYnVoODNyYWQzay9mVEVnTmtZOVpCVEN2?=
 =?utf-8?B?SHliNEtXUEh2R1ppZ2FuSnFMTzJySDVmaWJLTkd0Si85TTMwakVHb1JRNjJJ?=
 =?utf-8?B?V2NiSzZJbHZiQVpMU0VZeVV0YWtPcE83U1Zkbmw1d3NhUklwVTJaZDUrQ3Jo?=
 =?utf-8?B?YkVnR3ArOGF6UHdueTVWL1AvZHFwOVZiTjFUZkdkN0VOT2gzT0oxNXBYWnpu?=
 =?utf-8?B?V3hxU0RWNFBxVFh3ODducjAvaGlEeE9yYVc4d1VqT2kxRmNjMDVxczVab2dP?=
 =?utf-8?B?cm83aXRZL2QvdXoxL3VCT3d3bFNRdmZ1OXJ3cUN3MWxyR3FYTEZIL2tidG1V?=
 =?utf-8?B?TU1pcmhuTS9mbi9Xc0pxSmJXdkRSK09IaURMODQ3K003Q2JyOVJhQjBDMlh5?=
 =?utf-8?B?UUtYM0VMRTZ6U3ZBbXFnd0krcHV4NmxuMDRKQWUyQWR3SDhDTURmN0xaMmlJ?=
 =?utf-8?B?U3EvUFBXaVV0d2JkM3JsZEp1VDZrbXNBaVBiK2hrTWNPV2RKZUY3SUNrbGJh?=
 =?utf-8?B?NkxhVWcxek54RXJZbVRoa2s0MTBSVXJ4MjBSQ1BxUjQ5SzNTcWw1dy9XQVg0?=
 =?utf-8?B?ZWhmMGlRT2pkS3FHRmxROGZWSlNkZVFma0FyRGxQcUtrWGVJSFBBTUt0S3Yw?=
 =?utf-8?B?QmZLTy9FclB3b0JQWHlYd3Mxd256WVg5S1JHNHlqdzQ3OTNBTzNjeE1aVGc3?=
 =?utf-8?B?SEkvcVhNc1YyN2NOYklXVkxjdjZycS92UkZqSXJDb3R6aWtmNlhIeHkzdWZ4?=
 =?utf-8?B?Q2xXTi9mNHZUSDRyU1lUMWNqK3pOdkI3Rml1YU5HbE9rN0NybDk3SkhmRmJJ?=
 =?utf-8?B?TEZWcFJEV25iNXBIV1FMc1pMaDQ0UGZaSkpaNDFyVG4yL0hDd2ZPd0pUbnJG?=
 =?utf-8?B?aUZxL2x6eXhmb3pUUVIzdDY1d3VwTkxZZ1FEUlRZL0hhSVlCV2FnbWN0M3kw?=
 =?utf-8?B?OWl4eFVhWmdZRTZlKzV5c3hyWnErNWduQjdMcmw3WXorN1ExZXUxZlM3b3JQ?=
 =?utf-8?B?SjhEdk9RWmVZdlFiWHRtT3B3TkIreFVlUjlGWGkyZW1JNkx1T1dFY09SbC82?=
 =?utf-8?B?bitqemR4YzZTdEdoallIUUdNWjZndUxqaGRmNUx0QUlDS2ZKbmtzQnBYNG1a?=
 =?utf-8?B?bDNVOGExa1p2WXdZa0svalg5N3dQTnBJd2F3TjdtZ0MwY3dQVDlGVTNMTmh0?=
 =?utf-8?B?eHV4UGJxQlA4bGY3OHhGeTJIbGl2YUdVZm9NTzZJd245M3ZDV29Yc3QwK2pC?=
 =?utf-8?B?MDJQeTdjMXFjeXFyWmpqK3BhaWZHRjhWaXlZUUc2dXc3UUdPMHdVc0JrMXFz?=
 =?utf-8?B?YnhzL0FvSjdGdFEwRC9MSnd6MEQ2YnVWQzZjY2FHVWRVc2ZVM2UyNGVQNFpa?=
 =?utf-8?B?emVBTUlkblBhS0c1bFNNUEh6clZXNkJQY0hxKzZhZW1tR1VwbXZBRUtLN1Ra?=
 =?utf-8?B?VjRHOGlsMzRNa3FJN1NmSjIrcDh0MGplRGwwRG1XNUt3N0Jwekc2anYrclZl?=
 =?utf-8?B?YWI2N01jWUo5K2hXQ0N2NnBQTlBBeU81KzZwc1ZnU1VNcjR2Q0NacnpWcUVo?=
 =?utf-8?B?WjRENy9YcnF6TVN1cFQ3SzlKcGo3akd4Yk5aWUtuakd0S0hTOGtkREFwSE1L?=
 =?utf-8?B?KzBNL0tnTGpYTjVYcFZqanV4aEZtMmxZU3BqbDdib24rV3ZwZG9lU2owS0J0?=
 =?utf-8?B?L21QOGY0VTNqbngyU0JiN3MvYzAyNjRHV0lLb0VJbUFVakFwRHl5dllGZVc0?=
 =?utf-8?B?L3FIbkFVWTBCRytxNEFad3plRGZLTmlFZDZFZDhaMDA1SlBBWnA4UWNEK2RB?=
 =?utf-8?B?ZDdaTk1HaFppT1hFcSs4ZmFFU1FidkFPZStwcVh2S0d3algxYnFjT3ZsbEtJ?=
 =?utf-8?B?ZTI3cDBnOE9YVnRMTG5Ub0J2NDJoMGplTS96Q0ZocHk5STNnbmRVRCtZU25M?=
 =?utf-8?B?YklLRlNMZHFVdUd3Tk01K2NlN3MzOHdnQURCTnZWSUdRRGtJZnpPNkN2VG9X?=
 =?utf-8?B?RnZuNG5tR1d0S3RVd1V2blBnWkJ1TEhEVUYzdmFJbXZyZ0JEK0dVbWhsQy8y?=
 =?utf-8?B?SXpHUmxkU1Q2dHVNZm0vRFQzRjY0ckIwNHlVVFZkWEpQT3VMZGJZdnhVckVz?=
 =?utf-8?Q?9eihUWiAfoXRiina1T8z54qG5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0da0d7-5ab9-45b6-858a-08daab8193f6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 12:10:25.0540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: afXdQmNtAkAWbHtwR/N0kf69wHm+VU3HTBYPS07MqvsG88i4Ri5SJb6QgXbx++Xx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5735
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, James Jones <jajones@nvidia.com>,
 wayland-devel@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.10.22 um 11:13 schrieb Simon Ser:
> On Sunday, October 9th, 2022 at 20:00, Christian König <christian.koenig@amd.com> wrote:
>
>> Am 09.10.22 um 16:40 schrieb Simon Ser:
>>
>>> Introduce a new DRM_IOCTL_SYNCOBJ_TIMELINE_REGISTER_EVENTFD IOCTL
>>> which signals an eventfd when a timeline point completes.
>> I was entertaining the same though for quite a while, but I would even
>> go a step further and actually always base the wait before signal
>> functionality of the drm_syncobj and the eventfd functionality. That
>> would save us quite a bit of complexity I think.
> Hm what do you mean exactly? I'm not sure I'm following.

Essentially we have the syncobj_wait_entry structure which is added to 
the list whenever somebody starts to wait for a sequence which hasn't 
materialized yet.

Instead of extending this maybe just completely nuke the 
syncobj_wait_entry handling and replace it with your implementation here.

Absolutely not a must have, but might be easier to maintain in the long 
term.

Regards,
Christian.

>
>> As a general note I think the name
>> DRM_IOCTL_SYNCOBJ_TIMELINE_REGISTER_EVENTFD is just to long, just make
>> that DRM_IOCTL_SYNCOBJ_EVENTFD. Same for the function names as well.
> Agreed.
>
>> Additional to that I think we should also always have a graceful
>> handling for binary syncobjs. So please try to avoid making this special
>> for the timeline case (the timeline case should of course still be
>> supported).
> This makes sense to me.


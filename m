Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6569147DF4E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 08:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AF610E286;
	Thu, 23 Dec 2021 07:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2070.outbound.protection.outlook.com [40.107.212.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D4F10E283;
 Thu, 23 Dec 2021 07:06:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHIQ6bES5Yp/nLYKp2NpcpYRchg2Pdf9wP++CJ+vlgPLYJgWhTy/AtXeqM+yNWLyToHJEtV5gY/73MDxxMSbHaNLrRXcEyzRBhEgWVi/f0j6MHGp9ahHaW+1sLe6McRH/mPvn6V4KjH75nry3jYvVF54dS+mY/yXKUE8m/BMcJ52UyCfseGdIkK2xNw9WWlLVairAVQsZBCMj0UJp+fa2ZpOtfhfdfPRygn5Ukc5RlT8XSL7zqwlnuputBx28ibiJ4sG7mRfJsX0LsSTgK+WSCN8JadkADAJOuOunElg6MB3Ch8jSpeoW9Owg+S84cWNkdS7MFNzOLnKaqei2YKL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABtrUFxQgOCVV1tm3sZZXHzsb2GiQx/EOQt72ynoOX0=;
 b=hebZlWDK8gHQn8wkquXiMOgW+t9c4IqnDPIWRNgYIGFb2Fy4pVgKkqm+z/1e9T/08auxW14yvpnBK0d0XEG9u7TTSwTZ8W65ZjcWOO9W8I0UOY8oelPBmCcQ658IriN4XqEwz+om2eEkBa/jIYzZp7Bo5BlMcLV0QtqMM7Zj5XrvqNJXlpRh+I1X1xfph1ZvFZd8BOf9rhuqVCYeLlElr10HwDPdEGT5gDb19LdZBoMJQkfS0fhuurI4b5Mk+wgMv8CrArKMa4crSSTMNM904Eu4IoxeFHGx8sBduL5N+Ims9q7nTJgrOlFdfI2eRsM7nrtxaHrsZifuMoHZa/9hpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABtrUFxQgOCVV1tm3sZZXHzsb2GiQx/EOQt72ynoOX0=;
 b=pg7yhcqFptO11C9ZhJ3M35I9hy0R4M9qKGdUhshu191eFvSRlJcT4wAjtUkh7Ugrr8jNLjiN5zmUYRBDNVFRF48PdYXGx5wBFwM3E2vpkT0T2ufQDIcguklFWKCfS+z9wQGM5OlCXtsfoXA7t52exFXuGPDIN9an6HUzEEDv28Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1838.namprd12.prod.outlook.com
 (2603:10b6:300:106::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 23 Dec
 2021 07:06:01 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4823.019; Thu, 23 Dec
 2021 07:06:01 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: Daniel Vetter <daniel@ffwll.ch>,
 "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>
References: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
 <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
 <58d61e47-3796-3147-db6c-ea7912d16902@amd.com>
 <de272de9-3f4a-db40-699a-41394cb699dc@amd.com>
 <cb5668d4-a13d-3b0b-442a-bfe1b3a7239a@amd.com>
 <000edeaf-8a89-ea4d-5b9a-2bd7758f675c@amd.com>
 <f00f2f16-f0b3-cb54-f88e-d53353bfdb79@amd.com>
 <f4527002-ec6d-5279-3b79-1aacb6cc55cc@amd.com>
 <YcBM3PMz7J90F3LQ@phenom.ffwll.local>
 <9d1030c2-2269-cfdd-bbb0-9c3d5995841a@amd.com>
 <YcOQN/l7W66W/X0f@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a5c769fd-7eac-2628-a36d-fedddfb7d398@amd.com>
Date: Thu, 23 Dec 2021 08:05:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YcOQN/l7W66W/X0f@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM6P195CA0005.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::18) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61035903-5a0f-4632-afa5-08d9c5e2ad5e
X-MS-TrafficTypeDiagnostic: MWHPR12MB1838:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB18383E15790FD806721AB86A837E9@MWHPR12MB1838.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gx7/0t4NkiS1S9SeXbBM+eQp4BFqIjGcsiCLe6zF2S6D+LM/QLVEA6ECFOZkFd+PWeb/yIbWSM2GahXErqGGuAtkvon0Fverb4lTFDaivViLZn7gulmtqCOwxcShKR+46k3FY4x9bxtYbOdQTlPzoJm7K8+aprpIXJT1e23r8igEogAreE3P+Ni7Nfe/x9uxuXnGmrxywbcKtiAu/XtZcKjS/h9GuQqX9XkdmvUH5y0UmwrCgClr4ZnHTm3YQuTAiannm5xbRwqyZ8EU5OJ1Qy7oQwaB4X7ROieBKmGLthWDcgIt9WeRKgxlxbO8TvIJQ3l6RjyhLtJonDq1ewabSELx/1RobGhzhb3LzEy+/X6oGgrlrJLjrnQejtKF/5MLgHwAWbMLHx33x+cvkb/7cud56OyrtsjtU9YTO9t+BrCYjdTPfR4mnpVJZ+/3qCOhe451KBrz0C3h7KmGTfZ9clQi0IEl1JgrRSSiDAysJ4MgHHpN5PbTlVBRMoTfVamw598tE+3B+vaaPT1BVQVcadNMWtqHAPMb+1tx5bseNtuZWrqA1RSud0IZPzZSMm01KcxNPKxcx4rL2/mOxx448ZgXPRFrtW3HF4k9dzs2ZnlGguvxk4PerT1Tfn5/3ntDenlnWwZQsVu5SudQ29q9aVYFGI+1Hc5EEil2R4qD8y7SofwQ8NAA7Czv7sWte4zt8mf+RwUO8CydNQGPl7A/1YOQ+6WTQo9P4lM0Ft1luv/XcumEk1mgdT9mL7N4nrzR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(5660300002)(6486002)(66946007)(6506007)(316002)(186003)(110136005)(54906003)(8676002)(38100700002)(31686004)(66476007)(66556008)(26005)(508600001)(8936002)(31696002)(6512007)(86362001)(6636002)(36756003)(6666004)(2616005)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHlTT1BWakF6dW84WlJzbEd2TUg4TElDaDFON0VEaFRpWWV5V2xCaWV5YWh1?=
 =?utf-8?B?eFlWdXkrYjJtNHhaVmdYajVvaWtlSTVnUkllNnpUZUhLeFljRlUveXNQL2Yz?=
 =?utf-8?B?enEzOFJGZ25ZOHBnZ0h1ZG1UQnZkb2RkVit5b2JFcExwc2s5SFRsVEFZbXNr?=
 =?utf-8?B?UHUrNW4wQVc0OUlTRHhPLzF0SHp0RWdoYUhRMUpveFRsUG1ER09XTk11dXNT?=
 =?utf-8?B?L0JUMU5jQ21ISW95QkdqRjJTSWJsQVNVNkxJODdsMHBIOVhvYm9zdGtxY1FL?=
 =?utf-8?B?SFdSRmluRzZFS1dvRkFZNnFyaUIvWjQ1bjdUS3I3L091bDNlQ1g5NHhrK0Q0?=
 =?utf-8?B?bFFKa1pNMDJOdzIzdmYyWFQvcSs0eEsxc2tPRlZGc1ZUc0V5Zk9vNGp1SlV4?=
 =?utf-8?B?ZDltRWxmOFg2dWJyeEt3NGMvM2VuUHkxOFlrZTh6VnFMNjBoWmQyZVJMZVBu?=
 =?utf-8?B?Z2c4T0g3V0ZENkVBc0dETnJXNVBnVDdTU0N2eVMwNHZaNDBxTWdjd28xd0VW?=
 =?utf-8?B?OGFBWGo3SW9DYUVXZGlZOUJmUExlSVlOaERZMGpyd0xZSkhZZU5yZ0FPV2Fo?=
 =?utf-8?B?WEt4NWFQZkovQjdhaytwdEZrY3lMc3R2SVJLK2dSdDczQTY5ZWdEUkI3MGx3?=
 =?utf-8?B?OGFFdSsxMzh1M1UzTFV3ZUF1amJ0YytrSzVCOVR5VUVlZENrVmg0UTVOMG51?=
 =?utf-8?B?V3RHRWR1bVo4WWM2QWg3TTJPRmNVK2xpbmFUU2tqV0xEdUVUV0x5cExaYUFw?=
 =?utf-8?B?ejN6bS8xdkRjWXErMUJ0YkJjWmZjVW9iOUt3d0FJQTZwV09Qc21XNnFmQWZS?=
 =?utf-8?B?cUJyWkJvT1Nza3FoRy9aSXJEaGZSeXdtSnpJYmVJVmdBRXI3bEhQTElzKzRH?=
 =?utf-8?B?K05ObENxbUcxM05Dck1ZMXptRUQ4enpaOUorNm44NTU0cDY1RVBWbTRnM3RJ?=
 =?utf-8?B?N1pBbzRGS3dLbE9DdEJrajZGMFpyeGZSWnhvZGZ5alJkbDRNYzR2QXZwUWRG?=
 =?utf-8?B?M0NzZE5WRWEyallGNWlwUDJoVFliZ3BOMWZadTNPRDdVSVE5UmpyUmlHdmcy?=
 =?utf-8?B?Y014WTNLQ3NCenArWXhZa1RyRWxWVHB6R051SXI3QUhKMnZ2bXdSL1A5Mzdo?=
 =?utf-8?B?RkRLeXpSdG9aN0Q1aUk5TzlRYXF6OEs2NlEwTUdWdThoK1ViSXQxZkNXMnBS?=
 =?utf-8?B?by8rOWdqMEJ6bDIybkUyeGtMVmw2UXhacURFakVQNS9KejBXQ0poTXJaVGhz?=
 =?utf-8?B?bVVpYldjTU42L2x0YVFIblJ5b3ZSUXl3QUtUZGljV0xjSTViQ3dmVVAzQkVB?=
 =?utf-8?B?ay9qMDJlS2lXYTg4NWp2WEZJa1dxajBtakdWN0s5NTF4YitEOEttR2c0WkU5?=
 =?utf-8?B?M0FlKzhCeHVQekF1WWx1d3NHZmovSUEreXBYcWVrVnBKRjRqK1NWZVJGb2li?=
 =?utf-8?B?MU51eCs5c0JkQTU5c2VVUVZidXljcTh1ZWMza1oweXRkOWd5TmJRcFhjSXhZ?=
 =?utf-8?B?Vm80aUNBclR6Wm40UjYwcTBCNStDZGhhV2gyd1FqSzBjUDdQdzNPSXRWaFBB?=
 =?utf-8?B?ckZpYVZHSks5Y1V0YWJRWjNoYlNvL09Ja1h6SXUxcm5kSVgyOTFUZ0tvSnBv?=
 =?utf-8?B?YlpIZTF2b1NWVUp4TnpkL2lLWVFLNG51OU1xbFl0VDhMbFptZ21XTFZoNklx?=
 =?utf-8?B?RDhkdkNWR0FGakxKc0ZFYUFFSm9UeW9UNmUvUzd5bUxtZHNJbmVxY3VmaXFq?=
 =?utf-8?B?UHl4T05memkrM1hsVnVWc1BaeVR0aUJGRHo2dTFIVkFmM3pKMVdmYTg5ejM5?=
 =?utf-8?B?anRVM0RYTkdQcysrZU00L3lsYWpmWnZBeUlmS1YzbE85YklQbWg5cXhxRno0?=
 =?utf-8?B?QzFpYjQ5S2lqTCtUUkcvbTFSTGdpTWszd3VNd1ZQRER0Mi9ScndLY2s4R3Ro?=
 =?utf-8?B?U2pvTXdDMzl1RWRMdDA5UDkyOEpJdEc4d0hQL0dXUEhTQUE4ZXdnRitEUndh?=
 =?utf-8?B?bVZNOTlsckdTTkhDckJzanIwVzBmb2lKaVBFQURkVTNwdktJWnZqRktNaW1F?=
 =?utf-8?B?RzZGaVl0Z0JaaUxJZGVhMStkR0xuRFZ6ZUtkUlNsQ2dZb2lzUk5mS2d3Qi9x?=
 =?utf-8?Q?Duzk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61035903-5a0f-4632-afa5-08d9c5e2ad5e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 07:06:01.7377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hELURzyRtgbc6M64f7DM4zTIcARmSwE4unt21GeoET2RxZy4jjR7vI30tYRIL7c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1838
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
Cc: daniel.vetter@ffwll.ch, Felix Kuehling <felix.kuehling@amd.com>,
 dri-devel@lists.freedesktop.org, David Yat Sin <david.yatsin@amd.com>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.12.21 um 21:53 schrieb Daniel Vetter:
> On Mon, Dec 20, 2021 at 01:12:51PM -0500, Bhardwaj, Rajneesh wrote:
>
> [SNIP]
> Still sounds funky. I think minimally we should have an ack from CRIU
> developers that this is officially the right way to solve this problem. I
> really don't want to have random one-off hacks that don't work across the
> board, for a problem where we (drm subsystem) really shouldn't be the only
> one with this problem. Where "this problem" means that the mmap space is
> per file description, and not per underlying inode or real device or
> whatever. That part sounds like a CRIU problem, and I expect CRIU folks
> want a consistent solution across the board for this. Hence please grab an
> ack from them.

Unfortunately it's a KFD design problem. AMD used a single device node, 
then mmaped different objects from the same offset to different 
processes and expected it to work the rest of the fs subsystem without 
churn.

So yes, this is indeed because the mmap space is per file descriptor for 
the use case here.

And thanks for pointing this out, this indeed makes the whole change 
extremely questionable.

Regards,
Christian.

>
> Cheers, Daniel
>


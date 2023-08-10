Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E897770AB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 08:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F6910E4C1;
	Thu, 10 Aug 2023 06:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73D710E4C1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 06:48:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aehJlIY5qbW6yaNFN9X+YBEP+JuRDROa/BtNx793relpDhfx/O+96NHuZIKLTkCgQq595CsuvCPKAWUN/FQenNm+50ZfB8CrF6yYGvl5y2YelgON1ECtCIA9rgM1tqFY/iHCeMJbWep2wQAOx5xc7qAzUU6vCQdWFE8DcacnCJ8lGB4Va0WylNprkAJpLFq5NGcY/5rDxUFzTPxgrvCDACFeJl6EVpp5jvkeX6G7at+pevmDAbNfEFAUxjdVtd/wIIozaMjNHNEOoztKAF0h1rMRAhR+H43eGrq1RSHxeAtq7io+x2eoMkMjd2wvSSIydwy3RQtC5UR5Vuj2agzSYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IL451NG7+9aE6D3twBbE88KeBc9Hogd/YqizHwzFg/Q=;
 b=OqCEMonCStuyUCRMe0CcfpJzqh7IL1YO0a/oBcinEj8g/hYSOvnLbMGrDn//i+rUfsh625rKXZrtsSw5a6ZQJIiecJIZudv4JP5xsHT9Ft8VOKIafI8uJzrNlTF2s6RqUfOwjFQLe6oJWlz+hKaGuX4aQAF633G0gXEjL2ecx4tpsZZSq7BLoCowbZjLw4jSrlFp+IHTe+9KPp0t4hfl6rhaSmLxAZaD4zHpoEuI2ougJL/7gJsQun+SSvfQv8XA+W2zr6tpvESJupEiFwuMy7OgaftEDVKNBZjQncYTU5zvZUYJNCk6z/eRwy4t6n/DMXoearfZEf6R4SK0mYuAdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IL451NG7+9aE6D3twBbE88KeBc9Hogd/YqizHwzFg/Q=;
 b=kil9tCwUeiKOj7fxzNdTE1cymQCwfo3UZDg2iCFeNzvSEHs0FgMt/DLKYRV0kpEWiWyXsmZAjzC2YwMxF7PcgCLSPzQmNiWeI5qVcOo33qSGyKZJNUOBsg1XCXiFsKW8MobiOZbEfXlh2SLzv/HfpEcT4I53mTJciqpl1LqqTwQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB6487.namprd12.prod.outlook.com (2603:10b6:8:c4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 06:48:11 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6652.028; Thu, 10 Aug 2023
 06:48:11 +0000
Message-ID: <7a09909a-4c94-2e4b-dd9a-4bd019b67585@amd.com>
Date: Thu, 10 Aug 2023 08:48:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] drm/exec: use unique instead of local label
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Nathan Chancellor <nathan@kernel.org>
References: <20230731123625.3766-1-christian.koenig@amd.com>
 <20230809153755.GA832145@dev-arch.thelio-3990X>
 <20230810084002.636cc827@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230810084002.636cc827@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: 06db5ac5-a2e5-45c4-7aa0-08db996dc38b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ND57KDUzqRID6DrDW/yhZJDTGVi0nNAKSnvzcb2gen0bXvKKjJ5hJZuccsEGZ2HJ7pgbpdF/4YZZ+y29YtEKoQm18plbgIUiW+bsrJiLntWb1gt119U0fNdDt6Cx9oCnE7zAcOhMM3CnS+IuVXbmweMohSi9KoNjWjTCcMFTNHF3Jabyt3t+jjXvlOtyBON3giooxcb0qhM2oXJpFyzovW2kOfL7fbGeCr9qOjcPAMSMHgMslIe7WgKdvQUx4XZ7KLEVPY2G6qYB+Gck+4S9Ni1QY5NNX2tcHO76RzsqeYod9S/ohgBR9saMXyn/xUyU62XuVm0LsApIFFjlFGq96h2D/BhIVdrCOJ/HUWsjxEMrFUzgo+oKR3IphmQ7067/HvqXPtBoAmE6PQc88Cm8g2W1A62qy9y8l5Mk09dVCwWWGSzs5gxHqt/8eCI63vKRKSwGZpkIAh+tIAzF7/DJD52jh800ZWcPIhoKKHgnKZ3QzaA1OvFB1h3fkjHF9rMVKk8LdZb6HA8otoRDY/t62odHn9BwTSR9+g+B65N3iJ5lSOVSZYbCUkoTlPRi4H53QIWDAVHZBTeGeOG/MSDjn9CAF0P18YoOponvW4bVW0EF7DGhA1xTQKvEpW/rVlcFWwdMJrw70+3UXxDkWg6Tug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(186006)(1800799006)(451199021)(31686004)(316002)(41300700001)(4326008)(38100700002)(110136005)(8676002)(5660300002)(8936002)(66476007)(66946007)(66556008)(2616005)(86362001)(31696002)(6512007)(478600001)(7416002)(6506007)(6666004)(36756003)(2906002)(4744005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXFlcHJHM1RJenFTbGRUYVAwdlRWcmJJM1ZqNlpaUXdiYUVJN0dzeTNpb3Rh?=
 =?utf-8?B?elNKUG5CL0p0WXgvRDA3MXdmbVhOOVVpT1pLMW9UbThoUHV2YjArdC8zdWVP?=
 =?utf-8?B?Q2h6UHJwV3IyZ3pWQVEwMFgvUzExUHd4UTRxWEFUZlNFZnAwMFZQRHRjNW5n?=
 =?utf-8?B?UzFJVXAwQWk2KzJuS3dxTE9hajRnWEVWUG5CWGhpajJkTFdDcW9odnY1Q2xF?=
 =?utf-8?B?Z1ZMU0hBM3RRVVZ1WThBVU5VdWR0UlR2SHl0aW16VlljZFYvMFgxK0d0bTNz?=
 =?utf-8?B?c09MWWRiLzNFZ3JxMkdGdDNwb2RJaFNROElCZmt4U0phT1JnZ2NEMGtYUUxm?=
 =?utf-8?B?dnhFRlE2cXkzZkdwNGRvY0E3YkpZK0ZMWG5MdzBwYndJS3RtY0R4ZUMzc0RO?=
 =?utf-8?B?dm00NzRZRVF4aVJYbjlmZ2ZiQWt5aXA5K1FQSnBkeGd1SWtZOVNuQzgzSS91?=
 =?utf-8?B?UjByTnNLV1pzVTdNSVlLK3BjMHpVMkhhM2tVWjlJOXNFSnRhS3J5M3VLT0xY?=
 =?utf-8?B?alBuNThXTnZ0M2ZFMk1FUkthcGdRVk1oMDNPa3B1eW92Wi9oUUtMN0dqMi9k?=
 =?utf-8?B?QnhCVk5kRzIxc3ppZEFXd2ZiV2J4M2lURnVKeGd2MHBXUWgraUZTTDZGcXlw?=
 =?utf-8?B?aEduMWczK2laYUtLR2dYRzZxRXAvVUVBYXNaaWZVZTc0djlyV2hpVGJBdGlS?=
 =?utf-8?B?U0ltbDdobEIxRDM4ZkEvUEVuQzVOWlQvajFBSnhBcnZuU1pTRTZLdGxubHZW?=
 =?utf-8?B?TXZkUG5lMURoS2sxYjgrMzVrZTBtdzNrUDlycDBjMzZ2U1lmbHVnZmNzeHN5?=
 =?utf-8?B?eGtsb3l3dXZyZmtPcGhjamQrR2JwRnZWZTU5cktwV0UzUEw2ejVoZXZMeWZF?=
 =?utf-8?B?S2JMeFdlN1krR1lTbDN3QkRuZHBRR0Y4ZU53YXBUOEwvQko4dzBxa0hvM1hh?=
 =?utf-8?B?V0FQcGVNbU1MYUVTeVgweldma1JQcHB6OFpwY05EQ1ZIeldFcVZSVTBic2dP?=
 =?utf-8?B?YzZDUkV0b1A4V0hTQnRPMU9rSk9LUGxPQzRJVkdMVXZKM2NXc0k4MzBHOXdP?=
 =?utf-8?B?akFIVEc5OGsrYTBjRlhwclpEVEE1ODh1ZUZZR3NjQWJkZ2tKS0dWVlZldEpk?=
 =?utf-8?B?Sm9Oa1FSTmRRcTNOQjNvaXRpRUZxYWl5Kyt0bkgxNkJPSE9PWVNyTU9zTWpr?=
 =?utf-8?B?cEd2NEhJRGNSOXVsSEdRUzc1VVZqNmI2b2hDTHBycm8yQmRJcFNxMmFTSUox?=
 =?utf-8?B?Y3hnWisvRElHR0FmaEczSVZXVjROeWdjenFoeVJSS3Jsc2tPMG1jeCtkWS9Z?=
 =?utf-8?B?YnpxSU8xWCtITEVOTmkxcjlvbmFxWTdpTmxUZk9DS0l5Zi9BT1ErRGlIeEc4?=
 =?utf-8?B?M3pYZHFvcGFUdDJaeUJtYkYwWTFSRVBYUVA4ZC8reGJVNFN1SWpWSGlGSXF4?=
 =?utf-8?B?M1hMcHZieXJ2NGJaUERnUUx3RHVUS0t3RlFWNDBFbXVhWDBac244c0FpOENp?=
 =?utf-8?B?NkxpWi9ZZGQ3cC9mdXE2L05mOGFjK2FFVnU5a1crdVZ2WDVRZ29aeDhFbUYz?=
 =?utf-8?B?elFsSE4xckJndG9PQkJBeFNXQWdaTitDbG5HVVVXRDJqRUJaL1Y0RW4xeG1z?=
 =?utf-8?B?dks2QXZ2WWpXYWJkYllzbmtBVjlQZFJ2ZFJFakU0OFowbThyTDhlbWwyUlVq?=
 =?utf-8?B?cHBEQVlYd0NDSnRXUEJKMGNTWi9yb1ExeTVWc01KdUJWakViM3N6K1hPVVVS?=
 =?utf-8?B?WWl0dWhJQlR5UXRPZkY0WGRvVVg4RUhYVjRlalB3MnhpTE1ncVpqWDdPY2ND?=
 =?utf-8?B?bUVEVmFESVhjSVpxWWZncVcvcEh1eGpWcDdzZk12VDZLNDRtczlQSGp1UkVj?=
 =?utf-8?B?a0xNSE02a3hLSmQwdGYvb3M3TnFSOGJ4UVlhMG1xK01UVVdyYUN1QTAxeGhK?=
 =?utf-8?B?WUJoYlRCSkx5NjZ4VTgwQVJaZUNOc2ZIeVE0MmtZeXVVR3c1SDZyQTN4bzdh?=
 =?utf-8?B?NGZrMW1Sd3YwT3pjUUozbUFNUndGWXdzUmsvYUNDaHV0TlhtNUtBbytkaDFF?=
 =?utf-8?B?Tit0WlE2L2drVC9ZU25IRVhLK0pwUDNrSVpwRDZJYnFXMWpBUnR1Mi81S2o4?=
 =?utf-8?B?d1Y2QXR3MTU0dHUvN0J3aTZBdFhhMWM2M0FzZmJxa2p0d2NpKzRHaU00b0Ex?=
 =?utf-8?Q?C+if9zknvYajGQsylIpu8sAfrYOGLk85ola59nfm12Gs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06db5ac5-a2e5-45c4-7aa0-08db996dc38b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 06:48:11.6475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40RRlXFxWyV44ymvOiy/AurI5+/itT5l3/P8H+2+qv6TtdXoO6udURdwrufDIYw9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6487
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
Cc: tzimmermann@suse.de, ndesaulniers@google.com, naresh.kamboju@linaro.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, mripard@kernel.org,
 dakr@redhat.com, dri-devel@lists.freedesktop.org, trix@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.08.23 um 08:40 schrieb Boris Brezillon:
> On Wed, 9 Aug 2023 08:37:55 -0700
> Nathan Chancellor <nathan@kernel.org> wrote:
>
>> Hi Christian,
>>
>> Can this be applied to drm-misc? Other drivers are starting to make use
>> of this API and our builds with clang-17 and clang-18 have been broken
>> for some time due to this.
> Queued to drm-misc-next.

Sorry for the delay I have been on vacation last week and haven't yet 
catched up to this point in my mails.

Thanks for taking care of this,
Christian.

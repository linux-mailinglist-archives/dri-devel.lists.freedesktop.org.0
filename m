Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D608784964
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 20:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA1910E3BF;
	Tue, 22 Aug 2023 18:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::610])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D02610E3D0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 18:27:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ll4IhcVjEjDd4/RxLz4oL2USw27d4Eo3hPhwzIXoaG1Wqc2/d8hb3BeXsRS/zuhU3g0tIXpFFN+/UaEptHTerO98ZZuJza38iNIV4Zf75TbyH7kC7hOScMpg6hxJwwROWfUfbZHMNQdEc0h98RrJe8PLIDKfDQP+s1XYp5xXb2o1AOarT0UUl44sAcStsB9GFTQFh5lC8XSJMuUwXfPcU7W19kHo+4Dk8oGPFA3OPc7SaMX7PMQ3qDwBrsQHziwd9kJKoGqQUwoOTUILwhG4NvhUpqNCfP6+Jc6B4D++GH5u4qJKFq6rXr3Os8dYG+6Hdz7jJvxqQkpNo8Pa3y8CCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhnLffUsYSnssVttx6iRebieOLY1UU3os1Lh5QXnCIc=;
 b=H6CNPhHMizeQLwM/lDDhpKbB15DuK/R82BNQlissaaHFPIIVynsb9E3x3P7ZcT2z6LSGKplqMThnLICTQkMcbYePylTTHp3bQkXzANJ1J56q4bCNgIa5MowPwgZzneMYx63Er2g1iXpUV+lh2OQ23QO2YfqmxAkt78gcjp7RM7TyDwHFDBwzFf80jzLmsoISobhIaOKf0Ml/fXpCsGjvOtbv9noKcVLNoeteJFhJU/NesnNL+uLgSO+3sqNC2DfWe2/l7yWNJgTH1j9lfjT/xKcSUb7F8CIlsS6i94IjEzMr8aa/HuPPd3fL7QcpImtoK77/4msAf8SGBEBkA4TMEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhnLffUsYSnssVttx6iRebieOLY1UU3os1Lh5QXnCIc=;
 b=F06XPR2vF9l0TGttTyv8AS1CUfilQhAyhAEcidODvgKcfI5OT0b3dpCC3isrZaBKNHOQtj5bE/x+phW0HLSX8PIJjgDtmvwDfZO9vo7nrnDDqY6XuYSD+S+uEjLvj0oSx0wpxeTg8QAy2nAcnaZ4CnPZueh1Fk8KVuy9ICrhy0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5149.namprd12.prod.outlook.com (2603:10b6:5:390::14)
 by IA1PR12MB7687.namprd12.prod.outlook.com (2603:10b6:208:421::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 18:27:28 +0000
Received: from DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::b69d:ce48:b96b:833b]) by DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::b69d:ce48:b96b:833b%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 18:27:28 +0000
Message-ID: <97714a7b-8ea8-0b23-f851-aa337026ce21@amd.com>
Date: Tue, 22 Aug 2023 14:27:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/prime: Support page array >= 4GB
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Philip Yang <Philip.Yang@amd.com>, dri-devel@lists.freedesktop.org
References: <20230821200201.24685-1-Philip.Yang@amd.com>
 <690278ed-1f89-2380-c105-1c85f8da5ab9@amd.com>
From: Philip Yang <yangp@amd.com>
In-Reply-To: <690278ed-1f89-2380-c105-1c85f8da5ab9@amd.com>
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::49) To DM4PR12MB5149.namprd12.prod.outlook.com
 (2603:10b6:5:390::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5149:EE_|IA1PR12MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7852db-868f-4bcd-0cc1-08dba33d70d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ratos+rkLCthYbTRhs4Ir8IY8JoO4K2jLOcGlm0E1dBj3Z/PA5NzVwL1CjFLu+cGxr1i0CieBvgPQ20W6yGbCuZvE1dYfoZ75/PBCXWnSVId8C3L/gSraf/2MDSIxRK+XQsPHfxM8lfDgQh/iTphGqTEb8RM/T0B7f3hAuCpAAOQxkQU28CXKFYuUEpERavfHjWYnJk3N0cz7KT/8qnA7S63mChhOK2OXc7N7+Bb+9XgcbwZ5nVHDDvFepHs513U0o14q0Qew4z6iZInpEatkkWgIK8+XdCCLIJ1v+XyGYk2GOrJL6yWQjOxQFM6pCH6oRDKXO1j2ZYEeB2oeLYiRh1q91XcnRcG1DHQys7Qubn+fA2wyEdg9Xb+rfAqjVLc4rLnIWLC41LWyUx2vx07kF85EzOB9di7/EXOB08+m1vyDvlOtp9pRyLjfzFsMJ22b/GXPjngi/gjg0OlVBytjlM1cs0oWOTq5MDuNytr0c2i9bAK/jDshmtNBzpGqn4K4aW0Nq6aFBpW6IQ4ZTUkxy1Oqt8X0OjjxaYymB83RzFxX9e2/BtFXGjj4P4g7X6Dx1SdQHDwWuJM3o3id0AycwC0FtyVEcZLwzFTzXQT7E/yMUvNfejxgp5f0Y1EDe5nsa9NGTAXHJR9q2MJ7L4utw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5149.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(376002)(39860400002)(366004)(186009)(1800799009)(451199024)(6666004)(6486002)(6506007)(38100700002)(6512007)(53546011)(31696002)(66574015)(83380400001)(36756003)(26005)(2616005)(66556008)(66946007)(2906002)(316002)(66476007)(110136005)(5660300002)(41300700001)(478600001)(8676002)(4326008)(8936002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXlhZlQ2WDZseDc1dUdWV1NoN3VoL3doOThxRVIxbDZFS3FTUHJSbmsyYzF6?=
 =?utf-8?B?U0FrcWg4OUVJSmRydEFoLzJkbURLRUxvM3dvd2E3N1dnQnZobGdXUFI5MDht?=
 =?utf-8?B?WWdxYWZlT0RRRnAzVGxoeDNTYXVNSk9YU1lNaWF2RFAwaEQrRjVjWEJlaG1M?=
 =?utf-8?B?VUZTNmlQSjB6cjYxdUl4L3Q5Ui8rVzY5R3JXQ01aYS9KM1JubDVUcXlOdkpj?=
 =?utf-8?B?MHRCbTQyS1NwOGxSMTlYSFNUb0FkalNIajNZMml5THd5a2pVbndMT0M4aFpw?=
 =?utf-8?B?a1A5RU1VMU5aNHhjVlRhbXoyNnpBRWhVZytlVE80MmVmMDB4M04yTmVQWFlL?=
 =?utf-8?B?RE85NklsaTluQmd4bmlHMHBZV0lOVGMzUllYV3RNOXNXakF1OUoxSHh4Rk02?=
 =?utf-8?B?RVlBeTlleS82cGI4Yk5QR0diUThvVThUSVZvSWdGNTRKQ3VwZ1ltYkE2VmN3?=
 =?utf-8?B?MlpwMzhURi83K1VwY1JHa0VaMFd4TzRHT1dJQ0lERlhseng0ODM0L1NxUUh5?=
 =?utf-8?B?U3hEUzJxKzNzaCtyQ0syWUhubEIweHVPL0pSK0FYVy9GRkVjWHpwb1pwWm5T?=
 =?utf-8?B?RzJDZFFiWkVKRlp6QVJGRDArbHE3b3dyMFcxeEpPYTJBZVlDQUp6Y3d2a2Ew?=
 =?utf-8?B?U0NqdWQ1a0FSNWlzOUhwWUZiOGE2Q3dFbUNrckQrbVgrWUlXSTJxbm4zS3pv?=
 =?utf-8?B?WDJSSFZWSTUwRFNkcmZtOHVHQzJNVWFKNWIrbTdTeGIrTmNIWUxYVUo5anZM?=
 =?utf-8?B?UzFwSWlaTnprRHJDNzExY2VYMU80aDNDOHhLcHpnNWVreXgwQVV0Qjd6cmlF?=
 =?utf-8?B?bjRHUkVsbzhla2Q2TEVkMWNJTGJiT3JpQkt6Si9pZG5sOTc3RWNwMHZKL1lk?=
 =?utf-8?B?NXA5VTRxdkJ3eVZkNUhSYy9lSGlLZnVlZlNMU3U5dmw1NDNiZy84Z0RKdEFw?=
 =?utf-8?B?NXEwN1NIMk1rVDdMUFdyZVVmQ1hzTWdLaHAvZitYQXAzYVQ1K1RaSW12OW9n?=
 =?utf-8?B?a0NLR3UzRlFtZmFjZ2FLN0dxLytmQkxxbi9SbklFc3JWYUh3bTZUaFliSldi?=
 =?utf-8?B?aDhJTWJON1VNQ1FyRmxTckM5TkFkU3B2eVNabW5zVDZUWm1BYWdLeHMrdzAy?=
 =?utf-8?B?dFBFTnkwUjBsRzM5RlI0M0xsU0xOUG8wWTM3Q08vcEVZN2Z3ek4wSU1xbnlz?=
 =?utf-8?B?UWoyUVNLQzhlNGRKMVlSQnJmSGJUU0Z2ODJkU3l3SE9hcy9vcHZWRDRvKy84?=
 =?utf-8?B?OFdreEJDN2NUQ296OWZDcDRVRnNlZnBLNmdCZU9GcUowNy9CdW9ZRm0vNUxv?=
 =?utf-8?B?TVVmWkN4LytkNnhPQ1RKZ3pjaUZGb2RJaVh4bFFKMlJmOWVZMWZ6Y0xPVXNv?=
 =?utf-8?B?YVFOdXVVS0NFY1VFN3Q1TjAxNUFmSlZKcU56Zzg5ZktTT0pQeEc5OTRzRWtj?=
 =?utf-8?B?c0VOZnA2RWdNVGFEU3ZtTlkrYmJnYjl1RURZREE3WmtHU09ZaHhyaFVvdWNR?=
 =?utf-8?B?dXVwMklYUUtJdWR0SVZrVjZ0R3ptNmVmRkdLOUxIbFNJTW5DODRSaW9haE5C?=
 =?utf-8?B?WW1SdjVRNy94TldsTHBVc1JvT0pzMlo1b1dPTlJLdVRFdjVOZ0Z3eG1JMVdO?=
 =?utf-8?B?VTVlZE5uc3B6eUlSVTdJV1FOSUZIK08zZ2R3Y1hHNjVZVEVoZmtDWlRqS0Yw?=
 =?utf-8?B?STgzZWJwWjRIL290N2lBdExKRFJBOWplbHVheC9JdVNNTXQzZFRuK2gxRm5U?=
 =?utf-8?B?Yjljb293VDZJZHlzT3UrNWRHaklVcXBSakhXVzJEakV0SE9lZ3BKV1NqL0dh?=
 =?utf-8?B?OStYVUl0UFZoL3YzNktza2orMjdKREdHNzczTVZ6aVpBbUVjQUUxVjFTMVRi?=
 =?utf-8?B?OEdoRUxPdVNQQWFCMlp4SGRtNS9RYk5oMmt4anBaazhsQTVoenowN3FPU29t?=
 =?utf-8?B?SktFOW4xdS9DRWhqQjJvUDdyci9vMXVISGUveDNFekV6S0NnTEkwSjQrV3N1?=
 =?utf-8?B?M1hkeTZqZ2NYcU4vaEwvTWQrWE4vbEo5SlZpNDU2eDVIT3lxWDl5NFpsZk1u?=
 =?utf-8?B?d2w2aXJwdEpJY0dmdXF3TCswRVRCRjB2U1liYllkVTVmN2diNldlVElJYkhP?=
 =?utf-8?Q?oxMi9C5AYX0LGTm9xOqZwFhVz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7852db-868f-4bcd-0cc1-08dba33d70d5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5149.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 18:27:28.5886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2AXaUqUM+nNfC4hm+TMzCosj1ELWG/xtB2CCviU9cjNp5XvD+5mnuU7CNSd6ax0T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7687
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
Cc: Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023-08-22 05:43, Christian König
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:690278ed-1f89-2380-c105-1c85f8da5ab9@amd.com">
      <br>
      <br>
      Am 21.08.23 um 22:02 schrieb Philip Yang:
      <br>
      <blockquote type="cite">Without unsigned long typecast, the size
        is passed in as zero if page
        <br>
        array size &gt;= 4GB, nr_pages &gt;= 0x100000, then sg list
        converted will
        <br>
        have the first and the last chunk lost.
        <br>
      </blockquote>
      <br>
      Good catch, but I'm not sure if this is enough to make it work.
      <br>
      <br>
      Additional to that I don't think we have an use case for BOs &gt;
      4GiB.
      <br>
    </blockquote>
    <p>&gt;4GB buffer is normal for compute applications, the issue is
      reported by &quot;Maelstrom generated exerciser detects micompares when
      GPU accesses larger remote GPU memory.&quot; on GFX 9.4.3 APU, which
      uses GTT domain to allocate VRAM, and trigger the bug in this drm
      prime helper. With this fix, the test passed.<br>
    </p>
    <p>Regards,</p>
    <p>Philip<br>
    </p>
    <blockquote type="cite" cite="mid:690278ed-1f89-2380-c105-1c85f8da5ab9@amd.com">
      <br>
      Christian.
      <br>
      <br>
      <blockquote type="cite">
        <br>
        Signed-off-by: Philip Yang <a class="moz-txt-link-rfc2396E" href="mailto:Philip.Yang@amd.com">&lt;Philip.Yang@amd.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; drivers/gpu/drm/drm_prime.c | 2 +-
        <br>
        &nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/drm_prime.c
        b/drivers/gpu/drm/drm_prime.c
        <br>
        index f924b8b4ab6b..2630ad2e504d 100644
        <br>
        --- a/drivers/gpu/drm/drm_prime.c
        <br>
        +++ b/drivers/gpu/drm/drm_prime.c
        <br>
        @@ -830,7 +830,7 @@ struct sg_table
        *drm_prime_pages_to_sg(struct drm_device *dev,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (max_segment == 0)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_segment = UINT_MAX;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err = sg_alloc_table_from_pages_segment(sg, pages,
        nr_pages, 0,
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nr_pages &lt;&lt; PAGE_SHIFT,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (unsigned long)nr_pages &lt;&lt;
        PAGE_SHIFT,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_segment, GFP_KERNEL);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err) {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(sg);
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

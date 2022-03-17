Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 778284DCB26
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 17:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5760E10E567;
	Thu, 17 Mar 2022 16:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2056.outbound.protection.outlook.com [40.107.96.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C1810E567;
 Thu, 17 Mar 2022 16:22:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ga1tv5AZgMuHv6wokXl2gxkJTA4MQIu+KURIt9/f0KcotQzr3pr3JlKo9OB9Sc4cJ7LjjGM66iwyiUwvTKfUyw26Q3eDOXkAmnUrIwHF/1stq3X5kmRuOV/xx47twLBZHF4t9w0sROOxPkP8TuIBBORHepQOTBGv5YUqSS5d5Yo2G+sH+CrwODsM7Z+s1hYRFDpIjOMEBgUkgi9rsnmoGV2XBra9E57harJXuO+F6IMamAbgf3KAWKaJn/knqH0FV5l9ZkuYVA4Dhtav1rzJGtKYQgOaV1rgrSiIa+miMSRj9176rt3u2HZHm6u5pZdhdKTQBv0QyXh++r3NK9IulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YyM81gMYFRKXhu4M392W2eKUi5G6drzziCes9euQjw=;
 b=PUuavlWp8hbVWSqpPnVCDozQG+yNsakp9uNgpGbX6YeI8PTCGeJ6f8TD6KuIjetYvANubonM/FNu8uX4YrMAMCh4KF3/Sa+FN9W1YuEKiRDFmEkJFFPw2celkUqkysrIXLkxaB/0v2R2tIOs8s3tnLGoRx+nF6guiL7kgYZMEwrP/hRy/XCiLJDMGIHum9cWjoaWT9Fpb6FY/k+JHj4FHFQ0+UyPSKW00PPhgWc7wvIIEtxftFZUhilzt1MzBPFWPybEIr9odqdk++rwgiYJVH0ppTW0hrrK5No36vjQCyyaCb8zr3UAqs2it0aexxxGWbOLD/uitXTz+8O5hO0zWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YyM81gMYFRKXhu4M392W2eKUi5G6drzziCes9euQjw=;
 b=sSLP03Ra99Th7a8A+wMzjutEKEHxxk8zGDwTTLS13Eu/EgKR+DLjG67iZ6NZiAnLPlH8O4UEu3rAx784qWO78SWGbWU79PG6GpRJpwSjp6BHqJHRvOKDgLSXehQLoXAuGYyGuzZMsCcXsle8CcpvqSmexB+nkU6IvESoHqHUbmM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5149.namprd12.prod.outlook.com (2603:10b6:5:390::14)
 by BN9PR12MB5382.namprd12.prod.outlook.com (2603:10b6:408:103::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 16:22:37 +0000
Received: from DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::911e:11ef:6f5d:6329]) by DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::911e:11ef:6f5d:6329%7]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 16:22:37 +0000
Subject: Re: [PATCH 1/1] drm/amdkfd: Protect the Client whilst it is being
 operated on
To: Lee Jones <lee.jones@linaro.org>, Felix Kuehling <felix.kuehling@amd.com>
References: <20220317131610.554347-1-lee.jones@linaro.org>
 <8702f8a5-62a1-c07e-c7b7-e9378be069b6@amd.com> <YjNNCXc8harOvwqe@google.com>
 <1f003356-3cf9-7237-501e-950d0aa124d1@amd.com> <YjNQA80wkWpy+AmA@google.com>
From: philip yang <yangp@amd.com>
Message-ID: <b65db51e-f1ba-3a9b-0ac1-0b8ae51c5eee@amd.com>
Date: Thu, 17 Mar 2022 12:22:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YjNQA80wkWpy+AmA@google.com>
Content-Type: text/html; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR19CA0005.namprd19.prod.outlook.com
 (2603:10b6:208:178::18) To DM4PR12MB5149.namprd12.prod.outlook.com
 (2603:10b6:5:390::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e60281f4-6be0-4a8f-079b-08da083259d4
X-MS-TrafficTypeDiagnostic: BN9PR12MB5382:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB53828C88834B8B818FC62087E6129@BN9PR12MB5382.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k14iHr/a4/QriCu/XGTJZ/Ow7ZZKM7qmb/fm/qeHIye/jBq5J/dnzBvjwxvqGP0iiJrUlcpkPRPKZ6rwYdLyI8e3xcTwioPjdh4UpD00X8c9v8g3RVyT6K/fWzuBHMXBpiumK2bX330BbW9LfbeVM41xNaqSrlPHLi2I3MTQUsONzKeqIBaWtekeNf/VjmXdQGCdYUIUnTyR84EGdpqf7k5B1ttA3xHl1XhmpqP39vVSPWUbGNNcBmixEPOgXUZsTTAd3F6WngjS95LT0O5SFQE8FD3CaDvv1L6rXyCWPW0JJsXwvAov2AwuaiMJIii4+Ivrc3H/4CPaCEMhdJDXJK88CQaSqiilCCjxy3gkrkrrHFNbmW3koS4+lXzaTVG7WtrojNuhOwJMacKhSXvPsq7s7BuF0i5IUr3t0nV8ywrLhOI4Ek8Qf4cdcGlCg63XFtIGutKqUE8xNB1AgLpUl8gEpdQb4yOXKdhy8bD4Aeg2MY0uwppfaa7SNaw7O5t532hgAHNwVdCQuihoWnnS1utKybdoXpE84dPaVVUO3gINCISrjsiR5uBPYun+2cOoz1sgFgX/x0GGMlI6AwKJ2zc/RHrCHygbFyieiUhuq/2NgGOYPQp1BzmG60+j+OA9Nb2AEcviamwoqQsEs4BjVPLOimsU78hGZjR8jVOUSZmujOO9PuGrtKyfVFYDIRUGAx9PztzkB81Kf3vUsbRKDNeekqu/ZVdQghUHFoZ2xOg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5149.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(5660300002)(54906003)(110136005)(83380400001)(316002)(2906002)(6636002)(31686004)(38100700002)(31696002)(6486002)(36756003)(6512007)(8676002)(4326008)(66476007)(66556008)(66946007)(53546011)(26005)(186003)(6506007)(2616005)(66574015)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejcvaVJGMGxBWnBod0JKVE9UblorYzRpaTVRT1pheHZWVk5reTBaMnV4VHNz?=
 =?utf-8?B?L25oK1ZXSnN0bm5kSm1oNVpLQlJKRjM0ZjZDRkhObExLUDBLNlY2OTJMbDJp?=
 =?utf-8?B?VUdaUWc5Z081U1RMK1pCT0dDNVhYZU1Yc3UyRVo4WTFDTGZQUytRbXFzdlhx?=
 =?utf-8?B?MXpiR1pEODRoRW1OUlZmK0diUHlPZE44YWVNNXZYZWxyazhUTW5tMmZYakhD?=
 =?utf-8?B?dTdXQUN1bkZXaUdrbEdZbllvVHcyWm4vQnoyS0hEanRwZ3Q5MEtDdUxVYlI0?=
 =?utf-8?B?UWhVaGViYi9vUy91Y1N5d1ZyaXRNV1JmR0NoZmN1aTh4QXM2dlloYytDR3Ni?=
 =?utf-8?B?NG0xMUxyMFRoRkJ6TTJCV2VLUVhMcW9SWDd5akhZbk9vMFBIMElBR0E4NExS?=
 =?utf-8?B?di91ZlVncGo5SnVzaXZQL3VNcEdLaVFiNEpSQVpOUEN0MGpkekk0MlNvNWZE?=
 =?utf-8?B?MU02ejlhZURlbE85SHBVZE0vQ0U5dE1yV3RUblFkelE3RXZlZHRDVnpvNkUz?=
 =?utf-8?B?UmJ1QnFHRmIzMjdiVm1nU1Z5WmEveU43cnJMVmkrN29OcXphQXcrQVUxV1Yy?=
 =?utf-8?B?TkhaUFNpYW40SW9FRk0wTTJoajRZa1RWRVFGQlJWRTg1bUJuSEJ3bStjWTc1?=
 =?utf-8?B?cDJZaGhFSHBGUXBmdmxza1RhVzhXc3VTcTlVTUpUYkptQ1FkSnJHYmxDdHJU?=
 =?utf-8?B?WDdkN2xRTmpsWC9aZ2hwbHB4bWRoVHc1d1ZYVFJBWjJCdHUrVE9wSS9ZZjd4?=
 =?utf-8?B?SmxYQ2RqZ1I4b0NnYkVTQTc0S01COEg3WVdBZ1dVck42dFVZd2dOTkpINUJn?=
 =?utf-8?B?UkpidlByZTVxWGtyTHZ5MGdBVTlSWGxTL2JVdEhxdVRUM29DODFVU1Y1SnJD?=
 =?utf-8?B?RWlVbnJhZEQ2QnNMZDc4UVRnZk9UVkJVcEJYZktwS0h4RW01empHWnArRzB0?=
 =?utf-8?B?MVpDbzFjUjE4TWpBak1kbGpSa1pQdDB1QnR2aW1mOEQwbDhLNmJHdHdjWSs3?=
 =?utf-8?B?d3FlZ29rcXVJMHpJd2pMQlRRZ0JJYmxPazlmblN2Q2NpbXMyLzlOaE5IZlJw?=
 =?utf-8?B?WFVRKzl2WCtSeERTUXg3Q2VWZVEzUFlIMERHKzJGdE5ic2dacDNkZUVBN3hp?=
 =?utf-8?B?WW1GS2g0VW5sK2dHME41MTF1NWlsczhHMUI0QmRBcERlaXlnUUltVWNBN3li?=
 =?utf-8?B?bEtlWUtKMDFaNmlvRXNtS0hPYjJTQUttbUNxZHNwSFZCeEIvV0R4WXN3enU2?=
 =?utf-8?B?amxkWW53UVFqK2FZc0VSSWFEalVOQjRiNlMwNWFQakw5T05xUTl5UXpQVjNX?=
 =?utf-8?B?ODcrc1dLV1AvSUdEUXdTb3MwNDZzZ2ZheCs2ZEZDcEZTS1JMMWdOZGZzMVdn?=
 =?utf-8?B?M1NFTFd1WTlnSDNleXpKL2hWcmp5SVR1dXJlbDVNZjI1ZDhKdHE2d0s1L3ly?=
 =?utf-8?B?UTRBc2NwclhlTUhMSjBWSXlTU0NGN3d4VTlqT0V3K1QrVWtlWGZQS0dnb0VQ?=
 =?utf-8?B?ekdGcnc0NHVuK2xxbDdQSXhRNk5nN2JEYW1sMldTSEZKTklReDU5TlVtOFpP?=
 =?utf-8?B?Snl3YXhnZk85cnBNSFJMbkw1RkFjYTFwNEsxaHk5RkRpcFl0djNEeTFuU2JW?=
 =?utf-8?B?QlQ0eVBMNmpyd0x4NlVWT3p1TzUva0xjZkQrNDlPUTB3Mjh3L05ETVNrY0V3?=
 =?utf-8?B?emQ1b3g5QWNuM0l1VFlWZ1lHRlUyZUt4alh3Y3JwWjMvd2V0RzQ4YXZJek51?=
 =?utf-8?B?TCtWa292enFmY2tkcWVWSDBRMUxoQ28xMEtONDRlTVVna1UveUVKRTBiMStH?=
 =?utf-8?B?NnAwNXBSRDdIakxsQzhoeGRWVHBtNittMVVxaE8ybjJhMlluRkpRNlRnK2Ix?=
 =?utf-8?B?NGpVdUdVTElvaTMza0NnVFVibTNWWktyaUFBemI3MnM4K3RNUm1yM3pLVTFs?=
 =?utf-8?Q?hlg5drYElCLFYJAera3Nd3tCbM2Tx2E3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e60281f4-6be0-4a8f-079b-08da083259d4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5149.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 16:22:37.7469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3y8Oa93urvrZ+s+9X4WvbhGagDrJ/SuxUX0FvMIUGqGnfOedateL8A7Z4RhWPUUP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5382
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022-03-17 11:13 a.m., Lee Jones
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YjNQA80wkWpy+AmA@google.com">
      <pre class="moz-quote-pre" wrap="">On Thu, 17 Mar 2022, Felix Kuehling wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Am 2022-03-17 um 11:00 schrieb Lee Jones:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Good afternoon Felix,

Thanks for your review.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Am 2022-03-17 um 09:16 schrieb Lee Jones:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Presently the Client can be freed whilst still in use.

Use the already provided lock to prevent this.

Cc: Felix Kuehling <a class="moz-txt-link-rfc2396E" href="mailto:Felix.Kuehling@amd.com">&lt;Felix.Kuehling@amd.com&gt;</a>
Cc: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a>
Cc: &quot;Christian König&quot; <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: &quot;Pan, Xinhui&quot; <a class="moz-txt-link-rfc2396E" href="mailto:Xinhui.Pan@amd.com">&lt;Xinhui.Pan@amd.com&gt;</a>
Cc: David Airlie <a class="moz-txt-link-rfc2396E" href="mailto:airlied@linux.ie">&lt;airlied@linux.ie&gt;</a>
Cc: Daniel Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
Signed-off-by: Lee Jones <a class="moz-txt-link-rfc2396E" href="mailto:lee.jones@linaro.org">&lt;lee.jones@linaro.org&gt;</a>
---
   drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 6 ++++++
   1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
index e4beebb1c80a2..3b9ac1e87231f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
@@ -145,8 +145,11 @@ static int kfd_smi_ev_release(struct inode *inode, struct file *filep)
   	spin_unlock(&amp;dev-&gt;smi_lock);
   	synchronize_rcu();
+
+	spin_lock(&amp;client-&gt;lock);
   	kfifo_free(&amp;client-&gt;fifo);
   	kfree(client);
+	spin_unlock(&amp;client-&gt;lock);
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">The spin_unlock is after the spinlock data structure has been freed.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Good point.

If we go forward with this approach the unlock should perhaps be moved
to just before the kfree().

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">There
should be no concurrent users here, since we are freeing the data structure.
If there still are concurrent users at this point, they will crash anyway.
So the locking is unnecessary.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">The users may well crash, as does the kernel unfortunately.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">We only get to kfd_smi_ev_release when the file descriptor is closed. User
mode has no way to use the client any more at this point. This function also
removes the client from the dev-&gt;smi_cllients list. So no more events will
be added to the client. Therefore it is safe to free the client.

If any of the above were not true, it would not be safe to kfree(client).

But if it is safe to kfree(client), then there is no need for the locking.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm not keen to go into too much detail until it's been patched.

However, there is a way to free the client while it is still in use.

Remember we are multi-threaded.
</pre>
    </blockquote>
    <p>files_struct-&gt;count refcount is used to handle this race, as
      vfs_read/vfs_write takes file refcount and fput calls release only
      if refcount is 1, to guarantee that read/write from user space is
      finished here.</p>
    <p>Another race is driver add_event_to_kfifo while closing the
      handler. We use rcu_read_lock in add_event_to_kfifo, and
      kfd_smi_ev_release calls synchronize_rcu to wait for all rcu_read
      done. So it is safe to call kfifo_free(&amp;client-&gt;fifo) and
      kfree(client).</p>
    <p>Regards,</p>
    <p>Philip<br>
    </p>
    <blockquote type="cite" cite="mid:YjNQA80wkWpy+AmA@google.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

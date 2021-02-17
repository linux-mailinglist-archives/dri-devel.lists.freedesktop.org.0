Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFA531D40E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 03:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B0889A7A;
	Wed, 17 Feb 2021 02:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652B589A74;
 Wed, 17 Feb 2021 02:52:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9z0IKjIISJMRHqAqVetamjdKxEw0qbIcKCLyoUXbQ4o8CYiuAY8Q7i0+KdumglW+Uf06LIYajyy3hmpDECYz6X2agnk4K9r2yUwnv4qt4mGYuXr7jrRafyWdOtIt2hEdcbLJtVi/B0idh9W8G87k2Z2UGz31ytPm3xpg6h2Bryn3hY9unzTazNxxjDoMcsNhV0grlys0mv1V3x7UF63juBTbdvyX+ZoMOeH6+5Ljp1FNGVwiLiPpG7l2oQw/JqI8BLRihitnrJd2/4vJ+Gd9pASkrdLFWW1YszbYYfdp+u/6KF/7U//V3kaoMYEhEOt0XdqYqEJgMMDvr/JLnM8Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbVKyTK9zzlB8Dti9genx1BaEdUsqRwaXAGdpx+hv9U=;
 b=ZwvMEGDKOZfwq4scpN9KRielHDTOtwKQOufCZawDt3MqerIVMk8OPJBYTzZ6lyifSluD/GBsf4uf2s982ws5c5IkKAgVgQzVfyTF3+Z/ePuoH2gs06hFODjMPwEiEdQXpZmZZNywEEeLWdh4jmJwrgTmyWYnR+BKb2axOh9MmV4AOxF8fYIHwJZKXLpCton7rx5/3RMZD+R3arP995eWlQQZcrsrQmH0e1x3LYZgMQjTmBg3HI+3ezYwjypBfKYu2HAs2mZNoeCQ/tR9PS3Zg1x8Ft/T/E9Xt4oNGFNByrCYYCUMr4D3mn4z0AYrrjcR7vxhqQnkWan9Nd6sn/RNXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbVKyTK9zzlB8Dti9genx1BaEdUsqRwaXAGdpx+hv9U=;
 b=2YN9yh23FNPJi80Bv4DXo0riQgvQBR10wTJI/3mmOH5EoUQVdr38nYXxC6ogmJl4ol/KzJ8A/XR7XRIHekzAflKC2/cjMpGBiVptZOvgZGZPPVBMY4TlduFLXNOCNXKqB6ZRlAp5CXjYG7TEj4Lbl2C773jC93mnNgBdA9erPpY=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB2583.namprd12.prod.outlook.com (2603:10b6:4:b3::28) by
 DM5PR12MB2582.namprd12.prod.outlook.com (2603:10b6:4:b5::37) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.41; Wed, 17 Feb 2021 02:52:07 +0000
Received: from DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::9c57:59fa:b83c:2942]) by DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::9c57:59fa:b83c:2942%7]) with mapi id 15.20.3805.038; Wed, 17 Feb 2021
 02:52:07 +0000
Subject: Re: [PATCH 1/1] drm/amdkfd: Fix recursive lock warnings
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210216202245.32073-1-Felix.Kuehling@amd.com>
From: philip yang <yangp@amd.com>
Message-ID: <cf6ac387-969c-518f-6c4c-25f0be052c17@amd.com>
Date: Tue, 16 Feb 2021 21:52:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210216202245.32073-1-Felix.Kuehling@amd.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTBPR01CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::28) To DM5PR12MB2583.namprd12.prod.outlook.com
 (2603:10b6:4:b3::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.38] (165.204.55.251) by
 YTBPR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.36 via Frontend Transport; Wed, 17 Feb 2021 02:52:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f1439a4c-b922-4ea3-fd6a-08d8d2ef0356
X-MS-TrafficTypeDiagnostic: DM5PR12MB2582:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2582EF5D15D5C1E7F1932977E6869@DM5PR12MB2582.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7qGtkTtEQRNOKz4x9hSHARRsQl6aaWgytKx36grI//c9VWYATxa0fgpvEVFXFv8pOT+lLMAwPpCkI6HMUJ+2ASDGM8cyeS59apYAEssTDIWVd8C+YpM8j8U4JX52vU68n1Ve9BFnF/JMU1E50yB9b03WeGdXZjyN5dO47yrMXVXv3EdoeVvL1jBDmIBlHGh2oPPEkQRo4E0dt2KJIWJ7N3r66lpWSPxEowgSTOBJxtlmWY11+ZeQ+oqVo0LdVay7aU6kPNAIVYZgWjAAmIwT3WY8Z17Baiplt5DK5nkgepItjXyByz6VE2VOq9/AUhL4yQshnijR3Ud/7UFcErFmR9HZsUM4H923d5j/WCkZ2z3n6xZpVZl+3I7V/joFkgBAJ9Dl2pw3CcVcFqIt/3CsEwnjV2vpbOpWL7iWMNbvir5k/bFmePg6ev8BbW7X4AZM8OCCBO7z4iW2CyrFWaKp+yk1duoxFSLm5lWz0gGovAX4Wn5uLp/EFQieHGyAjxvdufxQgui1dYOElqWvUuIxtiWrmIKy+AuK2FBr2SE2bEjhJ/AKw1sDS1eNe1GAHD1Uzo01y4QKRVAK1+DtjtwAQCv1sGTqewlr+u9oK8692QM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2583.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(136003)(346002)(396003)(366004)(376002)(6486002)(956004)(26005)(31696002)(5660300002)(316002)(52116002)(2616005)(4326008)(66946007)(186003)(16576012)(31686004)(478600001)(8936002)(8676002)(16526019)(83380400001)(66556008)(53546011)(2906002)(36756003)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NFU0K00zclVUUGo5ZFE5L3lXclNGQmtkam1DZmJvem1oTUdISjhHT0U4R1lh?=
 =?utf-8?B?eWY5NW1jdHVFT21GTmhrWks0elpwTW9ySjhCcDVxK1pFWHlDb1N1VUZyUEFs?=
 =?utf-8?B?NGN5bnRVUnhCa1BjblJPd2JKbmlTblpUSjByeklHVXcxc1hoYm9zYVd1SFJW?=
 =?utf-8?B?MDkyZ3FEbDJ5dmJFYlVwUTZCeGkva2xaZTVtYUcwWXFLSTNGZDdwZWY5VTM0?=
 =?utf-8?B?eDZlYUs3ZEl3aDFhMXdFcVBMclR6eGhnOHZuY1lSSVFKWnJMdHEvVjE1cUVu?=
 =?utf-8?B?eHExZVFKSzhRc1dGQVVuRUl1U0NpWlhsampHVGlheDh2dkJoQk9teEdsd1pk?=
 =?utf-8?B?QkJDY09KYnF3R1NEUG1GQzNWZEg1NC9ScER0Y0lvcnB4aEQyYm1vbHplOUtq?=
 =?utf-8?B?U3QzSU5TMDFEUVcxeW16UHphbnpxVTh5NWk5UWVSZFdUY2dmTDNnRDY1MEd3?=
 =?utf-8?B?Z0tsTDJFNHJNSkxIMjhxQjBacThxMUsxc2wwWFJDQm5vcTRLVkc1bTB1dmxw?=
 =?utf-8?B?dWhad0puLzU1aTYyclYrOEd6dWZZRWJaa3FCUGkzOFprT3ZrWENJM1FVVFY1?=
 =?utf-8?B?K3g4NC92dW5INWtpWXdOZ21TRGV0NmdDQnZLY0c2NjhIbU53WHluN1J3NGFV?=
 =?utf-8?B?VS9LeVo1TjE5TU0rZ29kdDVDWG9HQVowQTBRdUdua3Nvb0M5ZHE0QzlpQkt5?=
 =?utf-8?B?aHpRL1o1Ri9rSmU2bVlMV3o2SFFIUFJVU3JJK0JQVmZQNnpOMXk4SVVJY094?=
 =?utf-8?B?dk5GRU8xKys1OHd6UEF0R0l4cisxT05iRTVlNUJ6SEhjU3JvZmhZbFc0dkM5?=
 =?utf-8?B?ZVRoY0QxOFFRdWhjb1BJUGltdUJkV3lnM2Q0MFhyQWNQQ2hyREExU0xFQmJN?=
 =?utf-8?B?TUljQ1o2djFscW9UL0x1clNxcjRGbHJQd3dMTzN0bUV6MzBvS29lRS9reHU0?=
 =?utf-8?B?VU5DcmRkbVpjNUdHS2t1WHZyK3pIMklCN21SNlU3NVRCdEZMM1RjcUFFS0F1?=
 =?utf-8?B?YjdJVFJJcHNobGQzKy85Zi9oUTA4WTcxVkR5OVBFQlU4dmRwNXQrQ2ZvZkFq?=
 =?utf-8?B?OFM2VGZTcENLSHlRdUZnNkJub2hTRFVPV0oveGVDMG5LYUUwdDM5Y3FqM1I2?=
 =?utf-8?B?Wm9EKy9BYVlweW1CRWZlNjFXcFkrdXFTQmJjWmVKTXdtYXBYSGNCWnN3TkZV?=
 =?utf-8?B?V25JSUJzUkdJNFBoU0lZTm1CUVhxZ1EyMUJOaExFY2pUeWZKSk5uMnMvR1JR?=
 =?utf-8?B?czl4RkE3TGtZYUl4WjUxY1hJd2tKZGRZRy9uN2F0QjVicmxUN2k2eFNJV1Zo?=
 =?utf-8?B?WC9IdUQ2aU16RWdvTFQvakVIYjZ6OEJ2L3FXUVFaeUtDbSsxRTM5QjNIc3hY?=
 =?utf-8?B?UG91TENjeVBKMXVFaTg5a2F6VkhwLzN3dklZYUY5Ky9FTzQ4Z3VIaWdMSEFL?=
 =?utf-8?B?bXhoMEhVMGJjekV4dHhSVnZ4dTRmQ3BsZ25oZjI3MWw4cnFxbDQ0ZjJLbFBq?=
 =?utf-8?B?Y2VjekNZY0prMmt6SFVUZGtoalVLRTk3WUM5RnV5ZnQ2Z3dYYWF2dVAvNGpn?=
 =?utf-8?B?bE5nVm1UTWphMGd1c0RUYVZPNkRCTFhOTXZpbzFtTy9YWU5Gays0WWZJWlJa?=
 =?utf-8?B?cTJ1MTJyTWE5WHlJNTBVZ0MvMzNSdVFIcnVmY1NKRTBYdCtidExlZEoxbTYx?=
 =?utf-8?B?ZlZvRlZ5Mm5DTis4SlV5RDFsb3Q1bHlGSDJXVDh3OUQ3OUVVMWVzbXpVN3Ax?=
 =?utf-8?Q?Pb+gveBQkRFdWhgjdK6sTaSbZkQTKtzWz4bzNVR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1439a4c-b922-4ea3-fd6a-08d8d2ef0356
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2583.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 02:52:07.1702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2LR62hQGXTTHVFTTU8pdrlOGwwAX4LlsxFdOUuhqifS+Q/OVzGZpuK1fO7yAfVC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2582
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: multipart/mixed; boundary="===============0586437710=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0586437710==
Content-Type: text/html; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-16 3:22 p.m., Felix Kuehling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210216202245.32073-1-Felix.Kuehling@amd.com">
      <pre class="moz-quote-pre" wrap="">memalloc_nofs_save/restore are no longer sufficient to prevent recursive
lock warnings when holding locks that can be taken in MMU notifiers. Use
memalloc_noreclaim_save/restore instead.

Fixes: f920e413ff9c (&quot;mm: track mmu notifiers in fs_reclaim_acquire/release&quot;)
CC: Daniel Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel.vetter@ffwll.ch">&lt;daniel.vetter@ffwll.ch&gt;</a>
Signed-off-by: Felix Kuehling <a class="moz-txt-link-rfc2396E" href="mailto:Felix.Kuehling@amd.com">&lt;Felix.Kuehling@amd.com&gt;</a></pre>
    </blockquote>
    Reviewed-by: Philip Yang <a class="moz-txt-link-rfc2396E" href="mailto:Philip.Yang@amd.com">&lt;Philip.Yang@amd.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20210216202245.32073-1-Felix.Kuehling@amd.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index 16262e5d93f5..7351dd195274 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -243,11 +243,11 @@ get_sh_mem_bases_nybble_64(struct kfd_process_device *pdd)
 static inline void dqm_lock(struct device_queue_manager *dqm)
 {
 	mutex_lock(&amp;dqm-&gt;lock_hidden);
-	dqm-&gt;saved_flags = memalloc_nofs_save();
+	dqm-&gt;saved_flags = memalloc_noreclaim_save();
 }
 static inline void dqm_unlock(struct device_queue_manager *dqm)
 {
-	memalloc_nofs_restore(dqm-&gt;saved_flags);
+	memalloc_noreclaim_restore(dqm-&gt;saved_flags);
 	mutex_unlock(&amp;dqm-&gt;lock_hidden);
 }
 
</pre>
    </blockquote>
  </body>
</html>

--===============0586437710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0586437710==--

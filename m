Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FB34855C0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 16:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AD010FD28;
	Wed,  5 Jan 2022 15:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2071.outbound.protection.outlook.com [40.107.212.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B087110FD6B;
 Wed,  5 Jan 2022 15:22:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtGoqsMvcXTnGGi88HllNxJYorwHhTkHHgf0RKB+oSDiSP9wHCOpWEmKcV22zNJiAdc3J4wkQJtQDsmi1mJYWp6CMoKLrkvC6Re484lbpaPdzfFrZXTgvrefB20i4VYYaHr9OowRGt7ZR1Vr1l9jaZryw/cJXL38k3q19HEm3Tu4ycO3RCuM0vzOkpRBymR5hXWBxxf0SBiXwl2Xm5X3R+be0GUmEiW+KZOfPxPwI5b4LeF3yXQztPKWUsQm6Vyv375Qnz0FrQ0soGBPzI/jYOaO1kNA0ct9/eNYAPDyOufpDHyYFhCtjjlp78eWuRh03CMRBzfB4DxQOJGzHc1mPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1DeUI1g3rPfnIV8odTkqRkw+ra9p58LbvQfq1BT3Gg=;
 b=K8wxDoln2Rp6Iv/DwyU0yuOPn8oGrk13r29ZjPD3yU8PFNUz/gun9V1GPMjuiahIqMBeOXYG4gnee5nhJMxcB7NrSmHiIvCY0wtZZlQ6DA4LEQN9bY8e4Nz37TfUfAPp+Qj1Ie9LnzTiVde0MsqhyIhNCoKHS8HrhDl284zW9l5bFwv8yy56yPUD9kPpqS62EvvWO3XTaNlkt1MDsJlhIEe+EVMzw3pymtYmfkibukh3/hGyw5ZHcN+XIMOkhF+3tIZR28p6AJt7q5UOkq5Eg/n+btIsXIvBHX2OaDsLhDx6WHQyfYOidiWxFmAkq4+X73XGMkruI/m3nr4ZVgvWFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1DeUI1g3rPfnIV8odTkqRkw+ra9p58LbvQfq1BT3Gg=;
 b=Vi9e+bDwcBsczc9ruzZMuyT3dUT/MJ9rebjbEsA/kMRzXKohCKA+Uc9JccBINGVC+0Wn6iuZMqYaccGLwhTT4Py/CMxwQvioTX1Q4WRw1VfpT5U4ZTa6FyKduZ/S2YdI3Rzepf76WXciGhTIeC8GIl9wP5p/k0vQLgzAQOsJla8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5149.namprd12.prod.outlook.com (2603:10b6:5:390::14)
 by DM4PR12MB5344.namprd12.prod.outlook.com (2603:10b6:5:39f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.16; Wed, 5 Jan
 2022 15:22:32 +0000
Received: from DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::14cd:f56f:bac0:a862]) by DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::14cd:f56f:bac0:a862%5]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 15:22:32 +0000
Subject: Re: [Patch v4 18/24] drm/amdkfd: CRIU checkpoint and restore xnack
 mode
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
 <20211223003711.13064-19-rajneesh.bhardwaj@amd.com>
From: philip yang <yangp@amd.com>
Message-ID: <6e5d64da-3081-a8f3-398c-6e12d18c8507@amd.com>
Date: Wed, 5 Jan 2022 10:22:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211223003711.13064-19-rajneesh.bhardwaj@amd.com>
Content-Type: text/html; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR08CA0010.namprd08.prod.outlook.com
 (2603:10b6:610:5a::20) To DM4PR12MB5149.namprd12.prod.outlook.com
 (2603:10b6:5:390::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b541ccc0-892d-4639-1e7f-08d9d05f317d
X-MS-TrafficTypeDiagnostic: DM4PR12MB5344:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB5344CD536376397F24BF187DE64B9@DM4PR12MB5344.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YtUhDwmzbkEn4+6c0s4hEqZsQEwt0aEEJYF5Je/EwGiu+cKVurRFyOrzB80C1h70fWSy833t+P3SiSf1ckacPgW7XOuOExIzhSc3sZ2msWT98Jh3R8yob8FhYXg/tMNxYC2WaI/C2JmZX6xBpfBGBI5ygoS6W78prys5tAwMv2lu7ujO+A+BqiyFO1W5Bdd//Cl8xznVPZa5G8zxO8GZ2Q7EZnEPNS3J2ucA39Yb8UFhOPHLWTZMvF/zDUarZ0Nn5UWf2Oe0ti+g0n89OKc9R2qRRmYJk72nf4u1M6T99vIGHKC2l4R647UDSBnhuFtdYBHEZBfv8y+X8jz9yrCwTz4mFzlT3YuQ4rSxSyxRU/S0e8xPWaEd9So2GwxfVBbOqbBAKlqAiartGES+eyuOs976K6HkgM+/G7I8M30czl6yh361C8XTPBsFLHZAxpns5iH3rsyjniVKJNTLHPK6sGXT+ZwI2V+m7PpSi9pQeBMDumFx2lf4ilsw8hWG7XzEbLFAifsQXy9KRAylhj7sDvs7H7ZAMHcAFl477RvfioLx10YU23wvliUId8J4uTt5rVXaOmETUUxtHRUOFJ2121ScsJe0reLVJUuuqWqdPRpW3uKG2c54YCfK+aVqx7v6G2Y8aCuaNPGd6vEY9VHnZl6SRge4eKeYuphFXmAFr72e29QBCNQR3UIYkCKM6VqGd91oAy8sMiTZOuILftpzXGgdfSaoWtR1t2+qC6reLsk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5149.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(2906002)(6486002)(26005)(6506007)(36756003)(2616005)(66556008)(66476007)(66946007)(316002)(31686004)(8676002)(8936002)(31696002)(38100700002)(186003)(6512007)(508600001)(53546011)(4326008)(5660300002)(4001150100001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVBKd2gyYkhxdVZoZHFseUoyMVJ2NkJnVUFLZjRSNTRIbSswOHVFMHdKR09O?=
 =?utf-8?B?L0gyQjU0Rm1QdFI5QUdiY0pqREVtZ0E3Z1RWbHRRUDhuK2ZFenVWNVh3emsr?=
 =?utf-8?B?TENrS09lN0pKRi9heW9oNDBSTjl4TWhRSUNJSlFDS0F3ZlEya3o1ZkdMdytU?=
 =?utf-8?B?WjdjRmJMU1RjeXNSeUtEOWlyTXMxZjhIcDAveFV0bXE3eTl0VEV5R3pNbWYr?=
 =?utf-8?B?cTU4emp5SCt4NnRpdGdjRHlEUGJJT0xuZjRNSEUwSFZsVWxlcUJoQmlvT3pu?=
 =?utf-8?B?U2Vqc3lvSld5bFFsSGZ4OEFxdUQ2eTM2L2VXV1AvTGNVWmNqclFwVU0xSFdw?=
 =?utf-8?B?aDdSWEQwL1h6N0tYTkRUcnNGcnh0TnFFejFoZXl5S0lHTHloYW1uQnV6clJM?=
 =?utf-8?B?eWV2OU9BaTZaMjM1WEw5dGhHTDlzaHQ0ZW9XQkRkZXl3WXpMZGVtNzlHNjhN?=
 =?utf-8?B?d29lL21VcU1KdFVzN0hEamcyR0dPUXBlTXhhSGZIK0w2dUNtZlVCR0lrQ3JI?=
 =?utf-8?B?Qkk2VndSNGVISlY2dGdIdnJtNHFXQUhTMXRrd29jd2tQRThSZHowS1BGTEZB?=
 =?utf-8?B?VGVqRWE5ZldCOUlsRWYzSGpBcFdYWk1kQmcxWEI0S2t5NEg3SHM3S0hJSVFk?=
 =?utf-8?B?RFJsYkduMVdmTVhSa3NJaWxUWSt5UmoxbnNPeUhzNlN4NjNZRnVSR09PY1hE?=
 =?utf-8?B?emt4dlJYWlVUNjNsaDFJRTNlMkplZWcyNHU5amYvWE8ydDRqRmFvNWRsUmhK?=
 =?utf-8?B?NnExME5ybk1FUTJFbEpuTXdkVXgrOGZnaS9hb2hzYmZzcThsd3JSYmVGNU0x?=
 =?utf-8?B?dm1sMDAwYjBmdHpkb2t6U2tWbzkzM2lBbU8xOVVhamFLbGNxOVgzZUpyeFgz?=
 =?utf-8?B?WGRrNllCRCtGTnV2alM3LzcwQUtjRmh5eml0SmIyMHFFSEZRU29GRXUrRWpX?=
 =?utf-8?B?ZXFjVWNLbXg1OHFlQkwxRkhOS1JmSkVlOTY3VW16V3hTUW5heHZIRTRCRGho?=
 =?utf-8?B?ak9PaFh3Ym1ReHRaaU5LTTgzajhuT3NBdUhRTEU4OTJndmpJa1FrSDZZUkY4?=
 =?utf-8?B?RVVPRExWb210MXVVOGxOQkNMRUQ5cm5PMUU3NVhtVXdUSmQ5eEFUTVpKV2tF?=
 =?utf-8?B?Z04xWlhxR2ZZdVM0NjBmSWl6UFZyMmdJMzI4Y09DR2s0dC9tdkR0TTlweVRV?=
 =?utf-8?B?SlBQYkduQ3dsTlMyNzBtZE5UcSs0K0tQdkVZaExacEorUmdCdUFvVXZ3aG4v?=
 =?utf-8?B?aDB4SHZCa3hyWTJWMFdZYk1iNmszTUdTSUpSVFhkbWtSYUlxSUZtL1QvVy9T?=
 =?utf-8?B?cjc4a3Jwd3FFMmlJRE5NOWRleG9SRWtpdHpCaTZhWHA3ZHhHVjJBcC83U3px?=
 =?utf-8?B?NDJUUnJMS0E1TlpoWkRNaURia3FJSkxkNi9PTXUyNytFeU1GY2cyeUVRY2U0?=
 =?utf-8?B?eFNYZnpiU0R5cS81R2dNV25lcnhBdi9nS0lUUVpJTlFIS0VwU1dIQ0Fsd05y?=
 =?utf-8?B?WWFJNEQ2UmQvZ2tNM3h2OG5rendESGc1Zm5FZHRyUk5MODErajBlZ3pRQkNM?=
 =?utf-8?B?SWhhaUQxNEs0bFgxZmdxaStvaFhZQUxSR2phNUsrOGFBNngwY2JLRVBvZmty?=
 =?utf-8?B?NWQzSlFGTFoxWFJXK2xubjdMaklaYXZDU2FyTlI4RDg2dkwvekVkWDdrbXBp?=
 =?utf-8?B?akcrQ0hVMVZDY3p0WGQ1dFBNNHVWOE5zb0x3djZzSGpZRGFhN2hCb3h2Y0M3?=
 =?utf-8?B?aXZmSzRva3NSaW1XRm1vZlhwTzR2NFhhWndQSWdQVGMvTGtvaFJ3SW1seEUx?=
 =?utf-8?B?UWUyQmZ1RXRvRzFiUm1Nd1dKTm02Z3RYREl0VFRSVEMzNEpNc3FLSDJDMUhE?=
 =?utf-8?B?dTJpK3NhQWtQUjlSbXk1WkkxY0RrbDQxaEtYSHZpRjRFb3FUc1Y1UkpoVEp1?=
 =?utf-8?B?QmVpVytpaDBFc3ZJZktmQnh0M2ZrNk1yYkRJSFVGOWJQOElPckNvWmNMRXp4?=
 =?utf-8?B?UHgrcTJ4WGFURyt6bDcwWkh3UnBIY29hQVE2THJuQjFhT0dad2cwTWI0cjRF?=
 =?utf-8?B?eGF3THZ3MUNjVnJEWUlWeEVEYnEvRm1JUU5xT0RQcUhESjlxYWFsMW9hNFFi?=
 =?utf-8?Q?ccSc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b541ccc0-892d-4639-1e7f-08d9d05f317d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5149.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 15:22:32.1639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLOMxcHigAmOseM+LRwGo6BIpexbECgIRMrYwY2yDL9rkvjwCqC4sSN6VI8hz9K1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5344
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
Cc: alexander.deucher@amd.com, daniel.vetter@ffwll.ch, felix.kuehling@amd.com,
 christian.koenig@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-12-22 7:37 p.m., Rajneesh
      Bhardwaj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20211223003711.13064-19-rajneesh.bhardwaj@amd.com">
      <pre class="moz-quote-pre" wrap="">Recoverable page faults are represented by the xnack mode setting inside
a kfd process and are used to represent the device page faults. For CR,
we don't consider negative values which are typically used for querying
the current xnack mode without modifying it.

Signed-off-by: Rajneesh Bhardwaj <a class="moz-txt-link-rfc2396E" href="mailto:rajneesh.bhardwaj@amd.com">&lt;rajneesh.bhardwaj@amd.com&gt;</a>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 15 +++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 178b0ccfb286..446eb9310915 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1845,6 +1845,11 @@ static int criu_checkpoint_process(struct kfd_process *p,
 	memset(&amp;process_priv, 0, sizeof(process_priv));
 
 	process_priv.version = KFD_CRIU_PRIV_VERSION;
+	/* For CR, we don't consider negative xnack mode which is used for
+	 * querying without changing it, here 0 simply means disabled and 1
+	 * means enabled so retry for finding a valid PTE.
+	 */</pre>
    </blockquote>
    Negative value to query xnack mode is for kfd_ioctl_set_xnack_mode
    user space ioctl interface, which is not used by CRIU, I think this
    comment is misleading,<br>
    <blockquote type="cite" cite="mid:20211223003711.13064-19-rajneesh.bhardwaj@amd.com">
      <pre class="moz-quote-pre" wrap="">
+	process_priv.xnack_mode = p-&gt;xnack_enabled ? 1 : 0;</pre>
    </blockquote>
    change to process_priv.xnack_enabled
    <blockquote type="cite" cite="mid:20211223003711.13064-19-rajneesh.bhardwaj@amd.com">
      <pre class="moz-quote-pre" wrap="">
 
 	ret = copy_to_user(user_priv_data + *priv_offset,
 				&amp;process_priv, sizeof(process_priv));
@@ -2231,6 +2236,16 @@ static int criu_restore_process(struct kfd_process *p,
 		return -EINVAL;
 	}
 
+	pr_debug(&quot;Setting XNACK mode\n&quot;);
+	if (process_priv.xnack_mode &amp;&amp; !kfd_process_xnack_mode(p, true)) {
+		pr_err(&quot;xnack mode cannot be set\n&quot;);
+		ret = -EPERM;
+		goto exit;
+	} else {</pre>
    </blockquote>
    <p>On GFXv9 GPUs except Aldebaran, this means the process
      checkpointed is xnack off, it can restore and resume on GPU with
      xnack on, then shader will continue running successfully, but
      driver is not guaranteed to map svm ranges on GPU all the time, if
      retry fault happens, the shader will not recover. Maybe change to:<br>
    </p>
    <p>If (KFD_GC_VERSION(dev) != IP_VERSION(9, 4, 2) {</p>
    <p>&nbsp;&nbsp;&nbsp; if (process_priv.xnack_enabled != kfd_process_xnack_mode(p,
      true)) {<br>
    </p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_err(&quot;xnack mode cannot be set\n&quot;);<br>
    </p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = -EPERM;<br>
    </p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto exit;</p>
    <p>&nbsp;&nbsp;&nbsp; }<br>
    </p>
    <p>}<br>
    </p>
    <p>pr_debug(&quot;set xnack mode: %d\n&quot;, process_priv.xnack_enabled);<br>
    </p>
    <p>p-&gt;xnack_enabled = process_priv.xnack_enabled;</p>
    <br>
    <blockquote type="cite" cite="mid:20211223003711.13064-19-rajneesh.bhardwaj@amd.com">
      <pre class="moz-quote-pre" wrap="">+		pr_debug(&quot;set xnack mode: %d\n&quot;, process_priv.xnack_mode);
+		p-&gt;xnack_enabled = process_priv.xnack_mode;
+	}
+
 exit:
 	return ret;
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 855c162b85ea..d72dda84c18c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1057,6 +1057,7 @@ void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
 
 struct kfd_criu_process_priv_data {
 	uint32_t version;
+	uint32_t xnack_mode;</pre>
    </blockquote>
    <p>bool xnack_enabled;</p>
    <p>Regards,</p>
    <p>Philip<br>
    </p>
    <blockquote type="cite" cite="mid:20211223003711.13064-19-rajneesh.bhardwaj@amd.com">
      <pre class="moz-quote-pre" wrap="">
 };
 
 struct kfd_criu_device_priv_data {
</pre>
    </blockquote>
  </body>
</html>

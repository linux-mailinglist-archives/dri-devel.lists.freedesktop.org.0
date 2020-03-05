Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE1217A77B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 15:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86B16EBCB;
	Thu,  5 Mar 2020 14:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB546EBCA;
 Thu,  5 Mar 2020 14:32:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmMVlA6S9Ypix1Tx78mBYehWZVUZnbRLevITSIfrXLZKJnXZ099gH//YSC8PScYvnjp5Zv/N07tzsr7+t1JFuDB7nSi4+x4LdncMT0bcOYru4UvKFiQtYo57ujfrmueKNeIomvXx6UxkMB5xkjJVSsl2g+8Avco0jtSdfIEPJilUJNe3tf+0M/Ot3UasvA7iU4QgVdwoFEvrmwgg2cOslef7LQ6KpnV1Zl5bISo4KScZi8WxfdntiI3mcXJr3opq/BqxhPVtRmRNVXmr0uATirBh109WdauEsLdQa5+KonwuB5cSz5wyMOT/JM8GZ3oEdt9TawfAvigT44ubVjoSOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaAmdI/nuVAIiQZWW/E4tOW2vGwv1CwM7aVvO1VI0E8=;
 b=GCfVtH6/xXBsXobxjxH8ZOwmD1qF6xr4S7rvgAJBfKnWw/zXVW19YxZzHpqbhA1tp59Jy5uXGnSRcnqkpElAml7Nxc7Ax9u1clNNpsJpSFcnTnTZChrq1n/5QftAL3CiBOeRKS3alFQnQCa3n4aCrPHv4UT1SrY34kqBiFprXC5kRh6YA7rs9BBSxZfL93YjxEQ/foNmoPG2IcvVM1jeElI7u9BtKEzM20X7SVbtsgQHYhnIzCs/Xwa0dyzBNhIe9V6KLnc+XHSqsNpxgSsKwyAk939bSxVSeOI4irHpuXeuloTXVUDxzh51DVik9mm7ZSUORKCuBxcvGMXMMaCR8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaAmdI/nuVAIiQZWW/E4tOW2vGwv1CwM7aVvO1VI0E8=;
 b=bO3ODJPiMDdI9wuTOYta3RolegSpuP1ipcKVDWGVIgd6CJQva4vH0rOEN5RJc2hkrWXKl03NzRML+9nQGW3oH7K8IYihAi5FJx50CllHtcZUgWQ0lKEVrwMfNz4ra3HwpfxXZ4wW657PjSEeHVJcwHZUdWmVNLkMyNKZ6HltYyI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (2603:10b6:4:b9::11) by
 DM5PR12MB1466.namprd12.prod.outlook.com (2603:10b6:4:d::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.15; Thu, 5 Mar 2020 14:32:36 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904%4]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 14:32:36 +0000
Subject: Re: [PATCH 6/8] drm/vram-helper: don't use ttm bo->offset v3
To: Gerd Hoffmann <kraxel@redhat.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>
References: <20200305132910.17515-1-nirmoy.das@amd.com>
 <20200305132910.17515-7-nirmoy.das@amd.com>
 <20200305140749.5oggp4gh6hozsh7j@sirius.home.kraxel.org>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <3f6148c1-8357-0f18-3bda-bd989ac26393@amd.com>
Date: Thu, 5 Mar 2020 15:35:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <20200305140749.5oggp4gh6hozsh7j@sirius.home.kraxel.org>
Content-Language: en-US
X-ClientProxiedBy: AM0PR07CA0007.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::20) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f2e:a500:1f22:cf19:9085:11a1]
 (2003:c5:8f2e:a500:1f22:cf19:9085:11a1) by
 AM0PR07CA0007.eurprd07.prod.outlook.com (2603:10a6:208:ac::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.8 via Frontend Transport; Thu, 5 Mar 2020 14:32:33 +0000
X-Originating-IP: [2003:c5:8f2e:a500:1f22:cf19:9085:11a1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 60bb7765-c9dd-441a-7a45-08d7c1120cb1
X-MS-TrafficTypeDiagnostic: DM5PR12MB1466:|DM5PR12MB1466:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB146604B7B785ADDB7EA9B0248BE20@DM5PR12MB1466.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03333C607F
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(189003)(199004)(6666004)(31686004)(316002)(31696002)(2616005)(478600001)(16526019)(7416002)(186003)(4326008)(8936002)(81156014)(5660300002)(6486002)(33964004)(52116002)(8676002)(53546011)(81166006)(2906002)(110136005)(36756003)(66946007)(66476007)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1466;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E3mUFlCQeumM8Mt4YUBlJimAS2HHrov4BsJA5Rp2qLyZ/7ssDmQhJjVmH1rQbL9NBS8AKttRwS8jtb8obI5LUGud0HVyfpt8ljTVN+4cSs+aSrovFfhu/jTsLOCN43G3VG5zKnv5NK7LGfu0q9fdxmhADZ8pz/gIRHtot+5VwfX8q2yyyolHM+u6md+QFAG1h7r9RFMbu2MK54hVcH01n7+/TKKht6HfRFvcC4G1v3+UIG3BPttoN+Xn/WysynJcPh06CB53yIAu8jgTH0sJ3yW7W2eWMWxZS6+R/2mvKoyJ7BsnbPk9YhSbb3bzm/EfLrSI4/Tx2ZnzO/b4lskKwPivrnwArAUuAE4riFv7hr7x5zITtZRgyNzYUD2/cldkM3QpskOPjV8YP164PQxycttr/oMBg8uj4AApqqyhfZ218XCllmwmqb12tu+4JylS
X-MS-Exchange-AntiSpam-MessageData: 9Jfd/7MFjy0gfvMZhSqAtFlKD7Bcj0XKvKesE9fnVtI5LDVC7e7Jji48asxb8PGanLKuSm+Tb3yN+YJwA8A8Y+rCE6KoSPb7yOQpaPDzO4w6cj+PJuasNY8gSiiXKPxH+owXjJfXyAh1GBsNvyRa3FTw1D8MpCKYGv6zmfUHJIkYtA2HMR0mQC5bn34ctuhAKdKS6kPHViSZtUxiUD7XhQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60bb7765-c9dd-441a-7a45-08d7c1120cb1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2020 14:32:36.4433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BRi4rI/khbWrrpgaOvLAoV8U6jcMR42WUN/hPKkw19sISQumXv42uIMwIxiNIw6zrTGKn816rXh1D/twCnclgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1466
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
Cc: thellstrom@vmware.com, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, dri-devel@lists.freedesktop.org,
 nirmoy.das@amd.com, linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>, alexander.deucher@amd.com,
 sean@poorly.run, christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============0368985379=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0368985379==
Content-Type: multipart/alternative;
 boundary="------------98BB5987DE63DF21E2A1B411"
Content-Language: en-US

--------------98BB5987DE63DF21E2A1B411
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/5/20 3:07 PM, Gerd Hoffmann wrote:
> On Thu, Mar 05, 2020 at 02:29:08PM +0100, Nirmoy Das wrote:
>> Calculate GEM VRAM bo's offset within vram-helper without depending on
>> bo->offset.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>>   drivers/gpu/drm/drm_gem_vram_helper.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
>> index 92a11bb42365..2749c2d25ac4 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -198,6 +198,13 @@ u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo)
>>   }
>>   EXPORT_SYMBOL(drm_gem_vram_mmap_offset);
>>
>> +static s64 drm_gem_vram_pg_offset(struct drm_gem_vram_object *gbo)
>> +{
>> +	if (WARN_ON_ONCE(!gbo->bo.mem.mm_node))
>> +		return 0;
> returns 0 on error.

I am not sure if we should call this an error. This patch series removes 
below offset calculation from ttm_bo.c.

-	if (bo->mem.mm_node)
-		bo->offset = (bo->mem.start << PAGE_SHIFT) +
-		    bdev->man[bo->mem.mem_type].gpu_offset;
-	else
-		bo->offset = 0;
-

Most of the driver sets "bo->mem.mm_node". Thomas suggested to use this 
"return 0" in case some driver depends on bo->offset = 0.

>
>> +	return gbo->bo.mem.start;
>> +}
>> +
>>   /**
>>    * drm_gem_vram_offset() - \
>>   	Returns a GEM VRAM object's offset in video memory
>> @@ -214,7 +221,7 @@ s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo)
>>   {
>>   	if (WARN_ON_ONCE(!gbo->pin_count))
>>   		return (s64)-ENODEV;
> returns -errno on error.
>
>> -	return gbo->bo.offset;
>> +	return drm_gem_vram_pg_offset(gbo) << PAGE_SHIFT;
> And given that one calls the other behavior on error should better be
> consistent ...
>
> cheers,
>    Gerd
>

Regards,

Nirmoy


--------------98BB5987DE63DF21E2A1B411
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/5/20 3:07 PM, Gerd Hoffmann wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200305140749.5oggp4gh6hozsh7j@sirius.home.kraxel.org">
      <pre class="moz-quote-pre" wrap="">On Thu, Mar 05, 2020 at 02:29:08PM &#43;0100, Nirmoy Das wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Calculate GEM VRAM bo's offset within vram-helper without depending on
bo-&gt;offset.

Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@amd.com">&lt;nirmoy.das@amd.com&gt;</a>
Reviewed-by: Daniel Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel.vetter@ffwll.ch">&lt;daniel.vetter@ffwll.ch&gt;</a>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 9 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 1 file changed, 8 insertions(&#43;), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 92a11bb42365..2749c2d25ac4 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
&#43;&#43;&#43; b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -198,6 &#43;198,13 @@ u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo)
 }
 EXPORT_SYMBOL(drm_gem_vram_mmap_offset);

&#43;static s64 drm_gem_vram_pg_offset(struct drm_gem_vram_object *gbo)
&#43;{
&#43;	if (WARN_ON_ONCE(!gbo-&gt;bo.mem.mm_node))
&#43;		return 0;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
returns 0 on error.</pre>
    </blockquote>
    <p>I am not sure if we should call this an error. This patch series
      removes below offset calculation from ttm_bo.c. <br>
    </p>
    <pre class="moz-quote-pre" wrap="">-	if (bo-&gt;mem.mm_node)
-		bo-&gt;offset = (bo-&gt;mem.start &lt;&lt; PAGE_SHIFT) &#43;
-		    bdev-&gt;man[bo-&gt;mem.mem_type].gpu_offset;
-	else
-		bo-&gt;offset = 0;
-

</pre>
    <p><font size="&#43;1">Most of the driver sets &quot;bo-&gt;mem.mm_node&quot;.
        Thomas suggested to use this &quot;return 0&quot; in case some driver
        depends on bo-&gt;offset = 0.</font></p>
    <pre class="moz-quote-pre" wrap=""></pre>
    <blockquote type="cite" cite="mid:20200305140749.5oggp4gh6hozsh7j@sirius.home.kraxel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">&#43;	return gbo-&gt;bo.mem.start;
&#43;}
&#43;
 /**
  * drm_gem_vram_offset() - \
 	Returns a GEM VRAM object's offset in video memory
@@ -214,7 &#43;221,7 @@ s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo)
 {
 	if (WARN_ON_ONCE(!gbo-&gt;pin_count))
 		return (s64)-ENODEV;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
returns -errno on error.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-	return gbo-&gt;bo.offset;
&#43;	return drm_gem_vram_pg_offset(gbo) &lt;&lt; PAGE_SHIFT;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
And given that one calls the other behavior on error should better be
consistent ...

cheers,
  Gerd

</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Nirmoy<br>
    </p>
  </body>
</html>

--------------98BB5987DE63DF21E2A1B411--

--===============0368985379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0368985379==--

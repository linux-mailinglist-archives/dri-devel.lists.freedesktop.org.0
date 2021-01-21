Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5272FFE88
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F526E9C5;
	Fri, 22 Jan 2021 08:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1851 seconds by postgrey-1.36 at gabe;
 Thu, 21 Jan 2021 09:40:20 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1733389A62
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 09:40:20 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10L91lQD055285; Thu, 21 Jan 2021 04:09:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MIROihBdMjJIKhC+tSW35NZfjljBZpxTZ8W3u2vfuks=;
 b=cqRzMTKhA3pIGU3ja/nPBQ6238mE5b0d+97NdxaDtJ0tRYkjJhOzCXL1l8aCxifmwgHZ
 qVqUV9k4C78ZhZ8vhRFP9BV1FUriz1RCcRWz75zyk8r16N0xIB45wuRmXRN0rz2gNGuh
 9xI9gSwtCZRGiqGZja8/wiPFBGZaWbf8cb77ZnkugirJOus/GoiCHgp0O4Y0vR6eTf6w
 x0UE0OMgnznKtW3mkZm9BSyMHsUrMoZg/X/OkEe0Np5Idkzq1pw87HgoNiS0qvfdtz+q
 Za9YfQC5j3kAQO5AReZU5Kg+Ey1AJSsZiwlpRdP9jg2L+zi7vRuWnAXR5IFlwn6BW8iR sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3675ych8rm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 04:09:24 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10L92YCS057489;
 Thu, 21 Jan 2021 04:09:23 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3675ych8qs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 04:09:22 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10L97s4S031626;
 Thu, 21 Jan 2021 09:09:20 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3668pasfrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 09:09:20 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10L99Ilw32506304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 09:09:18 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EFD5A4066;
 Thu, 21 Jan 2021 09:09:18 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A859FA405F;
 Thu, 21 Jan 2021 09:09:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jan 2021 09:09:17 +0000 (GMT)
Received: from [9.81.210.19] (unknown [9.81.210.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9A4B160167;
 Thu, 21 Jan 2021 20:09:15 +1100 (AEDT)
Subject: Re: [PATCH 01/13] powerpc/powernv: remove get_cxl_module
To: Christoph Hellwig <hch@lst.de>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Yu <jeyu@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>
References: <20210121074959.313333-1-hch@lst.de>
 <20210121074959.313333-2-hch@lst.de>
From: Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <a9e53c05-cfb9-2946-542d-4acda109a49d@linux.ibm.com>
Date: Thu, 21 Jan 2021 20:09:02 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121074959.313333-2-hch@lst.de>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-21_03:2021-01-20,
 2021-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210045
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, live-patching@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/1/21 6:49 pm, Christoph Hellwig wrote:
> The static inline get_cxl_module function is entirely unused,
> remove it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

The one user of this was removed in 8bf6b91a5125a ("Revert 
"powerpc/powernv: Add support for the cxl kernel api on the real phb").

Thanks for picking this up.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

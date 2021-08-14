Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C043EC2F8
	for <lists+dri-devel@lfdr.de>; Sat, 14 Aug 2021 15:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3046E837;
	Sat, 14 Aug 2021 13:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 346 seconds by postgrey-1.36 at gabe;
 Sat, 14 Aug 2021 12:52:24 UTC
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AEF6E831;
 Sat, 14 Aug 2021 12:52:24 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17ECZp6b163025; Sat, 14 Aug 2021 08:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : content-type : mime-version; s=pp1;
 bh=KmjHG+r93Hi+L0c9AvfW8xBT7Wuv/yTASnvzpU8Lu5o=;
 b=AIbgQSXLOBKWhftlWvmPMZeyXtISUyXELdE0bcwkC2Ot9/4dS75UF5ZRzkvSlZ9hd8E9
 17Kq7AqSDIRmf5PANn3WOzemwxO5KewQ/KlD+8jGY4PQEdswV7Us87YVXe3LriX9xWRN
 8J1O+1dS3E8xC1ZzS/eiT9B9kBzvwMuaxv91hziRu7THLITS28xtP4HhhuWdKTm8HQIo
 40IgxJoHtFgTR/YtV2GXC5Jj6ozoOxHvP7BKA22O9IxOkKIEm61WnwnrAVYIiBxeJ6f2
 IGc4qci/aQBBM+AjWmA20l+cApdCYPVuLwGARp60VL/thDSLn9Ec8fmI0DSnOudC4gq+ Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ae9w2ku0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Aug 2021 08:46:33 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17ECh31E184167;
 Sat, 14 Aug 2021 08:46:33 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ae9w2ku09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Aug 2021 08:46:33 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17ECiFLr017259;
 Sat, 14 Aug 2021 12:46:31 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3ae5f88ckh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Aug 2021 12:46:31 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17ECkTcq55902478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 14 Aug 2021 12:46:29 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 304575204F;
 Sat, 14 Aug 2021 12:46:29 +0000 (GMT)
Received: from osiris (unknown [9.145.44.44])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id D2FF152051;
 Sat, 14 Aug 2021 12:46:28 +0000 (GMT)
Date: Sat, 14 Aug 2021 14:46:27 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Dave Airlie <airlied@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [BUG - BISECTED] display not detected anymore
Message-ID: <YRe7I67h4gMVOWuu@osiris>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nPgM4dBHirfyZ4kqfW7WhLMo7cZxL4sX
X-Proofpoint-GUID: BzjyakpaPXQtwgKXtRg-yea5mK2AN-hV
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-14_02:2021-08-13,
 2021-08-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 clxscore=1011 adultscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108140076
X-Mailman-Approved-At: Sat, 14 Aug 2021 13:47:15 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

I have Fedora 33 running, and with the Fedore kernel update from 5.11
series to 5.12 my external monitor was not detected anymore. Same is
true with the Fedora supplied 5.13 kernel version.

So I tried with vanilla kernel 5.11 and latest git head from Linus'
tree. 5.11 works while latest git head does not. Bisecting the problem
points to commit 32c3d9b0f51e ("Merge tag 'drm-intel-next-2021-01-27'
of git://anongit.freedesktop.org/drm/drm-intel into drm-next").

Unfortunately it is a merge commit, so it looks like conflicting
changes have been made in the parent branches.

Hardware in use:

- ThinkPad X1 Yoga 4th / Carbon 7th
- Intel(R) Core(TM) i5-8265U CPU @ 1.60GHz

The Thinkpad is connected to a ThinkPad Thunderbolt 3 Dock with a
Thunderbolt cable and a monitor (Eizo EV3285) is connected via
Displayport to the docking station.

The monitor is detected and works without any problems (4k@60HZ)
before the above mentioned merge commit. With the commit and
afterwards it is not detected anymore and only the Thinkpad builtin
display can be used.

Any idea what went wrong? I can provide more information, or test
debug patches if wanted. Just let me know.

Thanks,
Heiko

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A123E9EAFD8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 12:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BC010E8AC;
	Tue, 10 Dec 2024 11:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="GTU+clBP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB3710E2B5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 17:36:25 +0000 (UTC)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9CNZvm030669;
 Mon, 9 Dec 2024 17:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=TvXjD5
 sYjVjwVQKUFAm5ajrLGlsD4EPwD6ySYHNV9y0=; b=GTU+clBPgWoKiThNubTyx9
 6OsyBvbc0LvJtUJ94ybICM8GbhTAvKJlsAS6ST91rcozg9O+PAsHndvx10R5cH97
 gD9HfBItn/hIsCOpKq7Nqt0mGP4JJb6gNMV2O8ygJwXWvmcBCWSMXT3tB1LksUNd
 2FzVWgD0Ls0ByT5Ig5Kj526FYsBOIVqt6ZTvcFwhzt13IxoHh/O3PuoTQj3rMnHx
 bbLFClMX5wVnh5ZpnnVOp1PBvzHPAVEpzfAEv0o2v8yB4Tyxi5U3EfBYnoa1g9hD
 k5+DwbdsVdKMS8dyL4bj2ESP6GKyr0pBA7in4bHt3l8Tb9v/UvPvnljcIPL0oMMw
 ==
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ccsj9w16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2024 17:36:15 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9FbdWI023018;
 Mon, 9 Dec 2024 17:36:15 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43d2wjqdrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2024 17:36:14 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 4B9HaDfg22872490
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Dec 2024 17:36:13 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58F6D20043;
 Mon,  9 Dec 2024 17:36:13 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E31620040;
 Mon,  9 Dec 2024 17:36:13 +0000 (GMT)
Received: from p-imbrenda (unknown [9.152.224.66])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Dec 2024 17:36:13 +0000 (GMT)
Date: Mon, 9 Dec 2024 18:36:11 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-s390@vger.kernel.org
Subject: Re: Removing page->index
Message-ID: <20241209183611.1f15595f@p-imbrenda>
In-Reply-To: <cebb44b2-e258-43ff-80a5-6bd19c8edab8@redhat.com>
References: <Z09hOy-UY9KC8WMb@casper.infradead.org>
 <cebb44b2-e258-43ff-80a5-6bd19c8edab8@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HBnYQoZuWsDnCU7JE8hIozGZoBz_2fKN
X-Proofpoint-ORIG-GUID: HBnYQoZuWsDnCU7JE8hIozGZoBz_2fKN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=890
 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412090136
X-Mailman-Approved-At: Tue, 10 Dec 2024 11:26:10 +0000
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

On Wed, 4 Dec 2024 16:58:52 +0100
David Hildenbrand <david@redhat.com> wrote:

> On 03.12.24 20:51, Matthew Wilcox wrote:
> > I've pushed out a new tree to
> > git://git.infradead.org/users/willy/pagecache.git shrunk-page
> > aka
> > http://git.infradead.org/?p=users/willy/pagecache.git;a=shortlog;h=refs/heads/shrunk-page
> > 
> > The observant will notice that it doesn't actually shrink struct page
> > yet.  However, we're getting close.  What it does do is rename
> > page->index to page->__folio_index to prevent new users of page->index
> > from showing up.  
> 
> BTW, I was wondering how often we convert a page to a folio to then 
> access folio->index / folio->mapping and not actually having a folio (in 
> the future).
> 
> I suspect this will need quite some changes to get it right, and I would 
> count that as "less obvious".
> 
> Calling PageAnon() on anything mapped into user space page tables might 
> be one such case, for example.
> 
> > 
> > There are (I believe) three build failures in that tree:
> > 
> >   - fb_defio
> >   - fbtft
> >   - s390's gmap (and vsie?  is that the same thing?)  
> 
> Not completely (vsie (nested VMs) uses shadow gmap, ordinary VMs use 
> ordinary gmap) , but they are very related (-> KVM implementation on s390x).
> 
> I know that Claudio is working on some changes, but not sure how that 
> would affect gmap's usage of page->index.

After I'm done, we won't use page->index anymore.

The changes I'm working on are massive, it's very impractical to push
everything at once, so I'm refactoring and splitting smaller and more
manageable (and reviewable) series.

This means that it will take some time before I'm done (I'm *hoping*
to be done for 6.15)

> 
> s390x gmap is 64bit only, so we have to store stuff in 8byte. gmap page 
> tables are
> 
> Maybew e could simply switch from page->index to page->private? But I 
> lost track if that will also be gone in the near future :)
> 
> > 
> > Other than that, allmodconfig builds on x86 and I'm convinced the build
> > bots will tell me about anything else I missed.
> > 
> > Lorenzo is working on fb_defio and fbtft will come along for the ride
> > (it's a debug printk, so could just be deleted).
> > 
> > s390 is complicated.  I'd really appreciate some help.
> > 
> > The next step is to feed most of the patches through the appropriate
> > subsystems.  Some have already gone into various maintainer trees
> > (thanks!)
> > 
> > 
> > There are still many more steps to go after this; eliminating memcg_data
> > is closest to complete, and after that will come (in some order)
> > eliminating ->lru, ->mapping, ->refcount and ->mapcount.   
> 
> Will continue working on the latter ;)
> 


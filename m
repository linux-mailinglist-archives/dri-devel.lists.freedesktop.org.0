Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A389838B892
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 22:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CCB6F551;
	Thu, 20 May 2021 20:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1308 seconds by postgrey-1.36 at gabe;
 Thu, 20 May 2021 20:46:34 UTC
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29376F550;
 Thu, 20 May 2021 20:46:32 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14KKI3b7016118; Thu, 20 May 2021 20:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=u4yzBje3ji3WOgUG1+8wNjOD4/vYTNyg7Mdw06F/gNU=;
 b=kjblRdA1BhVVDcE7JCs8cO4ec5cVX+19DOlH047Vdw4ioqZW4Gnje8Mg1ldPMRLlFTV+
 J5enz4YBgJIcujpJc7O3JEkRGFDiWiJe1f0xx2oR7regnQpzdRsMbMSi4G1QN7F6ZLk5
 6gXe0VjKLksvlaVg0REO5ncdGS7mi+Zi0E7uwidVWo+MZlVLevWzCx0l0MnWikR2YXpv
 ohT6U1ye1OjMV/pln/y/Xd7s7wGpnqGG5ccn5Go7zvjnk2cgggUvrjm7yywMNkMXSZq6
 aSuPIAqrvldJgBKsZ5yDrMiPQNImeCHMS+kTovpMkiMeU8KFGTQWSRO81/SMIfmdx6Ww 1w== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 38n4utrm7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 20:24:31 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14KKGcL9190538;
 Thu, 20 May 2021 20:24:30 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
 by aserp3030.oracle.com with ESMTP id 38meeh88pk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 20:24:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLSBGUWJN4tMoI3UkQ2vxp7z9dYIFRoLPxuvwZqFB5ewW3/4GjzbiwJZL5at5hiPSIouAy4lCy80CjXCP007dvwrG9wJF7LUkqQxriWSl+JMs5UQj1XVikBDo3cnO9/AQJtXJhYmLEgh9wPY+iMz0sXpfJ3bOOCncAtZDzA+IQ1If/hHc7c23hbsrz4K+pcCXqZYeawiRVSzrDswoF5zIgUdMWSVSBqhjl9cxys/oS0eDvzjaq5Z69io74cS/2QSU78HCtFsjpxBh7qGqctQ5Ibzlc70dH9sh0S3AvrasJPzWAtGEXQlAl0TSJJxp4dmDxtD6OByx49H4mLqPQdb8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4yzBje3ji3WOgUG1+8wNjOD4/vYTNyg7Mdw06F/gNU=;
 b=nm8xEucUULpUfJct3y36Oj+7Z+Le4iblnjWqclpaNuiKytPHrR/s49zIoHiQxmaE5NBLarJoW6AfATEazUtXhZdRh9cxSVEIVYeCLz5T2b5Y2tZ1faQNnA3SaxAyqZgmlf2nHRpenxQskWrnVvoWFjAudom1TfBErn2vLxzCUz20DipZhN65FeNGP7ZM63NoILfM5LQnWAgGdQGMJsfPZfa0BWD1+UERX/Ugh+Pimr3pDH5mw9xrVbK6UhdDN29oTvIqz0+5cN9eq5uU2GLItJJ93+nLYdNJf2Ctj6D1ikxE+5a0yebJNDtDY1d8KS+5x25HdiSVsXPUHeR4L9Z/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4yzBje3ji3WOgUG1+8wNjOD4/vYTNyg7Mdw06F/gNU=;
 b=0Di0j5z7U+aCbA5lnM2swXk8MmIxZfTgH4MxIVNejN4IPhE9tSHW2gV5eaTfXnxAA1RkrhzxKCNPwkh1T6R3Haov/xGCS+c0ztTcbBHbxnAS/oG043CyWaCi7wsv3S0+af7dPs2n1J6tZ/lt609d3eQU/MPEEpMkkY3GqgLEjIM=
Received: from MWHPR10MB1582.namprd10.prod.outlook.com (2603:10b6:300:22::8)
 by CO1PR10MB4657.namprd10.prod.outlook.com (2603:10b6:303:96::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Thu, 20 May
 2021 20:24:27 +0000
Received: from MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::353a:1802:6e91:1811]) by MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::353a:1802:6e91:1811%8]) with mapi id 15.20.4150.023; Thu, 20 May 2021
 20:24:27 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v8 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Thread-Topic: [PATCH v8 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Thread-Index: AQHXK4oPyN3KgFk4qEysJNDFdITYW6rp6v0AgAEVsYCAAhRygA==
Date: Thu, 20 May 2021 20:24:27 +0000
Message-ID: <20210520202415.r3k6wp7px2idyhc3@revolver>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-4-apopple@nvidia.com>
 <20210518191451.fcjw6tlgow33gxbq@revolver> <73709397.vfl0GBLx1q@nvdebian>
In-Reply-To: <73709397.vfl0GBLx1q@nvdebian>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [23.233.25.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60292c6b-8b40-45bb-bf30-08d91bcd442e
x-ms-traffictypediagnostic: CO1PR10MB4657:
x-microsoft-antispam-prvs: <CO1PR10MB4657E835968E98532655AAE5FD2A9@CO1PR10MB4657.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vMGui6+cVABLz/w2Yk94MX65BU91Fwty+xRs2SS+iWp2RbaNKf3yNHBtDOGjzw7Joo42WN5n6YaT+Govn9zrs1haodCjMcFiEHLvEG4eS8rTZM9dhuhurXmHuVSbKwPEgJw+YzEOvS68Oy5XvWoAxRu7xJglXLzC8zjGWTGMONgrYCu/Hq0LuBBR5dBlTDF4nk0vpC3PaCyEBP+9bAGe8xoQX27vl7MnCifPS5TBXnSP4R7aLgD3Uop47TMufWRYb3AIJsIkvy78uYrsqb4jQOt3jy8ZMnXNTUuf9rexevTds2MBVCqkFREJSdZB/XcPWU4IncoQPtnm+OmcuWsspNxWEcYsHOjXd5r7IjvD1FpgcGXLCfgG1yp/3Ydrx77np9IPxjr4gNOpYzzLaezo2JITrsXdqbAaQNbXEORYUHcfCVTTcNlTi8ZN8vSw7N0kt9SNg7cVZUAKwPUiMRBF3F/jcnBCdgLsNeQ7q3vLXuWDL8HqFrwk1t/Zg+8XB98haCIuvUa9JFfgIibM+Bo+4txQIRFn0x9lSEYJvpdfFoecgkYA4bnYMB8PwUJm+sfff0U9ExCvIYF1Joxsvdd9b59WkvDDreFR6sLkXbEYPISnSOdyEr+y7SpLQ2uMf3stjB1n50LRigaT9PxZom4F4V5k9beTyYkYL96t9x53PK0Aj9iwuSQvVuFuPjlQiSPmeAUgDfYobsgbadDRro0VcCL3TradMpD6uuL7ldlQlhY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR10MB1582.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(376002)(136003)(39860400002)(396003)(346002)(366004)(71200400001)(122000001)(33716001)(6506007)(966005)(8676002)(6916009)(83380400001)(64756008)(76116006)(44832011)(66476007)(66446008)(8936002)(4326008)(26005)(6512007)(86362001)(6486002)(38100700002)(9686003)(1076003)(66946007)(2906002)(5660300002)(91956017)(66556008)(30864003)(7416002)(478600001)(186003)(54906003)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?dRSmQheAjh+JDaR9KBj9MgJiChOrUKYsNkI6UdWJo+NHMyW/ArRjO5oZg7Uu?=
 =?us-ascii?Q?C6Yb6bhyvvciCib+bcPtvOYfwoE6AgbX13JgUxkN36RlEoOP4Cexyxk/xIWB?=
 =?us-ascii?Q?WsBoMbJVwezuA31XKFbifKlPF/WB1tGAFWiVxin76mieRq6biSjfBVjMsEkV?=
 =?us-ascii?Q?DB2wLLBSKdsEtI3n0jilz639I+C5WVMLwzekMaSyktnC/Hw/XgTq3nOU/aQY?=
 =?us-ascii?Q?4OinaWcQ3PgvHVz5MTX3wA6s/6K809BbHNgxCY6UDFAIUoc9ZZ8vR28hF2vH?=
 =?us-ascii?Q?5uVHKvV1/cbxCsOI3LbNIKrFFrkbMzwsejRslOMftSoetjY9LyaKGXceUuVj?=
 =?us-ascii?Q?J4gIbFHnUGGrwyOWH5b6yApUPUwRRI5lkEDHMRRmeCDlIUjiDWsLBHuhuHfH?=
 =?us-ascii?Q?8xageGKo2DZvAJwoeH8por+6E6AD+D6GjFko8clpCNpwu0q12zlYxUWwon2Y?=
 =?us-ascii?Q?HU2g8PzsshkyMuYppDIs8+lJldwvRip2YLH+YxpTFs1LAI4JAT3jw6KAM+YV?=
 =?us-ascii?Q?U6yktXtWI5K+3820BULX5OcrnL30ZDdBUvtLhCQ5e/O95Hcszu/sAMdGp53+?=
 =?us-ascii?Q?FCr4WI7QcaK5rYXS0PwuHQ1juVYtoC6IHIyAXnKH1I+aNa2mP8JGquHfBoxA?=
 =?us-ascii?Q?EqNuz8hRXIIhjkfKB5id6NzkrlcVcYSk391kM2u7ddsbMhIEY/HG6/oMWEf3?=
 =?us-ascii?Q?o80gimPfUyzJMLJYbEej37q65k6EMAFMDpaM6/yPi680JCYk/E4JeTaZ80ka?=
 =?us-ascii?Q?0arUSo8fk6CENKfQWVUGQbpOzEyMq4sjzQ4HaoVmJsoFg/iEx+/H31kMVy5e?=
 =?us-ascii?Q?dI/5V8z7tQ49Gr6BwLTP5F7VgC0ohWXgQPg1p/HON69H3AzzDK/FMwDWkCE3?=
 =?us-ascii?Q?cgKVxvoUs6cBag/Im83piLxTcy6oI+fGDZwfzh1fbjuz+lCtaVjXYmVLILNR?=
 =?us-ascii?Q?WuJR9qjMsy7WbNGKLz7VP1Ue9Vvy653GASGTdlpO1oD0HO98huo/KDRhDw/x?=
 =?us-ascii?Q?cplTDzJnISScFWA31pKwL2rWLLf5J8rksTRYgmnpWqUUXe5aa0dMF+ropYSv?=
 =?us-ascii?Q?P1GXhbrPP3WviN28+2maS3RCQRlnO442btJouLADYomnUCgqaTogZljngyvv?=
 =?us-ascii?Q?sIjF4M1bzgXIg0Zv1a/3hUC1fgNWrz7pf1nUg1PVAdsIA5pX/kZvev8CGOcX?=
 =?us-ascii?Q?8llsvm9GlrlrYMOb3bLjl4w8tCg7Ocxb1767suixRbtjR/pvZ9fUP3F/m9TU?=
 =?us-ascii?Q?L24aJmK8uLlSRx7reGhFrchnpunk/psz3h+NK9MEYIPQSRU+Ghw5N5dtE8g4?=
 =?us-ascii?Q?RDOUIHpsWDOzqucTV/R8yFVX?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3A561638F59DC44995A80E48E963DFC5@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB1582.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60292c6b-8b40-45bb-bf30-08d91bcd442e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2021 20:24:27.3786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AyTUP6yF14xM6gZSJ+xQb6Idl/mFY/hbBTDUrGREW0vhTjg8xqhLEhBJkuj/BX3t9Kmv+pRZuwiXOgDdVLkuPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4657
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9990
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105200126
X-Proofpoint-GUID: fEK15FSDQRM5h18bk6u-0FmdlPxSOQlG
X-Proofpoint-ORIG-GUID: fEK15FSDQRM5h18bk6u-0FmdlPxSOQlG
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
Cc: "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "willy@infradead.org" <willy@infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "bsingharora@gmail.com" <bsingharora@gmail.com>,
 Hugh Dickins <hughd@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>, Shakeel Butt <shakeelb@google.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Alistair Popple <apopple@nvidia.com> [210519 08:38]:
> On Wednesday, 19 May 2021 6:04:51 AM AEST Liam Howlett wrote:
> > External email: Use caution opening links or attachments
> >=20
> > * Alistair Popple <apopple@nvidia.com> [210407 04:43]:
> > > The behaviour of try_to_unmap_one() is difficult to follow because it
> > > performs different operations based on a fairly large set of flags us=
ed
> > > in different combinations.
> > >=20
> > > TTU_MUNLOCK is one such flag. However it is exclusively used by
> > > try_to_munlock() which specifies no other flags. Therefore rather tha=
n
> > > overload try_to_unmap_one() with unrelated behaviour split this out i=
nto
> > > it's own function and remove the flag.
> > >=20
> > > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > > Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
> > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > >=20
> > > ---
> > >=20
> > > v8:
> > > * Renamed try_to_munlock to page_mlock to better reflect what the
> > >=20
> > >   function actually does.
> > >=20
> > > * Removed the TODO from the documentation that this patch addresses.
> > >=20
> > > v7:
> > > * Added Christoph's Reviewed-by
> > >=20
> > > v4:
> > > * Removed redundant check for VM_LOCKED
> > > ---
> > >=20
> > >  Documentation/vm/unevictable-lru.rst | 33 ++++++++-----------
> > >  include/linux/rmap.h                 |  3 +-
> > >  mm/mlock.c                           | 10 +++---
> > >  mm/rmap.c                            | 48 +++++++++++++++++++++-----=
--
> > >  4 files changed, 55 insertions(+), 39 deletions(-)
> > >=20
> > > diff --git a/Documentation/vm/unevictable-lru.rst
> > > b/Documentation/vm/unevictable-lru.rst index 0e1490524f53..eae3af17f2=
d9
> > > 100644
> > > --- a/Documentation/vm/unevictable-lru.rst
> > > +++ b/Documentation/vm/unevictable-lru.rst
> > > @@ -389,14 +389,14 @@ mlocked, munlock_vma_page() updates that zone
> > > statistics for the number of>=20
> > >  mlocked pages.  Note, however, that at this point we haven't checked
> > >  whether the page is mapped by other VM_LOCKED VMAs.
> > >=20
> > > -We can't call try_to_munlock(), the function that walks the reverse =
map
> > > to
> > > +We can't call page_mlock(), the function that walks the reverse map =
to
> > >=20
> > >  check for other VM_LOCKED VMAs, without first isolating the page fro=
m the
> > >  LRU.>=20
> > > -try_to_munlock() is a variant of try_to_unmap() and thus requires th=
at
> > > the page +page_mlock() is a variant of try_to_unmap() and thus requir=
es
> > > that the page>=20
> > >  not be on an LRU list [more on these below].  However, the call to
> > >=20
> > > -isolate_lru_page() could fail, in which case we couldn't
> > > try_to_munlock().  So, +isolate_lru_page() could fail, in which case =
we
> > > can't call page_mlock().  So,>=20
> > >  we go ahead and clear PG_mlocked up front, as this might be the only
> > >  chance we>=20
> > > -have.  If we can successfully isolate the page, we go ahead and
> > > -try_to_munlock(), which will restore the PG_mlocked flag and update =
the
> > > zone +have.  If we can successfully isolate the page, we go ahead and
> > > call +page_mlock(), which will restore the PG_mlocked flag and update=
 the
> > > zone>=20
> > >  page statistics if it finds another VMA holding the page mlocked.  I=
f we
> > >  fail to isolate the page, we'll have left a potentially mlocked page=
 on
> > >  the LRU. This is fine, because we'll catch it later if and if vmscan
> > >  tries to reclaim>=20
> > > @@ -545,31 +545,24 @@ munlock or munmap system calls, mm teardown
> > > (munlock_vma_pages_all), reclaim,>=20
> > >  holepunching, and truncation of file pages and their anonymous COWed
> > >  pages.
> > >=20
> > > -try_to_munlock() Reverse Map Scan
> > > +page_mlock() Reverse Map Scan
> > >=20
> > >  ---------------------------------
> > >=20
> > > -.. warning::
> > > -   [!] TODO/FIXME: a better name might be page_mlocked() - analogous=
 to
> > > the -   page_referenced() reverse map walker.
> > > -
> > >=20
> > >  When munlock_vma_page() [see section :ref:`munlock()/munlockall() Sy=
stem
> > >  Call Handling <munlock_munlockall_handling>` above] tries to munlock=
 a
> > >  page, it needs to determine whether or not the page is mapped by any
> > >  VM_LOCKED VMA without actually attempting to unmap all PTEs from the
> > >  page.  For this purpose, the unevictable/mlock infrastructure
> > >=20
> > > -introduced a variant of try_to_unmap() called try_to_munlock().
> > > +introduced a variant of try_to_unmap() called page_mlock().
> > >=20
> > > -try_to_munlock() calls the same functions as try_to_unmap() for anon=
ymous
> > > and -mapped file and KSM pages with a flag argument specifying unlock
> > > versus unmap -processing.  Again, these functions walk the respective
> > > reverse maps looking -for VM_LOCKED VMAs.  When such a VMA is found, =
as
> > > in the try_to_unmap() case, -the functions mlock the page via
> > > mlock_vma_page() and return SWAP_MLOCK.  This -undoes the pre-clearin=
g of
> > > the page's PG_mlocked done by munlock_vma_page. +page_mlock() walks t=
he
> > > respective reverse maps looking for VM_LOCKED VMAs. When +such a VMA =
is
> > > found the page is mlocked via mlock_vma_page(). This undoes the
> > > +pre-clearing of the page's PG_mlocked done by munlock_vma_page.
> > >=20
> > > -Note that try_to_munlock()'s reverse map walk must visit every VMA i=
n a
> > > page's +Note that page_mlock()'s reverse map walk must visit every VM=
A in
> > > a page's>=20
> > >  reverse map to determine that a page is NOT mapped into any VM_LOCKE=
D
> > >  VMA.
> > >  However, the scan can terminate when it encounters a VM_LOCKED VMA.
> > >=20
> > > -Although try_to_munlock() might be called a great many times when
> > > munlocking a +Although page_mlock() might be called a great many time=
s
> > > when munlocking a>=20
> > >  large region or tearing down a large address space that has been mlo=
cked
> > >  via mlockall(), overall this is a fairly rare event.
> > >=20
> > > @@ -602,7 +595,7 @@ inactive lists to the appropriate node's unevicta=
ble
> > > list.>=20
> > >  shrink_inactive_list() should only see SHM_LOCK'd pages that became
> > >  SHM_LOCK'd after shrink_active_list() had moved them to the inactive
> > >  list, or pages mapped into VM_LOCKED VMAs that munlock_vma_page()
> > >  couldn't isolate from the LRU to>=20
> > > -recheck via try_to_munlock().  shrink_inactive_list() won't notice t=
he
> > > latter, +recheck via page_mlock().  shrink_inactive_list() won't noti=
ce
> > > the latter,>=20
> > >  but will pass on to shrink_page_list().
> > > =20
> > >  shrink_page_list() again culls obviously unevictable pages that it c=
ould
> > >=20
> > > diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> > > index def5c62c93b3..38a746787c2f 100644
> > > --- a/include/linux/rmap.h
> > > +++ b/include/linux/rmap.h
> > > @@ -87,7 +87,6 @@ struct anon_vma_chain {
> > >=20
> > >  enum ttu_flags {
> > > =20
> > >       TTU_MIGRATION           =3D 0x1,  /* migration mode */
> > >=20
> > > -     TTU_MUNLOCK             =3D 0x2,  /* munlock mode */
> > >=20
> > >       TTU_SPLIT_HUGE_PMD      =3D 0x4,  /* split huge PMD if any */
> > >       TTU_IGNORE_MLOCK        =3D 0x8,  /* ignore mlock */
> > >=20
> > > @@ -239,7 +238,7 @@ int page_mkclean(struct page *);
> > >=20
> > >   * called in munlock()/munmap() path to check for other vmas holding
> > >   * the page mlocked.
> > >   */
> > >=20
> > > -void try_to_munlock(struct page *);
> > > +void page_mlock(struct page *page);
> > >=20
> > >  void remove_migration_ptes(struct page *old, struct page *new, bool
> > >  locked);>=20
> > > diff --git a/mm/mlock.c b/mm/mlock.c
> > > index f8f8cc32d03d..9b8b82cfbbff 100644
> > > --- a/mm/mlock.c
> > > +++ b/mm/mlock.c
> > > @@ -108,7 +108,7 @@ void mlock_vma_page(struct page *page)
> > >=20
> > >  /*
> > > =20
> > >   * Finish munlock after successful page isolation
> > >   *
> > >=20
> > > - * Page must be locked. This is a wrapper for try_to_munlock()
> > > + * Page must be locked. This is a wrapper for page_mlock()
> > >=20
> > >   * and putback_lru_page() with munlock accounting.
> > >   */
> > > =20
> > >  static void __munlock_isolated_page(struct page *page)
> > >=20
> > > @@ -118,7 +118,7 @@ static void __munlock_isolated_page(struct page *=
page)
> > >=20
> > >        * and we don't need to check all the other vmas.
> > >        */
> > >      =20
> > >       if (page_mapcount(page) > 1)
> > >=20
> > > -             try_to_munlock(page);
> > > +             page_mlock(page);
> > >=20
> > >       /* Did try_to_unlock() succeed or punt? */
> > >       if (!PageMlocked(page))
> > >=20
> > > @@ -158,7 +158,7 @@ static void __munlock_isolation_failed(struct pag=
e
> > > *page)>=20
> > >   * munlock()ed or munmap()ed, we want to check whether other vmas ho=
ld
> > >   the
> > >   * page locked so that we can leave it on the unevictable lru list a=
nd
> > >   not
> > >   * bother vmscan with it.  However, to walk the page's rmap list in
> > >=20
> > > - * try_to_munlock() we must isolate the page from the LRU.  If some =
other
> > > + * page_mlock() we must isolate the page from the LRU.  If some othe=
r
> > >=20
> > >   * task has removed the page from the LRU, we won't be able to do th=
at.
> > >   * So we clear the PageMlocked as we might not get another chance.  =
If we
> > >   * can't isolate the page, we leave it for putback_lru_page() and vm=
scan
> > >=20
> > > @@ -168,7 +168,7 @@ unsigned int munlock_vma_page(struct page *page)
> > >=20
> > >  {
> > > =20
> > >       int nr_pages;
> > >=20
> > > -     /* For try_to_munlock() and to serialize with page migration */
> > > +     /* For page_mlock() and to serialize with page migration */
> > >=20
> > >       BUG_ON(!PageLocked(page));
> > >       VM_BUG_ON_PAGE(PageTail(page), page);
> > >=20
> > > @@ -205,7 +205,7 @@ static int __mlock_posix_error_return(long retval=
)
> > >=20
> > >   *
> > >   * The fast path is available only for evictable pages with single
> > >   mapping.
> > >   * Then we can bypass the per-cpu pvec and get better performance.
> > >=20
> > > - * when mapcount > 1 we need try_to_munlock() which can fail.
> > > + * when mapcount > 1 we need page_mlock() which can fail.
> > >=20
> > >   * when !page_evictable(), we need the full redo logic of
> > >   putback_lru_page to * avoid leaving evictable page in unevictable l=
ist.
> > >   *
> > >=20
> > > diff --git a/mm/rmap.c b/mm/rmap.c
> > > index 977e70803ed8..f09d522725b9 100644
> > > --- a/mm/rmap.c
> > > +++ b/mm/rmap.c
> > > @@ -1405,10 +1405,6 @@ static bool try_to_unmap_one(struct page *page=
,
> > > struct vm_area_struct *vma,>=20
> > >       struct mmu_notifier_range range;
> > >       enum ttu_flags flags =3D (enum ttu_flags)(long)arg;
> > >=20
> > > -     /* munlock has nothing to gain from examining un-locked vmas */
> > > -     if ((flags & TTU_MUNLOCK) && !(vma->vm_flags & VM_LOCKED))
> > > -             return true;
> > > -
> > >=20
> > >       if (IS_ENABLED(CONFIG_MIGRATION) && (flags & TTU_MIGRATION) &&
> > >      =20
> > >           is_zone_device_page(page) && !is_device_private_page(page))
> > >          =20
> > >               return true;
> > >=20
> > > @@ -1469,8 +1465,6 @@ static bool try_to_unmap_one(struct page *page,
> > > struct vm_area_struct *vma,>=20
> > >                               page_vma_mapped_walk_done(&pvmw);
> > >                               break;
> > >                      =20
> > >                       }
> > >=20
> > > -                     if (flags & TTU_MUNLOCK)
> > > -                             continue;
> > >=20
> > >               }
> > >              =20
> > >               /* Unexpected PMD-mapped THP? */
> > >=20
> > > @@ -1784,8 +1778,39 @@ bool try_to_unmap(struct page *page, enum ttu_=
flags
> > > flags)>=20
> > >       return !page_mapcount(page) ? true : false;
> > > =20
> > >  }
> >=20
> > Please add a comment here, especially around locking.

Did you miss this comment?  I think the name confusion alone means this
needs some documentation.  It's also worth mentioning arg is unused.

> >=20
> > > +static bool page_mlock_one(struct page *page, struct vm_area_struct =
*vma,
> > > +                              unsigned long address, void *arg)
> > > +{
> > > +     struct page_vma_mapped_walk pvmw =3D {
> > > +             .page =3D page,
> > > +             .vma =3D vma,
> > > +             .address =3D address,
> > > +     };
> > > +
> > > +     /* munlock has nothing to gain from examining un-locked vmas */
> > > +     if (!(vma->vm_flags & VM_LOCKED))
> > > +             return true;
> >=20
> > The logic here doesn't make sense.  You called page_mlock_one() on a VM=
A
> > that isn't locked and it returns true?  Is this a check to see if the
> > VMA has zero mlock'ed pages?
>=20
> I'm pretty sure the logic is correct. This is used for an rmap_walk, so w=
e=20
> return true to continue the page table scan to see if other VMAs have the=
 page=20
> locked.

yes, sorry.  The logic is correct but doesn't read as though it does.
I cannot see what is going on easily and there are no comments stating
what is happening.

>=20
> > > +
> > > +     while (page_vma_mapped_walk(&pvmw)) {
> > > +             /* PTE-mapped THP are never mlocked */
> > > +             if (!PageTransCompound(page)) {
> > > +                     /*
> > > +                      * Holding pte lock, we do *not* need
> > > +                      * mmap_lock here
> > > +                      */
> >=20
> > Are you sure?  I think you at least need to hold the mmap lock for
> > reading to ensure there's no race here?  mlock_vma_page() eludes to suc=
h
> > a scenario when lazy mlocking.
>=20
> Not really. I don't claim to be an mlock expert but as this is a clean-up=
 for=20
> try_to_unmap() the intent was to not change existing behaviour.
>=20
> However presenting the function in this simplified form did raise this an=
d=20
> some other questions during previous reviews - see https://lore.kernel.or=
g/
> dri-devel/20210331115746.GA1463678@nvidia.com/ for the previous discussio=
n.

From what I can see, at least the following paths have mmap_lock held
for writing:

munlock_vma_pages_range() from __do_munmap()
munlokc_vma_pages_range() from remap_file_pages()

>=20
> To answer the questions around locking though I did do some git sha1 mini=
ng.=20
> The best explanation seemed to be contained in https://git.kernel.org/pub=
/scm/
> linux/kernel/git/torvalds/linux.git/commit/?
> id=3Db87537d9e2feb30f6a962f27eb32768682698d3b from Hugh (whom I've added =
again=20
> here in case he can help answer some of these).

Thanks for the pointer.  That race doesn't make the lock unnecessary.
It is the exception to the rule because the exit of the process will
correct what has happened - and in all other cases, the mmap_lock is
held already (or ought to be) at a higher level.  I think this comment
is just wrong and should be removed as it is confusing.  I see that this
is a copy from elsewhere, but it's at least wrong in this context.

>=20
> > The mmap_lock is held for writing in the scenarios I have checked.
> >=20
> > > +                     mlock_vma_page(page);
> > > +             }
> > > +             page_vma_mapped_walk_done(&pvmw);
> > > +
> > > +             /* found a mlocked page, no point continuing munlock ch=
eck
> > > */
> >=20
> > I think you need to check_pte() to be sure it is mapped?

On second thought, my comment here is wrong.

> >=20
> > > +             return false;
> > > +     }
> > > +
> > > +     return true;
> >=20
> > Again, I don't get the return values.  If page_mlock_one() returns true=
,
> > I'd expect for my page to now be locked.  This isn't the case here,
> > page_mlock_one() returns true if there are no pages present for a locke=
d
> > VMA, correct?
>=20
> This is used for an rmap walk, if we were able to mlock the page we retur=
n=20
> false to stop the walk as there is no need to examine other VMAs if the p=
age=20
> has already been mlocked.

My confusion is about the function name.  The code is not
self-documenting as it is written and there are no comments.  Maybe add
a comment block saying what it returns and why?

>=20
> > > +}
> > > +
> > >=20
> > >  /**
> > >=20
> > > - * try_to_munlock - try to munlock a page
> > > + * page_mlock - try to munlock a page
> >=20
> > Is this an mlock or an munlock?  I'm not confident it's either, but mor=
e
> > of a check to see if there are pages mapped in a locked VMA?
>=20
> It is called (only) from the munlock code to check a page does not need t=
o be=20
> mlocked, or to mlock it if it does.

I don't want to re-open the discussion on the name, but I just might
with this comment: Do you think it is correct to have a comment for
page_mlock that says "try to munlock a page"?  Those seem like opposite
functions to me.  The @page also references the munlock'ing.  This is
ensuring a locked page that is also locked elsewhere will not be
removed, right?

>=20
> > >   * @page: the page to be munlocked
> > >   *
> > >   * Called from munlock code.  Checks all of the VMAs mapping the pag=
e
> > >=20
> > > @@ -1793,11 +1818,10 @@ bool try_to_unmap(struct page *page, enum
> > > ttu_flags flags)>=20
> > >   * returned with PG_mlocked cleared if no other vmas have it mlocked=
.
> > >   */
> > >=20
> > > -void try_to_munlock(struct page *page)
> > > +void page_mlock(struct page *page)
> > >=20
> > >  {
> > > =20
> > >       struct rmap_walk_control rwc =3D {
> > >=20
> > > -             .rmap_one =3D try_to_unmap_one,
> > > -             .arg =3D (void *)TTU_MUNLOCK,
> > > +             .rmap_one =3D page_mlock_one,
> > >=20
> > >               .done =3D page_not_mapped,
> > >               .anon_lock =3D page_lock_anon_vma_read,
> > >=20
> > > @@ -1849,7 +1873,7 @@ static struct anon_vma *rmap_walk_anon_lock(str=
uct
> > > page *page,>=20
> > >   * Find all the mappings of a page using the mapping pointer and the=
 vma
> > >   chains * contained in the anon_vma struct it points to.
> > >   *
> > >=20
> > > - * When called from try_to_munlock(), the mmap_lock of the mm contai=
ning
> > > the vma + * When called from page_mlock(), the mmap_lock of the mm
> > > containing the vma>=20
> > >   * where the page was found will be held for write.  So, we won't re=
check
> > >   * vm_flags for that VMA.  That should be OK, because that vma shoul=
dn't
> > >   be
> > >   * LOCKED.
> > >=20
> > > @@ -1901,7 +1925,7 @@ static void rmap_walk_anon(struct page *page, s=
truct
> > > rmap_walk_control *rwc,>=20
> > >   * Find all the mappings of a page using the mapping pointer and the=
 vma
> > >   chains * contained in the address_space struct it points to.
> > >   *
> > >=20
> > > - * When called from try_to_munlock(), the mmap_lock of the mm contai=
ning
> > > the vma + * When called from page_mlock(), the mmap_lock of the mm
> > > containing the vma>=20
> > >   * where the page was found will be held for write.  So, we won't re=
check
> >=20
> > Above it is stated that the lock does not need to be held, but this
> > comment says it is already held for writing - which is it?
>=20
> I will have to check.
>=20
> > >   * vm_flags for that VMA.  That should be OK, because that vma shoul=
dn't
> > >   be
> > >   * LOCKED.
> > >=20
> > > --
> > > 2.20.1
> >=20
> > munlock_vma_pages_range() comments references try_to_{munlock|unmap}
>=20
> Thanks, I noticed that too when I was rereading it just now. Will fix tha=
t up.
>=20
>  - Alistair
>=20
>=20
> =

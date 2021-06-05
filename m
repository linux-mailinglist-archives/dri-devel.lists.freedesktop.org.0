Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF7839C587
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jun 2021 05:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12886E44D;
	Sat,  5 Jun 2021 03:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE9B6E44D;
 Sat,  5 Jun 2021 03:39:51 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1553dal3001857; Sat, 5 Jun 2021 03:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=xDPU8JrZR+bM5XgFK6v8Tsj7UAagrHfWRQCD2brIkL4=;
 b=o5a30JP/uFvzBezHpRfbJsKLAIsbtbNsFV9cLaDwofVj5wvgYaO/AAajbxfXPVW19pO2
 BiD2yaqmkeD+UwxrsYIY/1p+KhIqX3oCXEBca7Urpq5Qb2QjAFV6Z38DUylNhYwABDw7
 MahA+fSNZsuDA1FbDb4B9VNZiP2AxD087JrtpjYTOOR4uZMlCi/EDz8nSHtQTYZWpQlu
 AV0q+C47iUdiPlTkNQDZp7KLgpnmHNnONKxSPwhdXxsnETqZo8jnD4Z4I8dm/FA1mXPL
 3+p7m8o9+JaiznI2yW6GJn7IXr1BkmMesvTR/vAWzwEJw4PaFfcInNm2iEbMvg6WP2wT 0w== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 390021g0n7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 05 Jun 2021 03:39:40 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 1553dRMe179775;
 Sat, 5 Jun 2021 03:39:39 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by userp3020.oracle.com with ESMTP id 3900kj10he-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 05 Jun 2021 03:39:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9+v2hsMwixkRX7FQZ/QbVh+glGTHFEWjQqo9/+5K2sv0j9tEt9/HeSrlH2wJ9R1FBQ/by5nN29Hjq4juPObjJUqVdFgJlPpRkBjRIh418u76LBS6Fd9PHlouJHzd4YHBmcwes+ldhZtoOyf1FS4Lb5dhf8hzHSteQ9DjYd9IrYiu/Y69SJy8Ei4nYox7NogBb2r0n9Cj+NqVZoj5lE2WSP/1WM9AImqt/FtkJ4UBNL6AtHy2ClX/bRs4VjuVRhczwML/Qx5C2pIhT22oXPFh1eZULIEFUc+QWfReAZZUMXplF/oqZVocQWV6hiIPNlzKCTylECFJJ6Pg5tIPHTN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDPU8JrZR+bM5XgFK6v8Tsj7UAagrHfWRQCD2brIkL4=;
 b=JPMlcvrm7mIQIllLKUfgHzdsO0LglUrZAkflnJdYgmOSxjcZcerQPRtwVgCrz9u7M+ZNURxpKN65e2FI89lsopn5h+3NzQIIRkUFSiOh94htsHrx7g4Fi5SievvyU6zIm8fhTsqaWiTUHY84KKD+SApsVcRKQ02roDffSm+9CS+YAIyd03M2KJhM3jwTbczcE716/9n/M4wm8wRcx+sIzSmHO5dBYVlJ4NaQ/ZZRWxE0p3bFtZnjSoSS8BXWlwDi/d/lM78Q96+SJzn+PlAyV+xSSyWK6e4XY8gy/KA6SbEtROe0huAblyRoZLWZaObIX9gSmnM5f0AcGRw9VG4AfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDPU8JrZR+bM5XgFK6v8Tsj7UAagrHfWRQCD2brIkL4=;
 b=IqfI3EWG76kOSvHaR0Lk8KvSRYYXndMPvJ6iI5+TgA9rChkbehq88JADStr6FtUdX2msgKcB6jw7H45C7uyGa8wCt7XN0Pg13d/Y6jcj1Cp+8D6uCJ4LO7Pz3hslOYmHWDJdjzmxMICt4A6yrcrYDLYROkffHmEFG/dcYZGWQDA=
Received: from DM6PR10MB4380.namprd10.prod.outlook.com (2603:10b6:5:223::19)
 by DM6PR10MB3755.namprd10.prod.outlook.com (2603:10b6:5:1d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Sat, 5 Jun
 2021 03:39:35 +0000
Received: from DM6PR10MB4380.namprd10.prod.outlook.com
 ([fe80::b8b4:5900:668b:c9c2]) by DM6PR10MB4380.namprd10.prod.outlook.com
 ([fe80::b8b4:5900:668b:c9c2%5]) with mapi id 15.20.4195.025; Sat, 5 Jun 2021
 03:39:35 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Shakeel Butt <shakeelb@google.com>
Subject: Re: [PATCH v9 03/10] mm/rmap: Split try_to_munlock from try_to_unmap
Thread-Topic: [PATCH v9 03/10] mm/rmap: Split try_to_munlock from try_to_unmap
Thread-Index: AQHXUKDDOO6CIzaEtEqx7vu0BJsuU6r0iUyAgABVhwCAD4YrAIAAQK2AgAAx1wA=
Date: Sat, 5 Jun 2021 03:39:35 +0000
Message-ID: <20210605033926.pkeq2saomieebrqa@revolver>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-4-apopple@nvidia.com>
 <20210525183710.fa2m2sbfixnhz7g5@revolver>
 <CALvZod5T1yjOk48Q_efppvP6iQWnSUwdOQL=G9TadrB6nS-s4Q@mail.gmail.com>
 <20210604204934.sbspsmwdqdtmz73d@revolver>
 <CALvZod6myLUu0j13=nn2vCbH7kQJ4yXs06=0+pZYie2ZN13Mxw@mail.gmail.com>
In-Reply-To: <CALvZod6myLUu0j13=nn2vCbH7kQJ4yXs06=0+pZYie2ZN13Mxw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [23.233.25.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34f0786b-fc13-4702-9c49-08d927d389fa
x-ms-traffictypediagnostic: DM6PR10MB3755:
x-microsoft-antispam-prvs: <DM6PR10MB3755C453133E4528C103A259FD3A9@DM6PR10MB3755.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LGmXQOitWADHfOqqmVNpcb1yVq4OES2W2jpYXJIuLkY8Pgvd1/gjBPkQCxlVlxn6uY2bYyj34QCwmLwA2IOQvavcKiMH3XCETmFsyq0V6dnEriVWof3isXivqiw+9ENx0Aqd8jCBUUWko8WTh4bFkK4lWZHTel7bumi+WtxltYCNRSGESkdbYQmKjtrSCWzwgUT1U8Twtb8THBHpAhq0+e29JIWdndZ+q95S2+LBveoOU00mBGlgn3Zn/tdNlpSRm05JteMfHjWJbXQpj1iCXoWnFDf4PKb9U1QNT+WbUuaa+TOswuNQhT/xPwyFpltaLqJ4EH5h2sGTEC8KfXruC4i0xSIxCLh5V9bllO5dOLmi2ossF0/XaSIqM+JLI6egGqkQYq5JHp8gtAmApnYhiYce/PSisgym5bcK/yEJy2kCPxV8zpmbNULviD/oBmfsZI5je9wbE6hd1LRxVoRs6PV1FL4kY5tF9+L04L12YdrbsBrYSExbh/Q+Odk5oRJpKCygPLiku8YZZ6r+avSzRgwMD0MVzeUsHNNfCrEYwdJOpDgkckYTn12E+FXgzbiGc9mzfSFw7K3MfpN9/5pWbo5WGKAkgo/gCafaAqoKsSA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB4380.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(39860400002)(136003)(376002)(396003)(366004)(346002)(54906003)(4326008)(8676002)(316002)(44832011)(7416002)(5660300002)(2906002)(53546011)(8936002)(6506007)(186003)(66446008)(6512007)(9686003)(122000001)(76116006)(83380400001)(91956017)(86362001)(38100700002)(26005)(6916009)(478600001)(66946007)(66556008)(64756008)(66476007)(71200400001)(6486002)(1076003)(33716001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?RiIJ9vl8PeOIU1fo4qB5X1zvc4RxhjCmAHbScpkfdjSMS2pb2MgjtqO9yFk0?=
 =?us-ascii?Q?FwIChUwmQUJbk6DrI/LtIJO4ATEDJazoe8b9Hj1j73kJg5d8bzAUYxQUmXjK?=
 =?us-ascii?Q?E0r5Ua+KTT2g6qPZoynaJaoPiwLHOM+D8RQ/l/9Y8532Bt1XEk+Q3isYB1ty?=
 =?us-ascii?Q?0er33SRPOYpi8kqbDhUh69WXS4D/oZKZKIbgns2cuH/qaOQc1tNTNKCyqxd/?=
 =?us-ascii?Q?BcwTQ7nalDGEJQunMDVXDZUHSOHXW3NkGofIZunU3oCd9uk0nNVJXc70l7EA?=
 =?us-ascii?Q?Eox/pWSFTo4VtOtRkd9hr4mFbhoPt5si/stbwhLdctelWrq99WUpZLd6Fx03?=
 =?us-ascii?Q?lpCKdRI0ckxfmR04YrYJZOTIJCmOTacMgPjT0QCevKmArROK3crpipvaGT9v?=
 =?us-ascii?Q?2ZTDlw7o7011QHX3hhvu5rO+usH8J65pu9AGMVxYx5FNkIJNPY/ItEsMhfFV?=
 =?us-ascii?Q?MubVwNbTB3BHjizxjMk24B3nai1kf6YmbTO7j9SNX+h/OL3FgC3HZ95IyWy4?=
 =?us-ascii?Q?k6nKsBFPG9jgvQyoiMcRFHfy3RPmSQ0wPUEGCC3c9MNJCnosxQ1xvQhtowhF?=
 =?us-ascii?Q?4xASBxGmTsj1HLaLpeYpd2E9DtgZkau3wj4jTveBH4TE/ATahCHH0hY1kYnQ?=
 =?us-ascii?Q?nsf2Yp6Cimv/5HivveEUHRYZ7Oh4ulc/4f3PvsL/0mzJbM8EXE8vrDWgNhqT?=
 =?us-ascii?Q?0BWhBvs/VVF7YM/j59KhUsRCHXedNcUhMNf/CIyavLYG54lZdRKF6ugYElc0?=
 =?us-ascii?Q?+rrABQF4qzghJqkDdqc73xtQskgsN99kBwE7iKj409D1gQMksXPXbWn2KIJv?=
 =?us-ascii?Q?EcT/4Dje6PxSX83u8dBeFoO3EI5tpUs/ez8juOVh+7odsFtCHC0O/uiDYJOB?=
 =?us-ascii?Q?nZfiTt/rmFzcTftbXM5LeH5ShtB2FS1t0hrJ6XmyoXPAtnUQc8ZJYJWuJz6p?=
 =?us-ascii?Q?TiE+eUoCPlLqYadj4lyacb9cpK5uAl39fWHbhe+Wvm4XfojTZJrOfr287hZS?=
 =?us-ascii?Q?BupejQ4o+3athV/uEayoF0ZPGDHlLlSmN04gEXK+7W5/MjTBI908dPa4MbLv?=
 =?us-ascii?Q?wu37/t7rN4Kyt4x9nW/JhLdUVgra5aapQz6aAz3gPd7Zs9nY8VFzVp5ufYB7?=
 =?us-ascii?Q?UccRKe+dIq/Vkz38WTZAfFKZA3GRpxElp3m1gvqJqKkfzEltukhxzVdK3NSp?=
 =?us-ascii?Q?nx0pFf22aP+2zJdU1COUbulW67XUFdMpZiLMpkCg7ATg0+U0L+8HYUVew94x?=
 =?us-ascii?Q?F48iHsO46Ia1w1Fe0fFx5A8YtR+QaFcwNy1WNkuv1VeO8Y7YeTefTO+qfL/+?=
 =?us-ascii?Q?Q8bJopCb5VSJpDAg41gqLsUA?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9ECE779B6CB8B5479B8CEAB25F0405A1@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4380.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f0786b-fc13-4702-9c49-08d927d389fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2021 03:39:35.4677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: toifDd1mFH0l0EcOZ3VAw6QZ9tnHjTqq4JMVRyLn+Exfdx31+c1jljITHxdn4g5TH1/3skjCiV0ane9gAEQfaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3755
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10005
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106050023
X-Proofpoint-ORIG-GUID: GR5VT1NnXCSewgfnWyMwpqh6tdj-LGlr
X-Proofpoint-GUID: GR5VT1NnXCSewgfnWyMwpqh6tdj-LGlr
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
 Alistair Popple <apopple@nvidia.com>, "hughd@google.com" <hughd@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Shakeel Butt <shakeelb@google.com> [210604 20:41]:
> On Fri, Jun 4, 2021 at 1:49 PM Liam Howlett <liam.howlett@oracle.com> wro=
te:
> >
> > * Shakeel Butt <shakeelb@google.com> [210525 19:45]:
> > > On Tue, May 25, 2021 at 11:40 AM Liam Howlett <liam.howlett@oracle.co=
m> wrote:
> > > >
> > > [...]
> > > > >
> > > > > +/*
> > > > > + * Walks the vma's mapping a page and mlocks the page if any loc=
ked vma's are
> > > > > + * found. Once one is found the page is locked and the scan can =
be terminated.
> > > > > + */
> > > >
> > > > Can you please add that this requires the mmap_sem() lock to the
> > > > comments?
> > > >
> > >
> > > Why does this require mmap_sem() lock? Also mmap_sem() lock of which =
mm_struct?
> >
> >
> > Doesn't the mlock_vma_page() require the mmap_sem() for reading?  The
> > mm_struct in vma->vm_mm;
> >
>=20
> We are traversing all the vmas where this page is mapped of possibly
> different mm_structs. I don't think we want to take mmap_sem() of all
> those mm_structs. The commit b87537d9e2fe ("mm: rmap use pte lock not
> mmap_sem to set PageMlocked") removed exactly that.
>=20
> >
> > From what I can see, at least the following paths have mmap_lock held
> > for writing:
> >
> > munlock_vma_pages_range() from __do_munmap()
> > munlokc_vma_pages_range() from remap_file_pages()
> >
>=20
> The following path does not hold mmap_sem:
>=20
> exit_mmap() -> munlock_vma_pages_all() -> munlock_vma_pages_range().

Isn't this the benign race referenced by Hugh in the commit you point to
below?

>=20
> I would really suggest all to carefully read the commit message of
> b87537d9e2fe ("mm: rmap use pte lock not mmap_sem to set
> PageMlocked").
>=20
> Particularly the following paragraph:
> ...
>     Vlastimil Babka points out another race which this patch protects aga=
inst.
>      try_to_unmap_one() might reach its mlock_vma_page() TestSetPageMlock=
ed a
>     moment after munlock_vma_pages_all() did its Phase 1 TestClearPageMlo=
cked:
>     leaving PageMlocked and unevictable when it should be evictable.  mma=
p_sem
>     is ineffective because exit_mmap() does not hold it; page lock ineffe=
ctive
>     because __munlock_pagevec() only takes it afterwards, in Phase 2; pte=
 lock
>     is effective because __munlock_pagevec_fill() takes it to get the pag=
e,
>     after VM_LOCKED was cleared from vm_flags, so visible to try_to_unmap=
_one.
> ...

So this is saying the race with exit_mmap() isn't benign after all?

>=20
> Alistair, please bring back the VM_LOCKED check with pte lock held and
> the comment "Holding pte lock, we do *not* need mmap_lock here".
>=20
> One positive outcome of this cleanup patch is the removal of
> unnecessary invalidation (unmapping for kvm case) of secondary mmus.=

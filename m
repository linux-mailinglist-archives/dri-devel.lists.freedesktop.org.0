Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B4739C19D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 22:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59316EB83;
	Fri,  4 Jun 2021 20:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADEB6EB1F;
 Fri,  4 Jun 2021 20:50:21 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 154KTFkO019705; Fri, 4 Jun 2021 20:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=4xFA1HIwfOEgCmTKS8Sv5QcwqLrzei4BBYtaShJFMAU=;
 b=LR2yW2g0ntVNI8WD1XrpNi7EVXn7p98inWEcPdomoSIx66uNWek3FIh6iOEvt/epOSDR
 J4lBvhypYbEWiyAljkYJLun3nOjxl+RXcSkENbD/mtxSMrk8CH0YNCXUhzgyy3PMsz1K
 NXNshKP5SeVxNvkcnNqNt6m7HcaufH3EsBaSnk/BWiia4NAJl1XLhbV0ydxQcp3lhx7P
 iwetWF/da/u6kC6REoXmvXxqQGan1WzCbHp+02TH0DwMTu8GFquLnrbdbFcYhsSKyxGA
 bE48sb5/tDZN5kgqz64Uf8H2vFduxz3BzBWTgXXPtofeoQEfL9Z8wLcANaYQnM62yjRO sg== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38xk87rt6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Jun 2021 20:49:44 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 154Kdtgb086356;
 Fri, 4 Jun 2021 20:49:42 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by userp3030.oracle.com with ESMTP id 38uar0jg98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Jun 2021 20:49:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4s4Cy5IkEBSIv5ycR4nvmsHtjmpAXAvwQUd2Vz/LabitvOOKL3qT8iPj+j/+hceVgpS6QIfP5mWqsYClk7F+BvYNGxJXqzJF7OebOh9kttQY5gCB30ucvyp0gp75jeHIaTqkCNHZh1OyIlxsf8U7bd4WndQlgl1UtSbyKBgQxbXRwnVzn2J5HmXg1wcxWdV3vWJZGhAkrefnWR4fGkxmNfzj+J1ZhOcRofsTpbTLcwkp+cX5S9MARUbCrbSPV/cCYHcMgLbdg3fnxZHprvgLBCLltzg07g6DmlG6uCJiRKwyrQUBktiIzbcAbB7URR6abCeV8cujOmBbflp/QlFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xFA1HIwfOEgCmTKS8Sv5QcwqLrzei4BBYtaShJFMAU=;
 b=QWEbcSzzEMQj3jjR40xJSkAkKvDPzJOo4oaOCG3SvwnJqQLuygZ6bJ4Rusg1xsvFySN6F3Ld9SPvwprA5mqkHOeGLzQaxwuhEFCCoEwyXo4Qlf7RSx3D+L86BLXFLneAUbAGYITxmSbTTiAQAIngZd58B94K5DBrMM/QpN/cbyDxetRdzTHU+MHlBC2jOMJkIg8aAEWB+PwGaimlsD/rnMtuN5suTUcx71MFcNhZ8nDdwzby2uW3sfRafWpKsq7t3kM7Akwbmw0BGjWfkuz5D1re7sxR/YOAFjK29MQvyHH2VAesEirOzoEOY5ljhh1PrHE8IUqom8IfDDtFe38DmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xFA1HIwfOEgCmTKS8Sv5QcwqLrzei4BBYtaShJFMAU=;
 b=vHw/rsV0yyo7J389A5yasLdtE97apZ88ce5YfuzHLUB7n+H6pNwktvSKeE3bdRPkAk8hBk/sgSFp86UQATUgcIHpcyeri8H84rqKorFLw/Qc10LS7k+4J8Y+VtUBRGIfSV2/51L9+UvVFg+EefwOF7X8DQrbHlLXdvOUkANWC9w=
Received: from DM6PR10MB4380.namprd10.prod.outlook.com (2603:10b6:5:223::19)
 by DS7PR10MB4975.namprd10.prod.outlook.com (2603:10b6:5:3b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Fri, 4 Jun
 2021 20:49:40 +0000
Received: from DM6PR10MB4380.namprd10.prod.outlook.com
 ([fe80::b8b4:5900:668b:c9c2]) by DM6PR10MB4380.namprd10.prod.outlook.com
 ([fe80::b8b4:5900:668b:c9c2%5]) with mapi id 15.20.4195.025; Fri, 4 Jun 2021
 20:49:40 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Shakeel Butt <shakeelb@google.com>
Subject: Re: [PATCH v9 03/10] mm/rmap: Split try_to_munlock from try_to_unmap
Thread-Topic: [PATCH v9 03/10] mm/rmap: Split try_to_munlock from try_to_unmap
Thread-Index: AQHXUKDDOO6CIzaEtEqx7vu0BJsuU6r0iUyAgABVhwCAD4YrAA==
Date: Fri, 4 Jun 2021 20:49:39 +0000
Message-ID: <20210604204934.sbspsmwdqdtmz73d@revolver>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-4-apopple@nvidia.com>
 <20210525183710.fa2m2sbfixnhz7g5@revolver>
 <CALvZod5T1yjOk48Q_efppvP6iQWnSUwdOQL=G9TadrB6nS-s4Q@mail.gmail.com>
In-Reply-To: <CALvZod5T1yjOk48Q_efppvP6iQWnSUwdOQL=G9TadrB6nS-s4Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [23.233.25.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 038393b0-3a47-467e-7e87-08d9279a45e3
x-ms-traffictypediagnostic: DS7PR10MB4975:
x-microsoft-antispam-prvs: <DS7PR10MB497528F6C05BDEC940D06477FD3B9@DS7PR10MB4975.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1FWCpng8adqGjZloc6jiKl0SrDM0a9f/LViWHRAQJihQNyeeJEHCGbQJ4DHzjYDfhGtfeiWUW8ur+0mK+WJlOw3uPTp9C5elfr1IVCsAxrcX5tSRxnPYcJcpf0OVNb/mA7NeuDSVf344QUi4c8D80sqkJDoM765MaxyCbJfqHDFNypeczcnMwRPieoUxAIgVowO7A7F2Yj/IBc5tZWwW90r0U4WHsuB4BUbNZNkYKprfN8twIVS/7WnNzsAHiYSstsuJidbymdoZcfV0xPbG0fOuIuqY/V9abnS3tuTF9SuIaWVkiM9S+xgO7Ll1njtq5d1KshJd0P5mG5vlghPALce7sh6jX8vjDRkCfKa473/GU/sAxyGJ1AjNUaTmuTT4UaaQw2WPheskXd55ryAs6hSjDMn9o9MDfGgBYaRM8iM2vdFSZgSwc+tYi8sx3mspvPeStC6lxLl7yJ7zoU84LDXfh/+UoQG4MHi6OycFEXrCv6UwCRZ+j7pPs8SIR/djQ2D7CzHFw5mLGrYZpkArIgYbn6Q5GCzBuTRi/wo8x3ywGwMrt6m8QH9qc8n9EEI1/YjoT+8kru9pvG5YHd503No8wNFYuoRZJhu535RJxO0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB4380.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(396003)(366004)(346002)(39860400002)(376002)(136003)(7416002)(33716001)(71200400001)(9686003)(54906003)(1076003)(478600001)(5660300002)(38100700002)(122000001)(2906002)(6916009)(6512007)(6486002)(8936002)(8676002)(316002)(44832011)(4326008)(86362001)(66476007)(66556008)(64756008)(66446008)(186003)(66946007)(53546011)(6506007)(83380400001)(26005)(76116006)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?3oxfZ48pdg7LRJ7INy+H8gQ0O2RzGOAfzBjyZQf+/rCiym8VHevqYicAq8la?=
 =?us-ascii?Q?3Lsdi7Hh3CD/QSymm2yArZxmRg0ZiCrERZ7TVjJsje4kQZiRHbDqY8SXGKzz?=
 =?us-ascii?Q?mVHDnF0p2SAqeBBoGNe5ne5mF9GAAQrWF0fygte9D8REu/y25dYFW+SdpglB?=
 =?us-ascii?Q?V/umDuVDtWDevNYy+KSfJDYHxEW7IOqrY9gdgiH1XTKdauTwO5tgr331zp1b?=
 =?us-ascii?Q?GxtZOpCpwWCOaVFTIK3uwtnrqWFdF12nLGsUSFezrdKcVL7sWy1QUzMrYhv8?=
 =?us-ascii?Q?lmqwwJI4D8T7/Pym/rZXwyQMvr3HJBu1zwbzNcwc03pXgjf7BqJ8XhJEc7rR?=
 =?us-ascii?Q?qUlxFuSiNnJVGYh1XIO0G3JKGe5ks90eaMiuDJOi09lzQRS2FySiCSSTYCc5?=
 =?us-ascii?Q?8Xgj5V/E3hh4l+xPIe7jGjgnxBqfZq61gIO8AHnL9Vj4W1KGlHP9FwGB19Lw?=
 =?us-ascii?Q?FQEJrGGN+3JIpAp2VOutlIo9QbuoD41eEj7J9MVMDdYISU/8cLVcJ7f9SMY5?=
 =?us-ascii?Q?gsgk5KHp8eUakZyed7jHIto2biWVVuHd6qJV3BIzfkMN+HJpLoqFYpisG0QY?=
 =?us-ascii?Q?QonO2O1ch84PRf5mrFTqnMhaQGrXZtwTL7tFo8gdmEzOqejaVyjYTeNpaZC9?=
 =?us-ascii?Q?JyJuwp8iHnCjGlYjJoOlBd2e32HrBwHDKwO51t5nT4NMgitSFVLfWAMTDlp5?=
 =?us-ascii?Q?yFN8RvwCWhutV0rr1hma7jQtADfTyca60CJWN9z8UweL5rEEi1kH+KGEngzf?=
 =?us-ascii?Q?FZy7lWPbTMPZN/qxJh7J7FZ3eOV9WG0vJ3mS+QRlNrmlKpquHEqyxPasQciZ?=
 =?us-ascii?Q?1GOG1CTmn3b4iqfZCKlLWwhi7DeRexhBXGPjfnnPSk62gjMbV/nGUxRry2Zk?=
 =?us-ascii?Q?AJQ0DPEQLUPfeErainbAsBGiA/Co9seyQVdCB99z684rFSDM8ZDXkbnao8rg?=
 =?us-ascii?Q?8sEJUxb1lXCSwAWmzu/4oNz/PwRyoPqZBIlOkCRD/bvyVzk34WPcj9AhR8n4?=
 =?us-ascii?Q?Qr5v0JeBaGKmHxzTa2qGgczzv1YQLR05VThKx+eJjKRPIQ4J8pCcGmkOCGu4?=
 =?us-ascii?Q?6hnRH1u9ZDCr+rZqjINzxB0pd42wdRhppl4GdhD2DZkMjuHzT46sPLX08Mxi?=
 =?us-ascii?Q?cTULMOZKMEk9Nu8bAAnst2urclfziwfO+Smwl9Y85X4RGY8ZD3iTRRGTvsY7?=
 =?us-ascii?Q?9TlFaWMKZPP6E/mUa5NVoZYZjpJoiCq+QFwI90UGU2ASRTzgUMVeFX+AaiBd?=
 =?us-ascii?Q?3wB+1G7FhbMAjMCS02gy0RnrSAGE+Hfjp8h8F2BVBou/bpMoJrFYDEoRI5hP?=
 =?us-ascii?Q?50eDabMLnUjUWg7QE7Ou1Mng?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6DA3C140440C7F4BAF074C493F0B2227@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4380.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 038393b0-3a47-467e-7e87-08d9279a45e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 20:49:39.9131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aqt9UI5fi2NOxc0YMg5tsWWZ3j2jPOhzSeJacCnL9OJUbra4zH2fNwXCRfTirmYvJGerIBst22mts1QhjsSinA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4975
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10005
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106040143
X-Proofpoint-ORIG-GUID: 0A5rMvumqGklVNjCrlAZYjEv0rUi8hvK
X-Proofpoint-GUID: 0A5rMvumqGklVNjCrlAZYjEv0rUi8hvK
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

* Shakeel Butt <shakeelb@google.com> [210525 19:45]:
> On Tue, May 25, 2021 at 11:40 AM Liam Howlett <liam.howlett@oracle.com> w=
rote:
> >
> [...]
> > >
> > > +/*
> > > + * Walks the vma's mapping a page and mlocks the page if any locked =
vma's are
> > > + * found. Once one is found the page is locked and the scan can be t=
erminated.
> > > + */
> >
> > Can you please add that this requires the mmap_sem() lock to the
> > comments?
> >
>=20
> Why does this require mmap_sem() lock? Also mmap_sem() lock of which mm_s=
truct?


Doesn't the mlock_vma_page() require the mmap_sem() for reading?  The
mm_struct in vma->vm_mm;


From what I can see, at least the following paths have mmap_lock held
for writing:

munlock_vma_pages_range() from __do_munmap()
munlokc_vma_pages_range() from remap_file_pages()

>=20
> > > +static bool page_mlock_one(struct page *page, struct vm_area_struct =
*vma,
> > > +                              unsigned long address, void *unused)
> > > +{
> > > +     struct page_vma_mapped_walk pvmw =3D {
> > > +             .page =3D page,
> > > +             .vma =3D vma,
> > > +             .address =3D address,
> > > +     };
> > > +
> > > +     /* An un-locked vma doesn't have any pages to lock, continue th=
e scan */
> > > +     if (!(vma->vm_flags & VM_LOCKED))
> > > +             return true;
> > > +
> > > +     while (page_vma_mapped_walk(&pvmw)) {
> > > +             /* PTE-mapped THP are never mlocked */
> > > +             if (!PageTransCompound(page))
> > > +                     mlock_vma_page(page);
> > > +             page_vma_mapped_walk_done(&pvmw);
> > > +
> > > +             /*
> > > +              * no need to continue scanning other vma's if the page=
 has
> > > +              * been locked.
> > > +              */
> > > +             return false;
> > > +     }
> > > +
> > > +     return true;
> > > +}

munlock_vma_pages_range() comments still references try_to_{munlock|unmap}

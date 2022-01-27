Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F21649DAA4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 07:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0181B10E220;
	Thu, 27 Jan 2022 06:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3C710E220
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 06:30:29 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20R6SnWV002868; 
 Thu, 27 Jan 2022 06:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=ZVVxYzvywLSAkBZDBy76HTlgqbReLB60kx54KlZ2n7Y=;
 b=VJaH2olEKPGzsJnf+a93fhF2PEGAdXfifOtXvVhiE+sVUHboL3r/HBpSwFIXLCy69Mob
 cr7D/8PvYEBiZL8WCKmb6H5nOiz6JvlxNtFt0g8iTzaGQt+Dzk4GgzjP2PNsfK5XZ6XL
 ow5hVGqfOozewDLRm0yv5GMw92yn/QkBY9wh32Oq13EEEYFF8JgR+Lwr/LBR3IBDd4Ti
 vRb0NxH/w4eEvNxmwmNehnlv90gWWHbcwgFL/FS/6dhJosIlKxCXvO6hwnv4l6Bb5fez
 l0S/tTkOaZ/fGjszOdirtvZMYt2OmqqtwwLATIokbeREDHXG1puVhkk1G7cSLxjgV3Jq kA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dswh9rmnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 06:30:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20R6GovC158024;
 Thu, 27 Jan 2022 06:30:14 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by aserp3020.oracle.com with ESMTP id 3dtax9se1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 06:30:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Msk4X7J7vPF9dKOWBtNUNfPTpjbHZmicIB058QPlij2cj9LctEV4KjeAk4NuDMgi+YyK/opv84INoH9wBmuawdOjbpEZ+4MyJ8qUU7PnW+gbj0b5OnhmFXW0fJdub7nziLCdPEcGSTAbCsvwP+F/dR8MPrsLhOpQ8RoXuXjdxDz7hL4hv1pzl5dAVntIPt5E0nBbEitmRYM/X1wxFQUwhxh/hBZ2HaklY6nexXLAzMmWivPh4hJZzReUw1VRHQj+hMU5kqv1jVndEioxdzgw8mpEDYafQJPq4HxYUzYkUBliXd7zu3WozsTKH+7UFvdVYP/c6JkA6IiNDh0ko6ggnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVVxYzvywLSAkBZDBy76HTlgqbReLB60kx54KlZ2n7Y=;
 b=LWdGYfU87FAfG6zH/G9z/Xx/NHT8hjIkZZ6sYAa0s22+8Fpfc/4YZgCoJs2OVNv6Auns1yfmoyi0MISm/WJ5PTy/w9zpIExQdyZ3odb29D9WFuVGebM5h5Sv3L3W4zbx4sWFJHH00XnXNkDLx8XajzdKHAI80t8Bl3kG6VZLjxd4vjc4fUSduO3y/NkUaVFvkYrJMbMVh+Qb5Aq8t9/hPn29YF/w1WyW8kcV2aiDYYZ9BHHI1asIaaZLV1Emf2DrptoNFL5IglAthRVwih3Sbu8lSpBRc3/9hAk1QGG0wAhLVrLKVN+aCpOL3Vea/a/eHM5SW6e2rIs+Jp6mLM5D1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVVxYzvywLSAkBZDBy76HTlgqbReLB60kx54KlZ2n7Y=;
 b=iNntIpkriVgZRvuzgn0I7CgkcKrl/U2Kjz/xwI9AXTz+iDCp2lKP20M3fC4NUaf3Q06yh3VkoxakeTJapFXbiNijKKRHo94C8uTgFD57JOIImfzT9kiuGjvZbvJsm9K5BVdbIw/81yrnamE6iTs41uopYcMvTT5HCKkTt1AuHr0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN6PR10MB2036.namprd10.prod.outlook.com
 (2603:10b6:404:101::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 06:30:11 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 06:30:11 +0000
Date: Thu, 27 Jan 2022 09:29:45 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Message-ID: <20220127062945.GC1951@kadam>
References: <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <YfFMSkhbvHaR0YNE@smile.fi.intel.com>
 <f6ffe9bb-8683-4061-c876-1d559267ebae@redhat.com>
 <YfFWmmJFtEB93jUi@smile.fi.intel.com>
 <3430838d-1c63-da49-b774-c5a883e7085f@redhat.com>
 <YfFZkgE3wfPXLpYA@kroah.com> <20220126144524.GB1951@kadam>
 <CAKMK7uGEFW4nd+W6PiT=uwSPz=pA6HKZXj6ePcdsAGiMDb3BxA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uGEFW4nd+W6PiT=uwSPz=pA6HKZXj6ePcdsAGiMDb3BxA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0038.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::26)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39cfc26a-4886-4577-1c15-08d9e15e7853
X-MS-TrafficTypeDiagnostic: BN6PR10MB2036:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB2036C329723014351FCA7BF28E219@BN6PR10MB2036.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ps3nFSSXIzhlVEIGp0mORAL8FnOtnD+2sFzu3RGTvrhy7uqbmGvmzBFn/1BRT3ZuWni4SS4JjUkB4ubQr4fXwTkQIEStHw09lUwSOyS6Qtvex46okzlH0zvtTlEyT1CITJvGMp41mB5ndtOM2EV4daTiEZTShzgP3L4iCreH6fD4P2MiQN/3Z0rszbzGMIWudo+4W0p5BK1IiO9DNWhjChgIUyfNY5B/R2QVcjlmAIDXYbYRp6TE/Tq0/AgZ1WAFUnCXEbYxnIC8nXz6wXYLtGnMDwUyaUmfccdyc7iVCorC+Ox9uC0zN2GsGqz5lmqRuenwFEMsritt8PyldevRgnvFJW6XvaDWMLCHJ0S7J90+IQczZtGnSngsA1xLSZmtB6KSzAdJD0EiE/u0Gotogj2aKJBuwTl1eOKN161Sn+yt5t6Odk7RAqpUQPYS/Z9tyscexwU+vsmeXe25fD/O+C3Mxm+MKvdpqjJxb4vLQtxl6qAxoJsXsIzMwpQ8MRP0XIrLnqLlhrfKiMBweRAu30q6K8wEu1NXmQgLI8ozfnoLNSKWuX0klxgrH7jcNnvlliWTosf/afVZuEEkzJQ3osSmg/wwRqtU76jMf+AbAt4XkcXGo6LkkA2QRqryyLsMRxkmavCmYgm51c87pK+UhR9AfcapNuaSSZMPsGOrJVP7hQWOmnYVJ5/MfMr3Yjh4AgEYkyD0DgVhHczWtf7D1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(8936002)(508600001)(6486002)(4326008)(6512007)(8676002)(186003)(9686003)(1076003)(38350700002)(4744005)(66476007)(7416002)(26005)(33656002)(44832011)(33716001)(66556008)(66946007)(316002)(2906002)(54906003)(6666004)(86362001)(83380400001)(38100700002)(5660300002)(6506007)(6916009)(52116002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iUnbTeNAOkabZHPVCy4qJwh2v6g1GbDKs525kpgDj61IeatjwZ7+mKc6wFGA?=
 =?us-ascii?Q?QsgiBmCye+iNc0V3XQz5oWc/nlQVekWc9kaIotDjfr8BCjT1chYvlwmYB+KD?=
 =?us-ascii?Q?6QTUL2q8Rom2yzzTlM9Q2W4Ru7vtbg/4sUXhXfjZ/q+0lDOU43YFScgsqXWu?=
 =?us-ascii?Q?Iz7JomsGc//nU9FDoL0gBH+19w4Onc/cUZBi5U6S4L5kcXhfrl0vOWVjr2Tk?=
 =?us-ascii?Q?UmGWtoMvQ2PkOCSfqTN7VvGVFxqrneI3ppsC49fVzOslPmcRYJ1BXNsfB0tC?=
 =?us-ascii?Q?YZka5Ts6VNiQrAQRjcyt3B/iQtQMAeOeKYNi9BgcL7KHgtJ7g6m+FTMza9wj?=
 =?us-ascii?Q?xyE8BU+TmnEBR+9v+WYI+r4EWzeJufknEV9zz+5DkiY08lcoTMOTsP77iBOX?=
 =?us-ascii?Q?ASA9HAtfgz4Nxgl9aJXKuvq8wjtgxXTMh0fgGWqoFIv2gMJzQYnZ84OWcD9q?=
 =?us-ascii?Q?GvbIjePCEgwM4lQOqeAHVVEDdOSGnrilInrJRl2pzDM1t6XN5VTulPYN38a7?=
 =?us-ascii?Q?uwGvO0ka2Pg65AWKpxBoHvuI1jgIKbNVg4AGEBIHj0qawrL0uuJr8OoaKeUZ?=
 =?us-ascii?Q?KC2mXiei7IfFNG95cKkUZ+smSJxdA1W2GUDG+iohp/5NWnkCTIGJK5SDb9vf?=
 =?us-ascii?Q?BBZvrqh2gl/wL4hq5pUbIgTnQCXFeVLErjSjpWRaPYEAKyMwMBjZVuwQOhO0?=
 =?us-ascii?Q?mz5gqmV+LzWqtpAOxi/MmEy18zyFTuDIEc2yX/E2vKEPb3uOGQCS5QoiEzie?=
 =?us-ascii?Q?iZaQi1IFBIIGZDPoRZTsV7g2W7Cr068ApfvsLp6Ww030smRxXeqjJevV6MCq?=
 =?us-ascii?Q?JaEMdFCeGKmig9A6xxyd0hqb6L+EjLmuW7YRRv2ubmgrzD1xOSRweMvcscyB?=
 =?us-ascii?Q?//nmtHSjSoHKdvJJTd2z+jKpM/U9zhfl0N9FN4ByVzYC1Lhpru90W7OiuwvN?=
 =?us-ascii?Q?MTM2UcNCsJkTZ64zwMvfeSROWMgmvGAC4/be8T5PgxXEujuoZbRGFVGDVbjn?=
 =?us-ascii?Q?80jDQw87fCchS/+Gju+V8LVdNTaRHFNKZ9sa0888sxxXQIPcXCVQX1HUt+Wo?=
 =?us-ascii?Q?J2vmQVLxCdf3cWbz2MDlP+bb8jBxK/4Yn5skoS7PH+OW3LvZ7nZTr7ZRROKW?=
 =?us-ascii?Q?S+bImYUBqFwng4oh/w56yusPkoIrVTgyQwMW0xLLXnjvmcd6ekOKV40OtMmj?=
 =?us-ascii?Q?SgaDBXllK+dJOpmfdPa62MulwX/FNHbN7tMxhm4dmITutpAvlh1PsATOYyEY?=
 =?us-ascii?Q?ZpKfeGaiR9Bt9SSFmrRKoAIfiABnu3hM0AGo1FncNzCdPdlKFBatXts8vxQD?=
 =?us-ascii?Q?/nAx9AxtdMt8HQd75j87ov4S56QOcNK0dK9yY3icIOAZJTmzBUSMt5/QOjtV?=
 =?us-ascii?Q?3YVBjJhxDSfX966i2AGoV4yRlb0AzryCHdsi/U4xaJ7xP3TGb/YU4wPzZ9hn?=
 =?us-ascii?Q?Opl5vRwaTmV4b+w/bS61xEoQeMIAac0EsQ7OZzCyCyRTlt6oZmUBmOOKx4a2?=
 =?us-ascii?Q?lX8XhBSXs8kJT8CXCWzB5MMRfXcOZ/MbPkhD97nw2zOv5rKSCBbhdFbmF/Y0?=
 =?us-ascii?Q?JxTCP32VHn3evAWMygT1MRbR7zTf0E05k32W0NoUZ+ll2LQsAx74GHWN3hch?=
 =?us-ascii?Q?TNnCRrKbV7LYq8CiSgd/EwKDVKx2GnGJ0URKnevgflqsZleBhicYzI/Gf1dF?=
 =?us-ascii?Q?jq9yZPNRAKC184Z6gltilYRM4i4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39cfc26a-4886-4577-1c15-08d9e15e7853
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 06:30:11.4492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQ9JK9WwKnBR7/x4uhM0yIgz5Hg8edEfFwmw2OkIWWhyTFuCpS3CkNriLtyx5UEHQ/OhnpI7E2WqKPJVdT1y8FLnFLmGT5Yz6dIjNkjeLeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB2036
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201270035
X-Proofpoint-ORIG-GUID: HRW8dVaxKUa7Vb4q8vvMa_ajODEhqPiT
X-Proofpoint-GUID: HRW8dVaxKUa7Vb4q8vvMa_ajODEhqPiT
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Phillip Potter <phil@philpotter.co.uk>, Lee Jones <lee.jones@linaro.org>,
 Dmitry Vyukov <dvyukov@google.com>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 11:31:02PM +0100, Daniel Vetter wrote:
> dOn Wed, Jan 26, 2022 at 3:46 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > The other advantage of staging is the I don't think syzbot enables it.
> > I guess it's easier to persuade Dmitry to ignore STAGING than it was to
> > get him to disable FBDEV.  :P
> >
> > The memory corruption in fbdev was a real headache for everyone because
> > the stack traces ended up all over the kernel.
> 
> Uh Dmitry disabled all of FBDEV?

No that's the opposite of what I meant.  STAGING is disabled in syzbot
and FBDEV is enabled.

regards,
dan carpenter


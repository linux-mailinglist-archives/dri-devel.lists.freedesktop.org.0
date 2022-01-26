Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE53249CC9E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 15:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC1510E5F8;
	Wed, 26 Jan 2022 14:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F7810E5F8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 14:46:14 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QEdIXL001977; 
 Wed, 26 Jan 2022 14:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=EEy8oOuohWR1+LkL4kJNMqGmCVNyj4KxvdYhg55gNWM=;
 b=UPqblIKNasF91cngBHn4jsA1VuJtc0UG2l96ldWa34GV0elLjpBhDShnLD7i/8dYtVW4
 oqHiNMfW6ZdfTWR2L+wYlucyRW30DlGgz7AjRQ19h5BuIM8/9o6W0AwfhRNH+g/+kj6n
 I/4Xkucr0Y20Nt62cmDun76GNM9VtvN6tJgG9EEqba0adfceLys6IgxeN2VyX/n1tHPn
 fgj2HLt6cBih0Nn+5qF8aQ7ulcSIbrRPY8lzD7XMsLHfeo1f5hrMCv4PLkDUdOz6nWXZ
 8tP2VL9/WB/qy4Rv2YZW/s+MzNmRWt2FaLk6wcSIz/YZrqPmA25osemjK8E0RzYtzy6S HA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dswh9phy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 14:45:56 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QEb2hC176180;
 Wed, 26 Jan 2022 14:45:51 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by userp3030.oracle.com with ESMTP id 3dr721absx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 14:45:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1zR+7Uev3WtJ88Y8PdayQaWvj1QSWf7iyzANCTmc0mnGg4p3R4D1E8j10sGB6Aa0q6oyJoRilRkIZRlR2Qj/XzDWBWDppuVo/gwoRxKmen94lxzPGY6XxOkaqJuEv8p+VCITYMjlROH7X7iNoT3QckVj9aM1DUwHJ09DK578CJaEh11ibb2xsODuZrrmCVtfu4nCSqYEYHRm4DkPjC6sqDUBp1vVEE2/sF9twbPyGu8wCszKBADfOH1P04yg8OdAlIGtvv0MzJPxd3CJHie7qaIh5b1rAx8NDPJn6/N2UHP5smPow54XQhbVLIts5VQ2VlTx0MTHdkKaZLKWUVvdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEy8oOuohWR1+LkL4kJNMqGmCVNyj4KxvdYhg55gNWM=;
 b=IhhTscIZ3ZflAJtaom/AnIXLMk8NTtDp9LF59+lh0mTmlH3oEYLOeKlrSVfdU7Rm7jgViNXw3MLe8Y3IMjZdrDzRisoNFH1sNjGuK2UZIG3xqMpHJsqR5gdHXe4lmM0kTzkpjxTEknmoTTAA/ymaJndGfD7IjaXHuq85gymZpIe8rtH8VHkueIujSTAJSAn3V7bBH/1s8Vw7RCgWiVtFyiaXoAjHm7pGf1EIMn4rNBGIMwq0xUptW3uHoBPpqpzlInpG1z5M2kaGcSyrokUMQ63fH4OgaGWmbp/OaxAxomLxyfKd4oWwW2HbEhuEZkcKpHAQyYOc1qbQUBDpVBDEDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEy8oOuohWR1+LkL4kJNMqGmCVNyj4KxvdYhg55gNWM=;
 b=pgwhg/vtxnWYH6RKP0nR/pTIEm/QXUmb5aBAAmDb8RVHFCYGVX3lJ8NO0VnSURlH9EdD3bB4mSRRcJS4SDKcLa/5Kkd0+tTRdilHFT3xpqxIb2gNdEQEV2WyoUolp1lP7aW17Vxkk5j9tA+aYBEkKNZ6qf06KTy+jVv1n11c6Qk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SA1PR10MB5685.namprd10.prod.outlook.com
 (2603:10b6:806:23d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Wed, 26 Jan
 2022 14:45:49 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 14:45:49 +0000
Date: Wed, 26 Jan 2022 17:45:24 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Message-ID: <20220126144524.GB1951@kadam>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <YfFMSkhbvHaR0YNE@smile.fi.intel.com>
 <f6ffe9bb-8683-4061-c876-1d559267ebae@redhat.com>
 <YfFWmmJFtEB93jUi@smile.fi.intel.com>
 <3430838d-1c63-da49-b774-c5a883e7085f@redhat.com>
 <YfFZkgE3wfPXLpYA@kroah.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfFZkgE3wfPXLpYA@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0043.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::31)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2a89e6a-ba28-4ca3-50a5-08d9e0da8acc
X-MS-TrafficTypeDiagnostic: SA1PR10MB5685:EE_
X-Microsoft-Antispam-PRVS: <SA1PR10MB568521F07EAE7275F176476E8E209@SA1PR10MB5685.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tbi8hVnqtJaLAVZ0NXiFu0b1GrYpzQNyYBUP3TyNvCTfTy7Dh1bVCEZ7nT7/OletIHXTPBnP6Yxcyyf7gwGHevul3+AsL3M49NRwQ3v0JhR3SBAGnSCtV3YNvEmPOySLqSc5IbuAM2Lu1OE6336zqDcseSNhE7x2XrfOBqmgpFOv7RqHrsRJlDv9jl2VHByDaa2lX//ArmcIgU8dlYSjRHKTYEf90NYYM2VZV8BB8WY517ezwrtUL9WzMM2iTX3e0P5qjdxzieLlgdqoAQv4G1qZ+ZnamaKWiH1i7cYMEq02Z7r/Z8S7PsO7vUcSHYXaiiYYEVernKG8369XEd4B+u9JRg0pHPEmotJ5pAStFKDyEKDOpEvAxw4XoJnrvTn8tl5l/FGYQOweRGE58cZ9WLA/V+AVVvbhW0piDnMCVnDtm2PhyFeBtfLGs7gcfWBoTeTeQW29qpTd8Iu/APO/6ZPjeHrDXKB4yXbKGPSbxG+N78uWkVrfDBX+6z60jjvnwgusYyb8+z1/idqIbnDEq+lbW61SZrzwsBj1CHWfMVPAyD1hC23AnHM1ggZhSJuoaf6EdzfXNM2kLQaXQP0ikZWelr0FuEXGABYw/3kFoZhdl8ZgneVUtwfDeOpzjtCw8yzgc1xEc7J/RjSNMMS90xPWJ+ykV3P7HWrLa7ZQyiy/qHpR9dgNpwvpPwsLFaPWN4L1imUfxw5BH9WHDfTGXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(6916009)(66556008)(4326008)(5660300002)(66476007)(86362001)(6486002)(6506007)(7416002)(6666004)(33716001)(1076003)(9686003)(2906002)(54906003)(8676002)(38350700002)(6512007)(66946007)(316002)(8936002)(38100700002)(44832011)(33656002)(52116002)(4744005)(186003)(26005)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ri2nEo1EY6CLHQ7kbapOrgFrkaNaHOJNbRxf8ruhKpVnGt3SpfcynSxZslIP?=
 =?us-ascii?Q?lWNVworNdua0mJHWwQtVWBtP5C59qYA70geCI+PY5K7WIdOf0302OED//2WZ?=
 =?us-ascii?Q?i86b9EQHYskBM12w5ni9jNTYtJvViRbEbW592LeeD3QD+gs/F6kE/YxZZESp?=
 =?us-ascii?Q?OLH1nRB0ZK9Vq5J7Rxl7pZjl40pT8pxLWc2/ZFD9f9MtniJ/vUIFGS6pCI4z?=
 =?us-ascii?Q?m3wBIXCH25DgCQ2ogSra23sjBq9xNWb6XbA7DJGP8BtyLd5gnDTXFVXkmc7h?=
 =?us-ascii?Q?UBLOzMnci6kguamxssKJqiKbzn0Olw0FvNgzhC1YGw0EAi3nFzIyYmpBlJ2f?=
 =?us-ascii?Q?PVTNUY+iyrClKda+KXwinU25Pvj2wAkB2wMjUkaEpcGgtp3q9BR5IB7TqyZl?=
 =?us-ascii?Q?x9Uf4eWpsaXodTBTWEWTT5JIqNrB6sW+SU0vCwH2QvqugqS5avreMHiOBdPg?=
 =?us-ascii?Q?VMDvMnGBlJ5sxz8qgrEVlyvuzSHSC17XMTxKN8iFCq0NM3v+8susNPlBwuJr?=
 =?us-ascii?Q?SNvD6ExULAnZw89UWbS2FId7r7vRYbke91mZFvGAPLNkttRWJ6UexRw9ch4j?=
 =?us-ascii?Q?L3bUq/lLRUZpzqltLO8uUoVF241knivtN8MjFmP7auxyVZhjZ/hfAuCqG+rZ?=
 =?us-ascii?Q?gczHccdwyM+ZE6Slw9uOqQ1pba6ZkvjcY3N0QUcWC7mfdwyUvyUiXuoP3jgT?=
 =?us-ascii?Q?dd+PG7HQJ6OMbV4dP9H/mabfqk2rVWPJC+xgY63VhU3clm/S7d/eee8UmyN9?=
 =?us-ascii?Q?UGNic6lGyx+gWZEMHb6Bc0/hO6x5Wv8ZEox9bUTI+JrG2z0IfgL6b6oq9mhH?=
 =?us-ascii?Q?wh+0Xqw21bvyqNt4rvE3FOQJMHaD3yNu2gzRj14D3FSxjnij2vs0h5gGcSpU?=
 =?us-ascii?Q?MjbXMLGBMk2w/nvsumUEA4Y6yQnlG3XLW4oCEugKNMURQU/86SzpHomuB9m0?=
 =?us-ascii?Q?RqfHq7DNl6v12qCiVFlFNNLjv3GD2YqcKn/fokJKgDq0+tgrN2xwl1Bsnnig?=
 =?us-ascii?Q?Xr8IXyQRLhkFWeOyx0su8M6PPdWWL4vHgJg2fkVAYSWfRkX3BAJX+UE5CTTp?=
 =?us-ascii?Q?qK9gfxDkpPtROkIw12JvC2Xup0kf53624yA7l5yMj0yrxR1e+nGPn/Cdd0Vs?=
 =?us-ascii?Q?6W+WpZzkWuaOjmvUb5EYwQj4ChqlygXAfDQSncDyJohDtp3zFkHehkFMnDHg?=
 =?us-ascii?Q?LmTTYAD4pdqatPwuZJNHIrrhAACMYSWrisZ14+TrfzkB+jGF+NMA/KBBRAEE?=
 =?us-ascii?Q?7ZEt87U45VwznzzBOYnMrh6uIlhzPgXYKIxyjtSLQugK7qMSlMWYO0ZIwyRo?=
 =?us-ascii?Q?CMXiRH5ntu79RFOSyUOe0Xtkt9gpxj8ZqEP1nGt5xa0E1YVHGWXQwj3lNIHO?=
 =?us-ascii?Q?q/muO8vV24GTtbKlsbXDAoUZ6ww5c4ParIzRLQso6RQeV15VgQ2We3S924l0?=
 =?us-ascii?Q?Y7VNAIMOUHADOLlvn4727Cr/LeuxEAPb+GeH7f+syMwU/HGqJwCFzNk5ifgh?=
 =?us-ascii?Q?U3Qs0U5rmVwhC1KLXPRpEmfMYxG6FRYrXsodXnoxjOZ2K1Vxzrn2OGlysnw9?=
 =?us-ascii?Q?cQKP1QMmUfn7yHkhJqGp89llkD2T14jzwuoqI9x+6upHVAAex5gdvnM4t4NK?=
 =?us-ascii?Q?d7+9ggqPyd7v7Ren98aieiG/JJeLrB0aqM+dprpmQENWdsjC8LlNToRsisjU?=
 =?us-ascii?Q?bazkNTDaIvXy9CQd84Fs78Rzj7o=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a89e6a-ba28-4ca3-50a5-08d9e0da8acc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 14:45:48.9367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWeXmkxydg10MD0rfywYwmvgvfNAcLTqLMvaPQvhwz0OZPj5EFyfAp0YjCIp3mpTNYriJ8RwXjHeu5fQa6HihBG3fjv2dYVXC3Jh8vW7AUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5685
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201260090
X-Proofpoint-ORIG-GUID: r6Kre-BZQCrzSLx5z9NnBCqtzgJ2Fz-Z
X-Proofpoint-GUID: r6Kre-BZQCrzSLx5z9NnBCqtzgJ2Fz-Z
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
 Michael Hennerich <michael.hennerich@analog.com>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Phillip Potter <phil@philpotter.co.uk>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The other advantage of staging is the I don't think syzbot enables it.
I guess it's easier to persuade Dmitry to ignore STAGING than it was to
get him to disable FBDEV.  :P

The memory corruption in fbdev was a real headache for everyone because
the stack traces ended up all over the kernel.

regards,
dan carpenter


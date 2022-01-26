Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D5B49C78B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 11:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A6B88DF6;
	Wed, 26 Jan 2022 10:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F5210E843
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 10:29:39 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20Q9s9mC004064; 
 Wed, 26 Jan 2022 10:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=2yNSlbLkdLBZkbUunOS2trYmpJbUBQ8Aav6Ld/TULvo=;
 b=gNcphO1HGZyrOgUWtOvzpGA+Cu3zASLI+aNs4JTKHQ4Ehhwm0WocX6Zz2GEh5HTVbjSQ
 h92isSvWDoU6ooijSV9gCyMJNpaGU4iRKh3Z2JlGrTze6+JrXEauZjBsba5KcneuDAhe
 auma7l5rvSUXrmKGe/3XVUk/Z9ACI0MCIrqUCakDZ5sEFLG8/c4VRxjlDbH1RBXxZaph
 knJ6RhHdKIeJwdEa+0Ve6FXgBP/AFixBWldixldQwX1lF9bDjn14eBVcdfduDb5LaEze
 iC4GIF5SXkSKwMgdwoXm7MoG9J8UIpq+Dju1iTQLjg5s3GwmCSi7k6Pockuh/i2ZUrzs Qw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsxaadt7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 10:29:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QAAUkM018657;
 Wed, 26 Jan 2022 10:29:26 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
 by userp3020.oracle.com with ESMTP id 3drbcqs749-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 10:29:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PI8FdOZfga6Fahl1l5p3Scarr7uWMz5LQU3zA0Yb85Tn05V3OX2oZIZBBWfFJ+iDk0AKRM34V3I3xbHl8Cak79MfRKcTODhoL/lQDtr/HYL+r2yPo+kKEGYkf66KdB6PZVJDEUzNeLRaUJeGW01vUjV9JmexGM2HnQZN57O5gOgv1xxFV6ps7T3osm6igHNvBk89/y62LasQdib+YoC0mcRFcsFyEMexTFLeJB+N4LZFSJCJXOdBsbwaNxxXFYTwE/rUDSt7yGoQk9mo5lyJJ7BwY/8iFC0GGeDfgYwWEfP14lMFTf3bAhE2yGqAMI1i/Cu5UTSN9hwOF6BTnqgobQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yNSlbLkdLBZkbUunOS2trYmpJbUBQ8Aav6Ld/TULvo=;
 b=c6+gqabafwAuMs0vFjJifXwkge5G3tURh++Lw0Vu02nkKMj1554wFMeqV9jPfwFW9aKUI1wT7HA4ncrAq8nMWDgsngchK93U74lXCNBy8R5n/S1UyfLlFgPFACzetcA+6Dkd+AWgiB70Mbtd5P1CnE8hFqO+E5rFFU+ElDm+suNwxatiBZHgQVT41QU2khVnniuygMX2a/yPQg9K4YoomoR1wWCBulnZEnmddwWPA9q8a42x/tSWUWlZlVUI0dlxZ/8ft5C4sH34h8aw3w1BXvjAP3vYVwMjH0wD96wLqpZeKtpfqB9ZYMhRHEJ6lLBo2ZYfpHfokf84Q0twm+4YzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yNSlbLkdLBZkbUunOS2trYmpJbUBQ8Aav6Ld/TULvo=;
 b=PiHgxwOQab1fibme8vqYB0xgJGFZRjAd7nBpVCtqj/jM/Xrui5D+6IXf6WBMNTKa5yfr4Fl83yvw61mSmx0sR38kfmvzBwb1cwkeuih+23PR29Onya2gdJ7FKF0ptSxOXZfFNWak/o4IWTeV7f0qlXQ1TL8HWIKwK0b6/ERKwog=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB2552.namprd10.prod.outlook.com
 (2603:10b6:a02:ad::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.11; Wed, 26 Jan
 2022 10:29:24 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 10:29:23 +0000
Date: Wed, 26 Jan 2022 13:28:58 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Message-ID: <20220126102858.GX1951@kadam>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <CAHp75Vd7oaYPKx6bxjCqNnm6fieeQFrtq5K4YYrxYbXoXFy=+Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd7oaYPKx6bxjCqNnm6fieeQFrtq5K4YYrxYbXoXFy=+Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0018.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::30)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fe0543f-73ab-4bec-e36c-08d9e0b6b88e
X-MS-TrafficTypeDiagnostic: BYAPR10MB2552:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB25522DC0A9ADD241A8DCAB458E209@BYAPR10MB2552.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6i2V99fme586pRyKI4S4aKtevG4VtaaAs5hzDOAKgetu/JLjf+V194AmzJMwETfrIXdQGOFU2nbkfj54NiBR4V308WV1qgy4XoU4hM6Qs7gOA/ytNca9fkIM9Nc+YUd/5yDGowzp0n2BfSpALZEEWSBuwx1aBbt/LxARp40rEyJmOG4spe94gXb7PFlHwQp+hYjwIGUzM1l4MwVsEkEmZ7FDVoV6Dm8HJ9vHTOkm21zBAtx5K5atn193QiYsjcz2QP9KA5HW6pQ7YsaeVbWlKGR7PuZ/0puZeIAszFYDouWzUQLyaaX66hsAB++vuxJurMyYVVXXbbgK/I+lIvZefhCJPEWwlJ6L7AFPaoy8jnUztxS84oAPIBfVRJZ7/porpUHlOnk6jIbNHg9k9xZU2wnRnktxa6ERldrb2ntomFeA5dZSZqqAhMF7dAM9Wh95GzkPpmtLIEzFETMbWPgEEKkywd4Dhj5ligg64KtMuHPwtF+UOUpiDpChuifz/caFlKXaGgrKYA0ZlajR77DikWpkmzb9k+3juD91KMFKkjbJ3X/FOvQeS7/vBu7+KDM+ARASvZRKo5G6ChpnFSXLSZOEZknW673WiKbEyMel6W8pd6p1UQS+XbXhOtPd2xDM9E8DKCO25HVw2IaR44kMKBBCYuQT+VnoYwmFWVwjojQPuHr+fVCQgjocmSKEcEAjPys+ni7t06Kx05e8xBkabg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(4326008)(1076003)(508600001)(7416002)(6512007)(9686003)(6506007)(4744005)(53546011)(33656002)(6486002)(26005)(186003)(8676002)(6916009)(52116002)(38350700002)(316002)(86362001)(38100700002)(33716001)(66476007)(44832011)(5660300002)(2906002)(6666004)(66556008)(66946007)(8936002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hb9As2ryS7s9nINt0NzrnCYyPQreCEft7nvcolfoIHzDe4toi1+W92GR3J/g?=
 =?us-ascii?Q?4PO7EMVpeuA763VUo+Id+LF8ayRBPZL4h2dqqwHWCohUvbFqnUFnHt81eryD?=
 =?us-ascii?Q?qJ7T0sE2EeoL+qHtFcIOuymLOHP9sATdMDeXd3zCj+QnPly4ctQEjMRIWxk3?=
 =?us-ascii?Q?7QKDRQQF4AcsPtVzX6R2JM4DuAkIR6B9mIezC8THeGhH14rzyUjUJfqg42kt?=
 =?us-ascii?Q?vUottzNwuE3FqqK/87a6WX/OVaNYWUWWntx1ejjf85PPFV/Ow7ELn/HP6br0?=
 =?us-ascii?Q?+8/UedaJzc4CB4MzkyAc6MJNvGgUxxwPyOz5FhbGRGKOgSVSbDbB/vGM7JH8?=
 =?us-ascii?Q?5Lf6kX6+Ynq2xNvmh44mkEnpkYyoSAgo7uwzLrC10wLqQIajBH36JShEIcFy?=
 =?us-ascii?Q?WSQs6VrPb0R+6R4IydFAvq9jIWoq9px8+8tw7flZ5UPwNmXNUNGOw12kTZH6?=
 =?us-ascii?Q?erX0bB6eVJu53SrpGJXSgv2+I/GB9eOlAFo7s1IGhWZh6OPhQI557qbKc88w?=
 =?us-ascii?Q?yH3m6sNIC5PCapBumTO87G0zdEE+ibwqrLkQVynqEqqu+xAhdqbHrqePPbhS?=
 =?us-ascii?Q?hyX0gnC1XLivIXlPLOTgRGU9+Wl8clUrOxAedvnqtgZK67T3u3EGfFQavhaR?=
 =?us-ascii?Q?55lvTxLbXJ53UMRN8EvRHRe6VE0x0P1uVM3SrsSWlRYFrF9Ift8Ot83e311x?=
 =?us-ascii?Q?7H8pY0htXS27KCqWlezt/KRMxPZ09cDEbjXqHqi4aTbd8Atsma/FeDo4etAT?=
 =?us-ascii?Q?OLLsZzv2wvT5I0XUSzPNxu13KyVTTmIrEtUOHhf2XRo4xcGMeFbFOIzujwmz?=
 =?us-ascii?Q?un1zU6Hgl5SdioE4rCGGfHcDJsy4i9HVsKBuQr/jAXw66MI22xldQTX5X9WJ?=
 =?us-ascii?Q?QTffDD3UpV2CgoN7n/1NJnOYsN18nOBK7HxkrD4GEmgciZlLzlzye83q38kt?=
 =?us-ascii?Q?3sE7Fo3SP33EGmTIjC3CvCnd4pM6G+/CiZ4L826dlfcVsB3eOZlHl+8nzvIi?=
 =?us-ascii?Q?ZhrSh+1mIr+pAnDf+5qJ3iY3/kgDU+V3y75dj8UVHMVJHmKdkIwtqcw3FSC1?=
 =?us-ascii?Q?Kijh3fOc8w19vgh5O+3JCWUoPQ+ttjzJ8chj0Gy4v0nvus1LZTeKxvwEq2JT?=
 =?us-ascii?Q?JLDyrii/XSJSY9B/WIlGtio/2z3yL8xCrQ4EcLK9EvRIydxR/RNgF0LX+pK3?=
 =?us-ascii?Q?dTe53J7PZDoio+ulNfNdAco/saFmRZi2NKMJvKYnDKPC8AvNwyZqS/Q8RUp0?=
 =?us-ascii?Q?HlK7tpmxwUVglgtLAgFkG8rK1QVfB93YdTwxeEfQNGHZYROEvWECdrOTSJlr?=
 =?us-ascii?Q?cRdvQrp6fDxqOTaw0HhWIPaXr/W7iGTTCHCwPspDA0sKUY1Nr8Sj2eJGsiaX?=
 =?us-ascii?Q?nF/rRDMLIdkZ3MXcQl3oIbM/bZcx3d9S+iNKZnP3PET0XwWD+Mggtdr7OTTL?=
 =?us-ascii?Q?yx8/zHnJaURc++lHODux9j2FeAGaOMMMsE3oML5oGyxcNv7BphBAkpi4gt4f?=
 =?us-ascii?Q?hENXH6Mmd+Eh1IJZTTNG4RAiT/0+FyRqaxUS4QvK689ft/pCNti/wzpqFWhd?=
 =?us-ascii?Q?OPX/AhOWaBe6LY3F+gJmJ4lEdW77xH6RCxuwnMGejYPzHomT/k0xaZRmAv8y?=
 =?us-ascii?Q?xU7uCGWRWGNJBut+O0njDIubQM9xVtJKOa8Pmdq9rlMf1eWRTflhAa9fHlcz?=
 =?us-ascii?Q?AU4v/s6bjLUPmzgxVIy0aHUsk5g=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe0543f-73ab-4bec-e36c-08d9e0b6b88e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 10:29:23.7489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T1echXZwhjOY8JX4sGrAPrf4Mvb9Xir6kWb4vlmFV2Kbd9CI72bR3CfPkM6g2Vh9R5eOyndb/wwjnFTvXI9tJVoyzsrP9S8tOXBv2pUVFXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2552
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260060
X-Proofpoint-GUID: alxFIX3r71ouRqkBE2rGXGjJ-Vm8Cdj-
X-Proofpoint-ORIG-GUID: alxFIX3r71ouRqkBE2rGXGjJ-Vm8Cdj-
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
Cc: Andy Shevchenko <andy@kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Phillip Potter <phil@philpotter.co.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 12:04:26PM +0200, Andy Shevchenko wrote:
> On Wed, Jan 26, 2022 at 12:02 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Jan 26, 2022 at 10:52 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > Am 25.01.22 um 21:21 schrieb Andy Shevchenko:
> 
> ...
> 
> > > But why? We already have DRM drivers for some of these devices.
> >
> > No, we do not (only a few are available).
> 
> Sorry, I missed your word 'some'. Some == almost none from the list (I
> don't remember exact numbers but something like 2 out of 10 are
> supported by tiny DRM and see about interfaces).

Could we get an exact list?

regards,
dan carpenter


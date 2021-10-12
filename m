Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D11342A7F9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 17:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE90389CD7;
	Tue, 12 Oct 2021 15:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6391089CD7;
 Tue, 12 Oct 2021 15:12:54 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19CEfarM010972; 
 Tue, 12 Oct 2021 15:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=YAxmKmUQqq1z9mrYRoMh6WH4Gjo/bH3SFQQoXE+byII=;
 b=VtUsgvxSvzrFCsZBPcLZd/4pbedrtJVk9ejEP3yeEvGMAERNXrIDD8ig6JlsX3CBQ+gg
 hFHHrn9t1SA0ml6wWrXIgKh/traWdbJJmrXW/tSBHvh3r947/A3HL+2jWKIZSuCKIRaB
 4rv4ne7fwOb09JbJtV5xK8hU2wLSX3ElhaNarivEDWN0mqAop2nTpD1UCr4kUiTF8BXG
 pSJsXztA+Rb3jAfg+ojjXTUXZfBcRRCYOWNIVFmo3TFeKldRTlqKrByJTs6kU/EyVUP9
 fkFLJ/eu12KNSSMv5/MWmU1vqj1dBgS5Wvcp6QyR5ax07K5RQtZYXz8pyzkvvM1gDfNc Jg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bmq29ry5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 15:12:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19CFAOKP110371;
 Tue, 12 Oct 2021 15:12:39 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by aserp3030.oracle.com with ESMTP id 3bkyxru8q0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 15:12:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KocL6Sns53BaMag0OsooDR3aMM8rVdYD7IAo8juakdmPJjJsUflLfsE5EX3hvkVsnZzSLaWU9KK8PGGe4cXgHjxZ8lCGlCcxrLQlRqhPC6qmo444H2zmtDtXVMni4Wa+DEPifc0KDSODEJNcHlDcxj9Cl9ISL/TAMph2iRAkSWxxqaYbiXYFJMJoSRaROZO0x0jLhD/PFV+O7groAhX/Rx2rANeeBruHktIH2+CmPSCtSzyBYyDNn8vsajHwRgZyOx6ykaeBZomctA7ufw8FJgJzUjzi2tomWTeCV7rxYzkLvxHa3LJhi910mibFmKbft0EGKd1XL5DRQODNO6VNOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afwuR/o9GcMBhBUVWXsp4KAOLuRotFW9HgspBHxWMLQ=;
 b=QYXjPGvdHPOySaozdUCr/HVTYpcf1DsdT1llF0XwGmVG/W4eJT6hfK3uid0cqwc6rglVUfx341bofI5ZuTd98mR3CLshfVKVc+x7GCShwYygnKesup3iXZL+r+kxOuCRSEF2qwW0J1+rObYlTG98+08KWrbvv+T6vijrVjboJcma66xV9/b9EBr7pNtD7+rYVXFpNlPAQKaptwR+cmd0FviAPxDXNeNTCh9oU37D6kKp6U1LBCvtlUrm0T4zBdGg7fb6weW6TG3thBrNv3VY2tJEC6q7ajfkQ982geg62IdBF/HhcakEMdO7wZPyKi2DkPa4QHunt/rLCkSFjNCcNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afwuR/o9GcMBhBUVWXsp4KAOLuRotFW9HgspBHxWMLQ=;
 b=qe2GUE0K0WOnEKDifvxwmwVbqUZYJ/AyY8pw9fcriN5eXj+v4PkzGZHrKhfBzfqlZBVA2/6PWD7By6AKVziVd+H5lCpgO7wsTVo2A1VJiIH885YnLm3EM70jsU2KPKtfdZVLjBGI9l7uRuA80CziCayWIgoG4iZDC7weA5N+umQ=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=none action=none header.from=oracle.com; 
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW5PR10MB5808.namprd10.prod.outlook.com
 (2603:10b6:303:19b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Tue, 12 Oct
 2021 15:12:37 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 15:12:37 +0000
Date: Tue, 12 Oct 2021 18:12:18 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Colin King <colin.king@canonical.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/i915: Fix dereference of pointer backup before
 it is null checked
Message-ID: <20211012151218.GF8429@kadam>
References: <20211012132549.260089-1-colin.king@canonical.com>
 <c49654d9-7174-f6db-e64b-bec3ecde7b5c@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c49654d9-7174-f6db-e64b-bec3ecde7b5c@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0046.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::34)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JN2P275CA0046.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend
 Transport; Tue, 12 Oct 2021 15:12:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9698186-5dd2-4c61-3c62-08d98d92b96a
X-MS-TrafficTypeDiagnostic: MW5PR10MB5808:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW5PR10MB5808F330D1B127FEEA6457958EB69@MW5PR10MB5808.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QEAaldaAlN9pcOxC9ea7JDSYyQbdWfDee0V6GUpbKeYQqnj2r9klUgR3Q4NFGbtjURPCcR8k6wm7Eszdu5ctZ1vzPeGC6aMIq3IENzPu3jDSlDZjw3OMMZ72OSV2FGLM5ZxBK9aCbuC5oZ1BQVPl5jBesIXyar130ftM3tyFGZs8CJwsw+aumHrM+JCnM0lH4+9ysOzIlOoeMO15zfEcdnLXYrZq1K345HK9PIcS5wIyVjHhYNBxwcJWkqhV0G0T9VeiqF9TKR1vbuS9vWfIoMd4dR1aRNkiygQXpbQs5PgsxdLlB+Dwbk2aEiM9rYbqn37xbCUdf8lv2F1c8LvMbZplIHgWpfD4SeAZlcshUvlx+eiYDc0txotL4JH1wQJwH0a8Be+DHWFBd+1GFOv3ooq9Wh91syMTZZqKq4fh4Y5fAxG/6+lS4v6AIbvqDKP1JGKQmTXn5Bmh4RLJnzBvchMuvBrDP1oMn6gWbUyi4IWoIWb0Mc5T89HHhuDTXPYM8ihSAqEJOFCAnEj+h8BvI90PTHeUMh1+eCw6s+BfREV3uoK6UbSMZTlNB4lyEjydyOecm3puBCa9yh3ol3c4KQgc+JZq6Pht2gannFJ1TihENn7mit/uI0iLdXH3mCRIDCUGgiAtFEFtDKifqfmpfoNKIDC9k9d2pnTnRXloFlUhsZHn99muuTvV0o0sn4MAV55KdmK/xWoNj/8dNZ823g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(33656002)(66946007)(66556008)(33716001)(9576002)(52116002)(4744005)(508600001)(83380400001)(9686003)(55016002)(53546011)(1076003)(66574015)(956004)(6666004)(66476007)(186003)(4326008)(8936002)(26005)(6496006)(8676002)(5660300002)(7416002)(54906003)(2906002)(44832011)(38100700002)(38350700002)(6916009)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AGUB5G3UWS5e5Iw1tbZAyX7KjMypYWmgibhW9doarpFjSXvvRMriTvYTrE?=
 =?iso-8859-1?Q?w5ntB0Yi7Z8BuyAFCTQlH6DiEBNZk760dMqWCR5TRV2Om0vnpR1Tzp7K7O?=
 =?iso-8859-1?Q?1cqSNNOsP/2rlG5ias6/h6SYh6A6kIJKaE9sT+6zl0VgL1POkM+ZE6WLX1?=
 =?iso-8859-1?Q?NyXmRzCxzJTzWF7lxaTS6ZCReE3hoZGkNqVULafW/HmGivdMJ/7Ulgn5uN?=
 =?iso-8859-1?Q?vrT+Mkf9qaU7Lhsw6H1imqCVLElVVMPbaN5+rEUMWbq+NMRN5tPLbepYNB?=
 =?iso-8859-1?Q?OkiXtSUhgO9k+1gfmHw3TKdayZHwo/0WZMsV09pBCtrJdNL1smpZ+WhGgx?=
 =?iso-8859-1?Q?R6f0T8+Geuex7uNBGITZR7lnlNrhtwOAPD3XCe4PcjbsN+vrALa50WqONq?=
 =?iso-8859-1?Q?15TgbusV53BHnFkoWYwdvrLRheK8f6t4VMnWGCqOA3YYg0dwZmEtoJrPhR?=
 =?iso-8859-1?Q?myZb2V99HlR+fn6DeRCV5FdNvZxhxu6kl8BZy0r9Ltn+/LeGrcxQZdKv+P?=
 =?iso-8859-1?Q?wlTAPPl/HLmoKeiTm31cVrqWvAnox8HFY++EHrMMA/f3Y+QH/Uqm+HOTpH?=
 =?iso-8859-1?Q?zPySmuOJSZmBoHZyNtBlaOwT9Ht/zoaHhcqW27HmTTHQ//jzDOSUfR5OW9?=
 =?iso-8859-1?Q?GSGy1LiLrIr2gBOcBjSY6GMF3dH40Y757USiJB4D1sSAIEDX9eErKSfwtI?=
 =?iso-8859-1?Q?PEQGfkhOo1340/9RuN2CtZ2w1be9ZyjHvZCQBMc2VQkx7E36QazYgHZ1NA?=
 =?iso-8859-1?Q?JAV2REuU6vaxkBXTHIgtCBrDgz49USHz2FkxO30GSiqnCFsRyb5sabSqqG?=
 =?iso-8859-1?Q?GfFXBkgZZ0harzIxvfbYvPTMPqp10gfly/6HK7HJYBjjTByWqkSf/tNWAf?=
 =?iso-8859-1?Q?xsRwIsqQNPIh3OFHoshNIw69rnll1Vy0bJyVZrEu/mZHqV7WyaFbd/34PI?=
 =?iso-8859-1?Q?BQANfL5eyqoSIwjAjG9pQKreCkQQ6ucS8raOqJxSdO2838Pk3vQ3wSrwwu?=
 =?iso-8859-1?Q?F+CH4cjLPCAq1eHo41ZX4yBxEZPL0mTyo17BZRZ1c9qvo+097yDeq8lxQk?=
 =?iso-8859-1?Q?fYIdNyTi7uRIOvBBw65ul7N3UkGLFWNA4CU6/eumk2Q1zjBV+YbrVZBgKH?=
 =?iso-8859-1?Q?e1rVGOKXVDW5yrmNoICZFXIii9R9t4hFHK1QQDN0Lh8zNhpAK/FqRT5kXs?=
 =?iso-8859-1?Q?wdJALj7mwcV7Y78P4ROqFwc1ezE5gg/D2e6osSqxVcqCkezjo9Kq9ELWpw?=
 =?iso-8859-1?Q?/eaYEdOf745S7vj+GAzyqcRDdzk2d6mEkC+MGIR34ttJ1IaSOK+IJoYicD?=
 =?iso-8859-1?Q?/ALz2tQz/GXzSemayNS4gtAS7+2A322HTS91rOZ9I2f4WRF4M/Nn48liBl?=
 =?iso-8859-1?Q?LJAgRQu+Ty?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9698186-5dd2-4c61-3c62-08d98d92b96a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 15:12:37.2050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFkHbay6bmjbnKeZJkrXwHxePsz3PKtpeufa/0sFhQJ4J9fDJfEB5QMbbZ80WLhDpgnnF5gFO4x8gcGHsJynRDeKDWAky7Oo0r2sjFyyK7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5808
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10135
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110120085
X-Proofpoint-ORIG-GUID: 8ITYZy3AUPlyLj8yqPfoLZRWgpqth-CX
X-Proofpoint-GUID: 8ITYZy3AUPlyLj8yqPfoLZRWgpqth-CX
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

On Tue, Oct 12, 2021 at 04:47:24PM +0200, Thomas Hellström wrote:
> Hi,
> 
> On 10/12/21 15:25, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The assignment of pointer backup_bo dereferences pointer backup before
> > backup is null checked, this could lead to a null pointer dereference
> > issue. Fix this by only assigning backup_bo after backup has been null
> > checked.
> > 
> > Addresses-Coverity: ("Dereference before null check")
> > Fixes: c56ce9565374 ("drm/i915 Implement LMEM backup and restore for suspend / resume")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> There's not really a pointer dereference here, just pointer arithmetics, so
> the code should be safe (but admittedly fragile), so to keep Coverity happy,
> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Yeah.  I kind of feel like we shouldn't work around static checker bugs.
But when we do then there shouldn't be a Fixes tag.

regards,
dan carpenter


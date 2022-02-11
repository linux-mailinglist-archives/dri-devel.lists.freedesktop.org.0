Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FDA4B1FBF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 08:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF7810EA0F;
	Fri, 11 Feb 2022 07:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9510A10EA10
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 07:59:09 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21B5wef1026349; 
 Fri, 11 Feb 2022 07:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=rDv6YjHf3LxGrBhr4vdoHZKdZjk5Qz81r40Tu2kn+nI=;
 b=U1ag+gyov1lIB/1RXGk74gOHZl1IdjfYuV7ROjZMBjIlyZdWyZhRgVeh4x2ZRMj0lol+
 3o2ex/gsGre50DQAn54GhYGpJ2Jweb4juGG6dNUjrnZcVmTX6SUhZIDtfCGBi777vE/P
 nE/SabG3mwbTgfDPF54Y0Iflpgw4PQqNODhft4B2tjtUV1nnzmAOokSW/t6V7bT6jA9Y
 b2dBlOfvswpCWLrpvtc2BwhIjuQUmH6cYsTKPIIMAknTKmMDu0jx/tUcPXWowpg2Qsdt
 xTATuFwolYTymnwEoXkHK+d0repFdjbn3jEkcyDrpYw1Ps9FW9Dp/LsfBMV4M2f4qVfq hA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e54ykj122-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Feb 2022 07:59:04 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21B7ZwKA134477;
 Fri, 11 Feb 2022 07:59:03 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2169.outbound.protection.outlook.com [104.47.73.169])
 by userp3030.oracle.com with ESMTP id 3e1ec6njex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Feb 2022 07:59:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDm9UWapYI+wfZhMmuACbQu7vb7DBFiJjpkaL2PgDkGIrwHl72NMWiH+xAxjBnGHH7KXReYzqfijVPpIFDhBdgNeBmanpl5wizfYBsA3IViJZvTOfEum4QKsLVbLIn3frqJnmEOzNgiGkjtO2VwhOXQkfKDjCsGsAUNcPc0nEii2ftLokg3METEgToMzK6zKwb2h43vizW1jiPWBv6RUeEuL1IcHsTK+ZSb1cPE1KmBM1Z9HPNmMicol2Qpn0Yd1nf6KjJIIkPhqFE2WUwObTIsz7kEvx8EJPdgAYvPFsU9irbxoWPpWUU8LLgasQ5fOKu26eGrDy8O/hyQQ9JaoXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDv6YjHf3LxGrBhr4vdoHZKdZjk5Qz81r40Tu2kn+nI=;
 b=LaOQKtoYSnsP6YouxIrjtg0HRReDR9LRisL88T4P97uZ6VXMjWm2PepBrwuTCQjzyVtH4oAfLrNtRJz35WVB7t1FtEPHOFzrJljj0lQoaN644VZ6NDPa6ZVTJARvD8eXTcXdb+bvRR7IWCefge/+Bh7s7dvYm6MHKPzNlGBPR3Gz3gx8BH7Di8JWh410qh+KTZWZX7ElELf/StQD90abVwQ4ls0mlwaApSMZ+qAJdu/WOLboRzkFj/j0fp/i4jwzkZMuzs9THdnCynVgY8NjzkFji52ChiQM4WLhE6z2BPIxa7EDE1caw+u7DdSDBuyOFVvALBp0JsdbqKBadBb/NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDv6YjHf3LxGrBhr4vdoHZKdZjk5Qz81r40Tu2kn+nI=;
 b=uKwNARR6KW+luEdRczmWi1HqjaS/6p326Z/B5TE1t8mDhXnD8PHskW2ptX2+9c0QeXZcPRMmvL/nbkGppxVkD+YmCQPuleeTqgmDendUCPGdTXwGgIJqq1riTQqtvt+qLgED1bSLjKAljo6C9owEdeS5U8n5CxUUBJS5ARgqO8Q=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN7PR10MB2739.namprd10.prod.outlook.com
 (2603:10b6:406:cc::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Fri, 11 Feb
 2022 07:59:00 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4951.018; Fri, 11 Feb 2022
 07:59:00 +0000
Date: Fri, 11 Feb 2022 10:58:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/2] fbdev: Don't sort deferred-I/O pages by default
Message-ID: <20220211075844.GM1951@kadam>
References: <20220210141111.5231-1-tzimmermann@suse.de>
 <20220210141111.5231-3-tzimmermann@suse.de>
 <YgWAvXF+WClk/fyk@ravnborg.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgWAvXF+WClk/fyk@ravnborg.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0020.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::32)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ddd8fdf-7540-4350-919c-08d9ed345cb1
X-MS-TrafficTypeDiagnostic: BN7PR10MB2739:EE_
X-Microsoft-Antispam-PRVS: <BN7PR10MB2739B6C396A44847FC770EC28E309@BN7PR10MB2739.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aguGgWb6fBVzw8mtrlL4sg7P8WEp826jbg3U76cLXVTLcHQWa3n5Lh3a/cd34rLejazUiAQz7ujk7qu6hJc+EbkxEuG9M7jRYL3j7SmAgEMNYxToQkwHFOF2knFIZ9eI25Fqy0c4fHHq1qrL6GpPPr1df/vqo1+b6V7vM1dV24lgIJJRwdP9v6LfGo0nL+TbbHwRhLmzStdqBva/4sp1BUqY05oiqPV3cI9R2dIb0bw3m8W9OMZncmRiZB15Rtwjue6cFqZFTU/7LRt7EiypO+6JUZScAgnaN1guq1dJ+QYDFOoTL9lNqMOz1e3HFxqUrL/7em9YOeGq6BAWFRgzp9spbuf5ccpNLyFYKjqtPzJuDxzvAPKKA4z+PvyTeCvl2vCgVHzGVUQkWOu+QoNtDjjswiXf4DzV5nyD9skvbTkH4deAew17SSaBkmZP/XWho3tDxScnmAh9ptEjpAE2GWBUxAWQH4g4LznXhzY5tC4tNbRR8Qu4uDOMiCMqeu+JSK/TkOQrBfJB63FBS22qjykdy0jNaf7vqSTNtKqiMEGMla0M63z/xrLtht3ByZ/D9pXdBB+SvxUKAHWM9JDfO8JqVzHGgAujzNeMK6z2ncbBUwj0cAT+66RTlJFmwU0C8YLWcDPtSNx0ntWhz9zLamuNaY0qysK9/rDCsERLlnwEhI7CzyyL4vvkyyjQQuAEA7MBx8TGzAZ27lhttpZFQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(316002)(6916009)(66476007)(38350700002)(86362001)(508600001)(38100700002)(52116002)(6486002)(2906002)(83380400001)(8676002)(1076003)(26005)(186003)(33716001)(5660300002)(7416002)(33656002)(9686003)(6506007)(4326008)(8936002)(44832011)(66946007)(6666004)(6512007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UTyw7EpQB0jsAmC5/j2u47P5h1ZCoOnpoDslEDG/Ltyk1vCFt6O8JDKYYeDk?=
 =?us-ascii?Q?rv4WPTVhJDI351ig5JGYmsTqubUWLYKViR9TsN7dUelEsMfQ3iXJmhdkZhAl?=
 =?us-ascii?Q?HYpCUbnI9bCz50dw7oJDV1oj3c3xtjvV8nbd19JC21s9dRcXGhWijzR6+ejw?=
 =?us-ascii?Q?GCh4DH1PxRpxsV/Bv7exTDO3TVnwdWQcJgNa2qKnPN+2wqgwhB9wOiiPAMWn?=
 =?us-ascii?Q?sLYS85QMcUg1jVcvC4f2rXAy0XITbal5QbJpsKH+E2jp8NcvbhBEsxd/Xc/J?=
 =?us-ascii?Q?VcQ3kcL8MKw5S5x77zo01jA+fOK7tq5+AYXdELOvFv8Hj6NUhWr1aBG7LtjD?=
 =?us-ascii?Q?8LI1CrfaSm7/6z3a2IA3XmB12PGCho0Dfpl00eF5ppTB9qOlq9ueId2mJ/RX?=
 =?us-ascii?Q?qNucrk+ZWtQ0Q0fAdppFN410WNHav9KdEQzPk2E21mczkDVmbAUl/vHJACm6?=
 =?us-ascii?Q?4nz4cSFvpkQN87UCyeui9Fy9z6Y/qCqWLdOkz/yklTZrHchban+fQfJehc8u?=
 =?us-ascii?Q?RCt2qO/xW/KNoYL0VHbguZJFhLbefBM39hcZAHY/60c3RqWOk5dVWwz7PCqF?=
 =?us-ascii?Q?TCr6CiF3o9v//ZTVfa5Y6O0wMsm3ZgMUI9gPQsDsMaOws3uSGEkWZpZJ9pS+?=
 =?us-ascii?Q?VRJH0j2RVp/Nxp8CgJuKPVosGebvAFJJDTyALjPLGIeuk2JE9KgtjggJPj5/?=
 =?us-ascii?Q?HpiWxDOYchBR+QaX6NBFehUUQpwJpHRcG5OcKnBAbkKcRX+mFuk3QH/bmnih?=
 =?us-ascii?Q?AJSLgYwJ4Z2xQKOD/0GtSUULC+U1Y55kDWr3QvSGTeI0Op3UK5ScvctwyX/Q?=
 =?us-ascii?Q?m1FihVMgbVDwm2nWI0/j/nBnxfXrkgWACadocsokOh1EXkBGyEA01fqoaROW?=
 =?us-ascii?Q?L+6uazEk9dDoYlzftbJX/vRfn2kLI4DPT0nfqDE0OO6cNdqPSymR8gCUm0Ed?=
 =?us-ascii?Q?xfyBZvk+BFGbiDwLN66zzXA6iMP3fhXfdOLSeqj418aAuGGnIelnHHeCIz1n?=
 =?us-ascii?Q?F4/j3nDWqm9ZjJ7MqYUo5MfYpHmzAvC9toggB+nl3Aiu3Lrs7TgmrWuz03Ab?=
 =?us-ascii?Q?QpH2wksuCbm3faH9x5qsphUTPSDi55l2+B4Z9Eed79wVQGJfplbeZze4ZFv2?=
 =?us-ascii?Q?hiyqZtaJCPSYX1pdGbaanT+SsGy7sGcXWJccm2AUEpp4fkqJdSWVWeB4FtxC?=
 =?us-ascii?Q?przzo1wVOLOVdDuQLdpcZTnAGuOWIQKH39BhrjXguMIxsz6ljSPd/xD0kHQc?=
 =?us-ascii?Q?YXY7y34v9hh9rSUFhV92P1Jq9VGj/rf4gsX6Sy24DOlstp7dKzsO0TlGze4+?=
 =?us-ascii?Q?kaVPNWghJU9H2dnXsC6MQnvFtI/3DdsTByg85Uzo5L7pw79lfuFVArUp95Ku?=
 =?us-ascii?Q?X5hJ2FV2Hit4bduD7LNgZiBcBoSclVCyj54femHr5As3NT0zr2DuHSfGv7TQ?=
 =?us-ascii?Q?P78U6NSEZpGz7yWG4cXID5dhUA7G5R3wIHU+EYsoZQgBWm8Lfkx2b49GarZW?=
 =?us-ascii?Q?IfBfgnZJlKuvIiBHO9+8m9eG++vI5AsqdoJk2chhrdwcWaa3tszy6xTbH8UD?=
 =?us-ascii?Q?OoFYy+82wDVlWetjyed89f8YBiLy3l4INyTSd5mO7mQ0VtiCtbcWVpi3cts+?=
 =?us-ascii?Q?KiDnGfzwOmAbVPIDSchfZoN4lZl5Aypq7phRoPW2Uzin4Zo7zY4QBs/vZi1b?=
 =?us-ascii?Q?G6p5UQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ddd8fdf-7540-4350-919c-08d9ed345cb1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 07:59:00.0734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLbOh214auGsFHOMdJKL9NDdTTqu78IBnYjMewLUgR9wpaU5Kg46CyE/g1VILrHz5nWc9FfWFmIELxdKdrYm2Hk9rMD32/pPCXAOnX2BWTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2739
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10254
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202110043
X-Proofpoint-GUID: e6_e08cj0dEFX5L8FX6xpU-Pv94g6Smr
X-Proofpoint-ORIG-GUID: e6_e08cj0dEFX5L8FX6xpU-Pv94g6Smr
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 deller@gmx.de, linux-staging@lists.linux.dev, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, bernie@plugable.com, noralf@tronnes.org,
 andriy.shevchenko@linux.intel.com, jayalk@intworks.biz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 10, 2022 at 10:16:45PM +0100, Sam Ravnborg wrote:
> > diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> > index 3727b1ca87b1..1f672cf253b2 100644
> > --- a/drivers/video/fbdev/core/fb_defio.c
> > +++ b/drivers/video/fbdev/core/fb_defio.c
> > @@ -132,15 +132,20 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
> >  	if (!list_empty(&page->lru))
> >  		goto page_already_added;
> >  
> > -	/* we loop through the pagelist before adding in order
> > -	to keep the pagelist sorted */
> > -	list_for_each_entry(cur, &fbdefio->pagelist, lru) {
> > -		if (cur->index > page->index)
> > -			break;
> > +	if (fbdefio->sort_pagelist) {
> > +		/*
> > +		 * We loop through the pagelist before adding in order
> > +		 * to keep the pagelist sorted.
> > +		 */
> > +		list_for_each_entry(cur, &fbdefio->pagelist, lru) {
> > +			if (cur->index > page->index)
> > +				break;
> > +		}
> > +		list_add_tail(&page->lru, &cur->lru);
> > +	} else {
> > +		list_add_tail(&page->lru, &fbdefio->pagelist);
> >  	}
> Bikeshedding - my personal style is to have the likely part first.
> This makes reading the code easier.

I've thought about this quite a bit...  I guess my rule is to avoid
negatives as much as possible so I prefer the original code.  My rules
right now are:

1) Always do error handling.  Don't do success handling.
2) Return as quickly as possible and pull the code in an indent.
3) Avoid negatives.  Never had negatives in the variable names.

regards,
dan carpenter

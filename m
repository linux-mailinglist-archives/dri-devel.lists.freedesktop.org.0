Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5900D492C72
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 18:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B820610E32E;
	Tue, 18 Jan 2022 17:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C6B10E26B;
 Tue, 18 Jan 2022 17:33:57 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20IHV1Jg007704; 
 Tue, 18 Jan 2022 17:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=m4YN97Ezf2X/IRbd4dP5YwvtjgnOkn/CfTbzX/eD88Y=;
 b=rFReYoDFyPnMufNkyObkZTGR9Aes38GTG7hC1RvKU1VC+An7ctNIc+SdyIO0svJeyaq8
 Ku06J7YqCIEVmCDFo8fpCo8PVjNZy+Yc2xHTeUvi3w2pn4A1XeFYzzsajR+NGXIVZoUV
 ZrKQC2d8S8PHJdKf7aK1/ZlZLwxoSENV1i5UEuJNryxa0f8PIiBQgXjJqdWreeSVLj3n
 Q+bUzhss0dcqDfT2LwYrMx2XtqMFNnjfdRf2H0R8fmpJEujZymU96C0o9VpN+WAA4+Ua
 sLi3jHxtcELuMEoo1UkseuQTNUWckAgUIX4D6vBqXDxfg2jSN4Hno3aUjrPEqV1kPglh aQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnkwhvhnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 17:33:51 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20IH71BU030410;
 Tue, 18 Jan 2022 17:33:50 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnkwhvhn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 17:33:50 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20IHXnHE030389;
 Tue, 18 Jan 2022 17:33:49 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 3dknwapk10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 17:33:48 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20IHXj9w34275584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 17:33:45 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89EE1C6055;
 Tue, 18 Jan 2022 17:33:45 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15585C605D;
 Tue, 18 Jan 2022 17:33:42 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.138.251])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 18 Jan 2022 17:33:42 +0000 (GMT)
Message-ID: <4be1db57a8cc91b97c117b6dbda3aa11c9566c13.camel@linux.ibm.com>
Subject: Re: [RE]: [PATCH v3 10/10] vfio/ccw: Move the lifecycle of the
 struct vfio_ccw_private to the mdev
From: Eric Farman <farman@linux.ibm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Date: Tue, 18 Jan 2022 12:33:41 -0500
In-Reply-To: <20220117153527.GA84788@nvidia.com>
References: <PH0PR11MB5658A7BB11922E5B6267892AC3619@PH0PR11MB5658.namprd11.prod.outlook.com>
 <595bba117f20742dd581fd951555b0e1f630264e.camel@linux.ibm.com>
 <PH0PR11MB565874CB787A1ACFB12CFF6CC3679@PH0PR11MB5658.namprd11.prod.outlook.com>
 <24628dc7-c6b2-1287-b435-e12e7b3d59a8@intel.com>
 <9866678ecaafffebbfad8493e192e248b8be8f27.camel@linux.ibm.com>
 <20220117153527.GA84788@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: agc4J7S_SraIH9Ze5EI8TmQdJz-DrhiV
X-Proofpoint-GUID: X3ZmPE-bw4Nitd0RzkIhNbbXDB0mmpE-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_05,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=949 lowpriorityscore=0 mlxscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180105
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Liu Yi L <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-01-17 at 11:35 -0400, Jason Gunthorpe wrote:
> On Fri, Jan 14, 2022 at 11:30:36AM -0500, Eric Farman wrote:
> > On Fri, 2022-01-14 at 20:28 +0800, Liu Yi L wrote:
> > > Hi Eric,
> > > 
> > > Hope you are back from new year holiday.:-) Have you got chane to
> > > consider
> > > this patch?
> > 
> > Hi Yi Liu,
> > 
> > It's coming up the list, but it's not there yet. Haven't forgotten.
> > :)
> 
> Liu would like to see ccw use a normal lifecycle for the vfio_device
> backing memory, is there a shorter path to achieve that then what I
> came up with?

Getting through your proposal is the task on our plate. Just not enough
hours in the day at the moment, sorry.

Eric

> 
> Jason


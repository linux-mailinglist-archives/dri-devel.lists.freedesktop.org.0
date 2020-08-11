Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D83A2417DE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 10:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB2F6E4A5;
	Tue, 11 Aug 2020 08:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A5D6E057;
 Tue, 11 Aug 2020 08:02:36 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07B7w3WB181527;
 Tue, 11 Aug 2020 08:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=GRGFv4TBi3bpKYmz228Zg1/rk7iTOPq7cAFHPbz0XqU=;
 b=tv8zAIY1s+kS8HP2+tYeG0B3fpahMIAFboVmXBvyWEUcEucAemoTX2WQFxRIrZPU1aSF
 SEGUJMZZpeRdZg7jH68HjZxgqRVAsKEJ+p/vyWz3lKqbAHFm2FBydIolQTUyvOedG9iB
 B51m5u+HbxDOkrwVoibN8/83WyyqWwTMbP1JCEFue1GAibYistjiEo6rVL20/PLbYFFH
 8zSoQmo1grQSyHqcxyPh3ed0+vTeDp6ZuhrQp8PjuagNGQwRXaKgepCZg7+jC6xuu9Sz
 O03gpXD/DpTsGOgzoRnL2qfale/MSs22OFxtuwNQi/DROJ8wHYtz5vLJMArUI74Iqq3S /w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 32t2ydhd80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 11 Aug 2020 08:02:32 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07B7xRi0147291;
 Tue, 11 Aug 2020 08:00:32 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 32u3h12tue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Aug 2020 08:00:32 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07B80Tp7029665;
 Tue, 11 Aug 2020 08:00:29 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 11 Aug 2020 08:00:28 +0000
Date: Tue, 11 Aug 2020 11:00:20 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] drm: amdgpu: Use the correct size when allocating memory
Message-ID: <20200811080020.GF5493@kadam>
References: <20200809203406.751971-1-christophe.jaillet@wanadoo.fr>
 <20200810154213.GM1793@kadam>
 <8c414dd7-4a80-6ff2-03de-5340fb0d9c61@wanadoo.fr>
 <20200811075702.GE5493@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200811075702.GE5493@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9709
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 mlxscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008110050
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9709
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008110050
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
Cc: Ori.Messinger@amd.com, airlied@linux.ie, bernard@vivo.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, colton.w.lewis@protonmail.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, m.szyprowski@samsung.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 11, 2020 at 10:57:02AM +0300, Dan Carpenter wrote:
> On Mon, Aug 10, 2020 at 08:41:14PM +0200, Marion & Christophe JAILLET wro=
te:
> > =

> > Le 10/08/2020 =E0 17:42, Dan Carpenter a =E9crit=A0:
> > > On Sun, Aug 09, 2020 at 10:34:06PM +0200, Christophe JAILLET wrote:
> > > > When '*sgt' is allocated, we must allocated 'sizeof(**sgt)' bytes i=
nstead
> > > > of 'sizeof(*sg)'. 'sg' (i.e. struct scatterlist) is smaller than
> > > > 'sgt' (i.e struct sg_table), so this could lead to memory corruptio=
n.
> > > The sizeof(*sg) is bigger than sizeof(**sgt) so this wastes memory but
> > > it won't lead to corruption.
> > > =

> > >      11  struct scatterlist {
> > >      12          unsigned long   page_link;
> > >      13          unsigned int    offset;
> > >      14          unsigned int    length;
> > >      15          dma_addr_t      dma_address;
> > >      16  #ifdef CONFIG_NEED_SG_DMA_LENGTH
> > >      17          unsigned int    dma_length;
> > >      18  #endif
> > >      19  };
> > > =

> > >      42  struct sg_table {
> > >      43          struct scatterlist *sgl;        /* the list */
> > >      44          unsigned int nents;             /* number of mapped =
entries */
> > >      45          unsigned int orig_nents;        /* original size of =
list */
> > >      46  };
> > > =

> > > regards,
> > > dan carpenter
> > =

> > =

> > My bad. I read 'struct scatterlist sgl' (without the *)
> > Thanks for the follow-up, Dan.
> > =

> > Doesn't smatch catch such mismatch?
> > (I've not run smatch for a while, so it is maybe reported)
> =

> That's why I was investigating it, because Smatch didn't catch it.
> =

> Smatch would have warned if it led to memory corruption.  Smatch also
> tries to detect struct mismatches as a separate check but for some
> reason it missed it.  I'm not totally sure why yet.  I suspect that it's
> a complicated internal reason where Sparse is the sizeof to a normal

s/is/changes/

> number...  It's a known issue and hard to fix.

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

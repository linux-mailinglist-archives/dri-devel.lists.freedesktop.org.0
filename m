Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC918BADDE
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 15:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DAC41127EB;
	Fri,  3 May 2024 13:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="OkOB9RfS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5932F1127EB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 13:40:30 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 443CLH05026098;
 Fri, 3 May 2024 13:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=OTB8nHFLPaquXF5F/bBkNoQstl6p52xaF/pLsiIiK+E=; b=Ok
 OB9RfSaE7dFEwpgN2ng24tTsRGHoRUdPZRLivDNQc4Kt5kpR4600xo8WiRIWzXjJ
 sZabYLm8mWq8xYidXK8lDUJcMMH1FsPlkh0TngbWtId51nBXMhlkVPvZIU8nbLY3
 Gi0thrgzD648jWAhKJW7Ke+pEi8oRF3wO9aer31NVSl9HctOKpORMHlLAPRA2gjV
 UB9tX1NMJxom6EfLvAzi/5wBE8XEVyknmVz4UjXit1TTr0pfZfmGV5hT7jtZ7DXH
 wvL9+Cqaue8c8sDGaMFH4KFDrL7FebKh4G2nslCXk6TphxdCR2J4/M+FO1dRWt8x
 Anesn5ZMPjLpX9Xrh4ug==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xv7pxk1jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 May 2024 13:40:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 443DeOCE027742
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 3 May 2024 13:40:24 GMT
Received: from [10.214.66.164] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 May 2024
 06:40:21 -0700
Message-ID: <289b9ad6-58a3-aa39-48ae-a244fe108354@quicinc.com>
Date: Fri, 3 May 2024 19:10:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, zhiguojiang
 <justinjiang@vivo.com>, "T.J. Mercier" <tjmercier@google.com>
CC: Sumit Semwal <sumit.semwal@linaro.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <opensource.kernel@vivo.com>
References: <20240327022903.776-1-justinjiang@vivo.com>
 <5cf29162-a29d-4af7-b68e-aac5c862d20e@amd.com>
 <cc7defae-60c1-4cc8-aee5-475d4460e574@vivo.com>
 <23375ba8-9558-4886-9c65-af9fe8e8e8b6@amd.com>
 <CABdmKX2Kf4ZmVzv3LGTz2GyP-9+rAtFY9hSAxdkrwK8mG0gDvQ@mail.gmail.com>
 <e55cad9b-a361-4d27-a351-f6a4f5b8b734@vivo.com>
 <40ac02bb-efe2-4f52-a4f2-7b56d9b93d2c@amd.com>
 <4fedd80c-d5b6-4478-bfd3-02d1ee1a26e5@vivo.com>
 <aab5ec51-fcff-44f2-a4f5-2979bd776a03@amd.com>
 <2ebca2fd-9465-4e64-b3cc-ffb88ef87800@vivo.com>
 <d4209754-5f26-422d-aca0-45cccbc44ad0@amd.com>
Content-Language: en-US
From: Charan Teja Kalla <quic_charante@quicinc.com>
In-Reply-To: <d4209754-5f26-422d-aca0-45cccbc44ad0@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Rg_pKWba3Akm2TNgCyjNcGyIoHI3gh5C
X-Proofpoint-ORIG-GUID: Rg_pKWba3Akm2TNgCyjNcGyIoHI3gh5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_09,2024-05-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2405030098
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

Thanks Christian/TJ for the inputs!!

On 4/18/2024 12:16 PM, Christian König wrote:
> As far as I can see the EPOLL holds a reference to the files it
> contains. So it is perfectly valid to add the file descriptor to EPOLL
> and then close it.
>
> In this case the file won't be closed, but be kept alive by it's
> reference in the EPOLL file descriptor.

I am not seeing that adding a 'fd' into the epoll monitoring list will
increase its refcount.  Confirmed by writing a testcase that just do
open + EPOLL_CTL_ADD and see the /proc/../fdinfo of epoll fd(Added
file_count() info to the output)
# cat /proc/136/fdinfo/3
pos:    0
flags:  02
mnt_id: 14
ino:    1041
tfd:        4 events:       19 data:                4  pos:0 ino:81 sdev:5
refcount: 1<-- The fd added to the epoll monitoring is still 1(same as
open file refcount)

From the code too, I don't see a file added in the epoll monitoring list
will have an extra refcount but momentarily (where it increases the
refcount of target file, add it to the rbtree of the epoll context and
then decreasing the file refcount):
do_epoll_ctl():
	f = fdget(epfd);
	tf = fdget(fd);
	epoll_mutex_lock(&ep->mtx)
	EPOLL_CTL_ADD:
		ep_insert(ep, epds, tf.file, fd, full_check); // Added to the epoll
monitoring rb tree list as epitem.
	mutex_unlock(&ep->mtx);
	fdput(tf);
	fdput(f);


Not sure If i am completely mistaken what you're saying here.

> The fs layer which calls dma_buf_poll() should make sure that the file
> can't go away until the function returns.
> 
> Then inside dma_buf_poll() we add another reference to the file while
> installing the callback:
> 
>                         /* Paired with fput in dma_buf_poll_cb */
>                         get_file(dmabuf->file); No, exactly that can't
> happen either.
> 

I am not quite comfortable with epoll internals but I think below race
is possible where "The 'file' passed to dma_buf_poll() is proper but
->f_count == 0, which is indicating that a parallel freeing is
happening". So, we should check the file->f_count value before taking
the refcount.

(A 'fd' registered for the epoll monitoring list is maintained as
'epitem(epi)' in the rbtree of 'eventpoll(ep, called as epoll context).

epoll_wait()				    __fput()(as file->f_count=0)
------------------------------------------------------------------------
a) ep_poll_callback():
     Is the waitqueue function
   called when signaled on the
   wait_queue_head_t of the registered
   poll() function.

   1) It links the 'epi' to the ready list
      of 'ep':
       if (!ep_is_linked(epi))
	 list_add_tail_lockless(&epi->rdllink,
		&ep->rdllist)

   2) wake_up(&ep->wq);
	Wake up the process waiting
	on epoll_wait() that endup
	in ep_poll.


b) ep_poll():
    1) while (1) {
	eavail = ep_events_available(ep);
	(checks ep->rdlist)
	ep_send_events(ep);
	(notify the events to user)
    }
    (epoll_wait() calling process gets
     woken up from a.2 and process the
     events raised added to rdlist in a.1)

   2) ep_send_events():
	mutex_lock(&ep->mtx);
	(** The sync lock is taken **)
	list_for_each_entry_safe(epi, tmp,
			&txlist, rdllink) {
	    list_del_init(&epi->rdllink);
	    revents = ep_item_poll(epi, &pt, 1)
	    (vfs_poll()-->...f_op->poll(=dma_buf_poll)
	}
	mutex_unlock(&ep->mtx)
	(**release the lock.**)

	(As part of procession of events,
	 each epitem is removed from rdlist
         and call the f_op->poll() of a file
	 which will endup in dma_buf_poll())

   3) dma_buf_poll():
 	get_file(dmabuf->file);
	(** f_count changed from 0->1 **)
	dma_buf_poll_add_cb(resv, true, dcb):
	(registers dma_buf_poll_cb() against fence)


				c) eventpoll_release_file():
				   mutex_lock(&ep->mtx);
				   __ep_remove(ep, epi, true):
				   mutex_unlock(&ep->mtx);
				  (__ep_remove() will remove the
				   'epi' from rbtree and if present
				   from rdlist as well)

				d) file_free(file), free the 'file'.

e) dma_buf_poll_cb:
 /* Paired with get_file in dma_buf_poll */
 fput(dmabuf->file);
 (f_count changed from 1->0, where
  we try to free the 'file' again
  which is UAF/double free).


		
In the above race, If c) gets called first, then the 'epi' is removed
from both rbtree and 'rdlink' under ep->mtx lock thus b.2 don't end up
in calling the ->poll() as it don't see this event in the rdlist.

Race only exist If b.2 executes first, where it will call dma_buf_poll
with __valid 'struct file' under ep->mtx but its refcount is already
could have been zero__. Later When e) is executed, it turns into double
free of the 'file' structure.

If you're convinced with the above race, should the fix here will be
this simple check:
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8fe5aa67b167..e469dd9288cc
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -240,6 +240,10 @@ static __poll_t dma_buf_poll(struct file *file,
poll_table *poll)
 	struct dma_resv *resv;
 	__poll_t events;

+	/* Check parallel freeing of file */
+	if (!file_count(file))
+		return 0;
+

Thanks,
Charan
